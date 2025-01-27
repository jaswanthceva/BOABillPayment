# frozen_string_literal: true

module Payment
  class PaymentObject
    attr_reader :params
    attr_accessor :id

    def initialize(params)
      if params.is_a?(Hash)
        @params = params
        assign_attributes(@params)
      elsif params.is_a?(String)
        @params = { id: params }
        assign_attributes(@params)
      else
        @params = {}
      end
    end

    def parse_response(response)
      @params = response
      assign_attributes(response)
      self
    end

    def attributes
      attrs = {}
      instance_variables.reject { |var| var == '@params' }.each do |var|
        str = var.to_s.gsub(/^@/, '')
        next unless respond_to?("#{str}=")

        instance_var = instance_variable_get(var)
        if Util.object_classes[str]
          if instance_var.is_a?(BillsPaymentObject)
            attrs[Util.to_camel_case_lower(str).to_sym] = parse_bills_payment_obj(instance_var)
          elsif instance_var.is_a?(Array)
            objs = []
            instance_var.each do |object|
              objs << parse_billspayment_obj(object)
            end
            attrs[Util.to_camel_case_lower(str).to_sym] = objs
          else
            attrs[Util.to_camel_case_lower(str).to_sym] = instance_var
          end
        else
          attrs[Util.to_camel_case_lower(str).to_sym] = instance_var
        end
      end
      attrs
    end

    def class_name
      self.class.name.split('::').last
    end

    def api_url
      "#{CGI.escape(class_name.downcase)}s"
    end

    private

    def parse_bills_payment_obj(obj)
      return unless obj.is_a?(BillsPaymentObject)

      if obj.respond_to?('id') && obj.id && (obj.is_a?(Destination) || obj.is_a?(Recipient) || obj.is_a?(Task))
        obj.id
      else
        obj.attributes
      end
    end

    def assign_attributes(params)
      params.each do |key, value|
        key_underscore = Util.to_underscore(key)

        if (klass = Util.object_classes[key.to_s])
          case value
          when Array
            objs = []
            value.each do |v|
              objs << klass.new(v)
            end
            value = objs
          when Hash
            value = klass.new(value)
          end
        end

        if respond_to?("#{key_underscore}=")
          send(:"#{key_underscore}=", value)
        else
          add_attrs(key_underscore.to_s => value)
        end
      end
    end

    def add_attrs(attrs)
      attrs.each do |var, value|
        self.class.class_eval { attr_accessor var }
        instance_variable_set "@#{var}", value
      end
    end
  end
end
