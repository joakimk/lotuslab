Some experimentation with lotus-model.

Requires postgres.

    createdb lotuslab
    bundle
    rake spec
    rake spec:unit

Things to figure out:
* Associations
  * Belongs to
  * Has many
  * Has many through
* Escaping in SQL queries
* Simplifications, not everything needs custom mappings and repository.
* Explore using in-memory for use-case level tests that would otherwise be integrated tests.
