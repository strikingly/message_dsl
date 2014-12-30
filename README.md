# Unified Message DSL

A DSL that unifies the message format of RESTful API responses and job results.

## Get started

### Add the gem to your Gemfile

```
gem 'message_dsl', :git => 'https://github.com/strikingly/message_dsl.git'
```

### Generate messsage layout

```
rails generate message_layout Your::Controller::Namespace
```

Example:

```
rails generate message_layout RestApi::V1
```

will generate a layout file at ```app/views/layouts/rest_api/v1/application.json.erb```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push the change (`git push origin my-new-feature`)
5. Create new Pull Request
