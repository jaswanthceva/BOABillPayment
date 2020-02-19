# Payment
Short description and motivation.

## Usage
How to use my plugin.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'payment'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install payment
```

## Load Category
**Post**
```ruby
worker = Payment::Worker.load_category
```

## Load Billers
**Post**
```ruby
worker = Payment::Worker.do_payment(id)
```

## Do payment
**Post**
```ruby
worker = Payment::Worker.post({id: '879873', customerRef: '9725312313', billerId: 1244, narration: "airtime top up", accountNumber: "1231231233", paymentDate: "2019-01-01" })
```

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
