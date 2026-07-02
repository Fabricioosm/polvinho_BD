SET search_path TO polvinho;

CREATE TABLE users_submissions(
	id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
	id_submissions UUID REFERENCES submissions(id) NOT NULL,
	id_user UUID REFERENCES users(id) NOT NULL,
	grade NUMERIC NULL,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	deleted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO schema_migrations (version, name_migration) VALUES ('012', 'create_users_submissions') ON CONFLICT (version) DO NOTHING;

