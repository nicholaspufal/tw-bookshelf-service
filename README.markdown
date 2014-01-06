## ThoughtWorks Bookshelf (Service)

For security purposes, the config files doesn't contain any sensitive information. Plus, the integration tests rely on data that is only available in the prod DB. That's expected now, but as soon as all of the CRUD endpoints are created this approach will be improved.

There are two endpoints: one for POA and one for Recife library.

Usage example:

	curl http://localhost:9393/books/poa

It will return a JSON by default.
