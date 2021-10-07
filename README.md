OmniAuth Webex
==============

The [Webex](https://webex.com) strategy for [OmniAuth](https://github.com/omniauth/omniauth).

## DESCRIPTION

The Webex strategy for OmniAuth. This is for [Webex Integrations](https://developer.webex.com/docs/integrations) to allow a user to OAuth with a Webex instance and get access to it's API.

## INSTALLATION

Add the following to your `Gemfile`:

```
gem "omniauth-webex"
```

And then run `bundle install`

## USAGE

`OmniAuth::Strategies::Webex` is simply a Rack middleware. Read the OmniAuth docs detailed instructions https://github.com/omniauth/omniauth.

### Rails app

For a Rails app, you will need to configure it by creating an initializer in `config/initializers/omniauth.rb`. The following is an example:

```
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV["WEBEX_CLIENT_ID"], ENV["WEBEX_CLIENT_SECRET"],
    provider_ignores_state: true,
    scope: "spark:people_read"
end
```

### Sinatra app

For a Sinatra app, you will need to configure your Sinatra app to use the middleware. The following is an example:

```
class MyApp < Sinatra::Base
  configure do
    set :sessions, true
  end

  use OmniAuth::Builder do
    provider :webex, ENV["WEBEX_CLIENT_ID"], ENV["WEBEX_CLIENT_SECRET"],
      provider_ignores_state: true,
      scope: "spark:people_read"
  end
end
```

### Auth Hash

Here is an example of the data that will be available in `request.env["omniauth.auth"]`

```
{
  "provider": "webex",
  "uid": "YsdkjdfjdfklsfHDF",
  "info"=> {
    "id": "YsdkjdfjdfklsfHDF",
    "emails": ["jimmy@example.com"],
    "phoneNumbers": [],
    "displayName": "Jimmy Page",
    "nickName": "jimmy",
    "firstName": "Jimmy",
    "lastName": "Page",
    "avatar": "https://avatar-prod-us-west-2.webexcontent.com/Avtr~auyadskasdhhd",
    "orgId": "YHDHDKidhaH",
    "created": "2021-08-19T20:59:20.767Z",
    "lastModified": "2021-10-06T15:01:06.205Z",
    "lastActivity": "2021-10-07T16:14:41.441Z",
    "status": "active",
    "type": "person"
  },
  "credentials": {
    "token":  "HGDT7DGHyds",
    "refresh_token":  "Zhdjks6GHD",
    "expires_at": 1634832891,
    "expires": true
  },
  "extra": {
    "raw_info": {
      "id": "YsdkjdfjdfklsfHDF",
      "emails": ["jimmy@example.com"],
      "phoneNumbers": [],
      "displayName": "Jimmy Page",
      "nickName": "jimmy",
      "firstName": "Jimmy",
      "lastName": "Page",
      "avatar":  "https://avatar-prod-us-west-2.webexcontent.com/Avtr~auyadskasdhhd",
      "orgId":  "YHDHDKidhaH",
      "created": "2021-08-19T20:59:20.767Z",
      "lastModified": "2021-10-06T15:01:06.205Z",
      "lastActivity": "2021-10-07T16:14:41.441Z",
      "status": "active",
      "type": "person"
    }
  }
}
```

## RUNNING TESTS

This project is covered by unit tests. They can be run with the following command.

```
bundle exec rake spec
```

## CONTRIBUTING

1. Fork the repository `gh repo fork https://github.com/jwright/omniauth-webex`
1. Create a feature branch `git checkout -b my-awesome-feature`
1. Codez!
1. Commit your changes (small commits please)
1. Push your new branch `git push origin my-awesome-feature`
1. Create a pull request `gh pr create --head my-fork:my-awesome-feature`

## LICENSE

This project is licensed under the [MIT License](LICENSE.md).
