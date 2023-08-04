# Audited::Ui

A UI for [audited](https://github.com/collectiveidea/audited), a [Ruby on Rails](https://rubyonrails.org) extension for auditing models.

## Installation

Add this line to your application's Gemfile:

```ruby
gem "audited-ui"
```

And then execute:

```bash
$ bundle
```

Or install it yourself as:

```bash
$ gem install audited-ui
```

## Usage

Mount the engine in `config/routes.rb`:

```ruby
# after root url
mount Audited::Ui::Engine, at: "/"
```

And then just link it:

```erb
<%= link_to "Audit all records", audited_ui.audits_path %>
<%= link_to "Audit all people records", audited_ui.auditable_type_audits_path(auditable_type: "person") %>
<%= link_to "Audit this person", audited_ui.auditable_audits_path(auditable_type: "person", auditable_id: person.id) %>
```

There's a single controller that's smart enough to understand if we want to show all audit records, all audit records for a given `auditable_type` (aka class) or `auditable` (aka object/record). For example, you can visit [http://localhost:3000/audits](http://localhost:3000/audits) and it will show all audited records, [http://localhost:3000/audits/person](http://localhost:3000/audits/person) and it will show all audited records for the `Person` model and [http://localhost:3000/audits/person/1](http://localhost:3000/audits/person/1) and it will show all audited records for `Person.find(1)`.

### Customizing views

If you already set it up, you'll notice that audited-ui comes with a barebone UI that you can use. But, purposedly, the UI is very simple. The idea is that you can use it if it's good enough, but in most cases you should customize it to match your application's UI.

To generate the views simply run:

```bash
$ bundle exec rails g audited:ui:views
```

### I18n

Every string is I18ned, even class and attributes names. See [this guide](https://guides.rubyonrails.org/i18n.html#translations-for-active-record-models) if you want to translate your audited models and attributes.

By default only english and spanish are supported. You can add other locales by copying the content of [this file](https://github.com/sinaptia/audited-ui/blob/main/config/locales/en.yml) into your app's `config/locale/yourlocale.yml` and translating the given strings. And if you do that send a PR :P .

If you need to customize just one string, copy that string in your app's locale file:

```yml
en:
  audited:
    ui:
      audits:
        index:
          title:
            all: Auditing everything
```

## TODO

- [ ] Mount the engine with a method, similar to `devise_for`, so we can have more and better control on routes.
- [ ] AuditedUI configuration, if we need to configure anything.
- [ ] Ready to use views (tailwind/bootstrap), if it makes sense.
- [ ] Filters (by user, by dates, by changed attribute).
- [x] Sort by column.
- [ ] Revert to a specific version.
- [ ] Tests.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
