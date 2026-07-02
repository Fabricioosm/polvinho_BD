SET search_path TO polvinho;

CREATE TABLE users_courses(
	id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
	id_course UUID REFERENCES courses(id) NOT NULL,
	id_user UUID REFERENCES users(id) NOT NULL,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	deleted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO schema_migrations (version, name_migration) VALUES ('005', 'create_users_courses') ON CONFLICT (version) DO NOTHING;