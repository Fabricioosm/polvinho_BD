SET search_path TO polvinho;

CREATE TABLE submissions(
	id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
	id_assignment UUID REFERENCES assignments(id) NOT NULL,
	description TEXT NULL,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	deleted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO schema_migrations (version, name_migration) VALUES ('011', 'create_submissions') ON CONFLICT (version) DO NOTHING;