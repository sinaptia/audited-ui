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

After installing it, run the generator:

```bash
$ rails g audited:ui
```

This generator will create the audits controller, helpers and views that will allow you to audit all records of all types, all records of a given auditable type, or all records of a given auditable object.

Audit all records by linking to `audits_path`, like this:

```erb
<%= link_to "Audit all records", audits_path %>
```

Or just a specific auditable type, using `auditable_type_audits_path`, like this:

```erb
<%= link_to "Audit all people records", auditable_type_audits_path(auditable_type: "people") %>
```

Or a specific record, using `auditable_audits_path`, like this:

```erb
<%= link_to "Audit this person", auditable_audits_path(auditable_type: "people", auditable_id: person.id) %>
```

### I18n

Every string is I18ned, even class and attributes names. See [this guide](https://guides.rubyonrails.org/i18n.html#translations-for-active-record-models) if you want to translate your audited models and attributes.

By default only english and spanish are supported.

## TODO

- [ ] Revert to a specific version.
- [ ] Generate tests.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
