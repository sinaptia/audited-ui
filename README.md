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

By just installing it, audited-ui will add the following routes:

```
/audited/audits
/audited/audits/:auditable_type
/audited/audits/:auditable_type/:auditable_id
```

that will allow you to audit all records of all types, all records of a given auditable type, or all records of a given auditable object, respectively.

Audit all records by linking to `audited_audits_path`, like this:

```erb
<%= link_to "Audit all records", audited_audits_path %>
```

Or just a specific auditable type, using `audited_auditable_type_audits_path`, like this:

```erb
<%= link_to "Audit all people records", audited_auditable_type_audits_path(auditable_type: "person") %>
```

Or a specific record, using `audited_auditable_audits_path`, like this:

```erb
<%= link_to "Audit this person", audited_auditable_audits_path(auditable_type: "person", auditable_id: person.id) %>
```

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

- [x] Mount the engine with a method, similar to `devise_for`, so we can have more and better control on routes.
- [ ] AuditedUI configuration, if we need to configure anything.
- [ ] Ready to use views (tailwind/bootstrap), if it makes sense.
- [x] Filters (by user, by dates, by changed attribute).
- [x] Sort by column.
- [ ] Revert to a specific version.
- [ ] Tests.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
