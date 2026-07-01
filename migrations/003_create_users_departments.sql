SET search_path TO polvinho;

CREATE TABLE users_departments(
	id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
	id_department UUID REFERENCES departments(id) NOT NULL,
	id_user UUID REFERENCES users(id) NOT NULL,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	deleted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO schema_migrations (version, name_migration) VALUES ('003', 'create_users_departments') ON CONFLICT (version) DO NOTHING;


