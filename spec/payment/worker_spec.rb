# frozen_string_literal: true

RSpec.describe Payment::Worker do
  let(:worker) { described_class.new(params) }
  let(:params) { { id: '879873', customerRef: '9725312313', billerId: '1244', narration: 'airtime top up', accountNumber: '1231231233', paymentDate: '2019-01-01' } }

  describe ".load_billers" do
    subject { -> { described_class.post(id) } }
    let(:id) { '3' }
    it_should_behave_like Payment::Actions::Post, path: 'workers/3'
  end

  describe ".load_category" do
    it_should_behave_like Payment::Actions::Post, path: 'workers'
  end

  describe ".query_by_metadata" do
    subject { -> { described_class.query_by_metadata(metadata) } }
    let(:metadata) { { id: '879873', customerRef: '9725312313', billerId: '1244', narration: 'airtime top up', accountNumber: '1231231233', paymentDate: '2019-01-01' } }
    it_should_behave_like Payment::Actions::QueryMetadata, path: 'workers'
  end
end
