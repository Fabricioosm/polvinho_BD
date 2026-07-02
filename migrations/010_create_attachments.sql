SET search_path TO polvinho;

DO $$
BEGIN
	IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'enum_type_attachment' ) THEN
		CREATE TYPE enum_type_attachment AS ENUM ('assignments', 'materials', 'submissions');
	END IF;
	IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'enum_type_attachable') THEN
		CREATE TYPE enum_type_attachable AS ENUM ('links', 'images', 'archive', 'documents' );
	END IF;
END $$;

CREATE TABLE attachments(
	id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
	created_by UUID REFERENCES users(id) NOT NULL,
	id_attachable UUID NOT NULL,
	attachable_type enum_type_attachable NOT NULL,
	attachment_type enum_type_attachment NOT NULL,
	base_url VARCHAR(2048) NULL,
	path VARCHAR(2048) NULL,
	external_link VARCHAR(2048),
	file_size BIGINT NULL,
	file_extension VARCHAR(10) NULL,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	deleted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO schema_migrations (version, name_migration) VALUES ('010','create_attachments') ON CONFLICT (version) DO NOTHING;