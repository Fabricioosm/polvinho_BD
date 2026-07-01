SET search_path TO polvinho;

CREATE TABLE subjects(
	id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
	id_course UUID REFERENCES courses(id) NOT NULL,
	created_by UUID REFERENCES users(id) NOT NULL,
	title VARCHAR(100) NOT NULL,
	entity_code CHAR(9) UNIQUE NOT NULL,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	deleted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO schema_migrations (version, name_migration) VALUES ('006', 'create_subjects') ON CONFLICT (version) DO NOTHING;