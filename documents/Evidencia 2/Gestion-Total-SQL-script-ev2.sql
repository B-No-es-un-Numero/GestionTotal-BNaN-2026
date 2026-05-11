CREATE DATABASE IF NOT EXISTS gestion_total_app
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;
USE gestion_total_app;

CREATE TABLE IF NOT EXISTS `user_app_user` (
    `id` CHAR(32) NOT NULL,
    `password` VARCHAR(128) NOT NULL,
    `last_login` DATETIME(6) DEFAULT NULL,
    `is_superuser` TINYINT(1) NOT NULL,
    `is_staff` TINYINT(1) NOT NULL,
    `is_active` TINYINT(1) NOT NULL,
    `username` VARCHAR(150) NOT NULL,
    `first_name` VARCHAR(150) NOT NULL DEFAULT 'Name',
    `last_name` VARCHAR(150) NOT NULL DEFAULT 'Surname',
    `email` VARCHAR(150) NOT NULL,
    `role` VARCHAR(50) NOT NULL DEFAULT 'user',
    `enabled` TINYINT(1) NOT NULL DEFAULT 1,
    `date_joined` DATETIME(6) NOT NULL,
    `created_at` DATETIME(6) NOT NULL,
    `updated_at` DATETIME(6) NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `uk_user_username` (`username`),
    UNIQUE KEY `uk_user_email` (`email`)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `company_app_company` (
    `id` CHAR(32) NOT NULL,
    `name` VARCHAR(150) NOT NULL,
    `cuil` VARCHAR(20) NOT NULL,
    `phone` VARCHAR(20) DEFAULT NULL,
    `email` VARCHAR(254) NOT NULL,
    `enabled` TINYINT(1) NOT NULL,
    `created_at` DATETIME(6) NOT NULL,
    `updated_at` DATETIME(6) NOT NULL,

    PRIMARY KEY (`id`),
    UNIQUE KEY `uk_company_cuil` (`cuil`),
    UNIQUE KEY `uk_company_email` (`email`)
) ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `client_app_client` (
    `id` CHAR(32) NOT NULL,
    `name` VARCHAR(100) NOT NULL,
    `email` VARCHAR(254) NOT NULL,
    `dni` VARCHAR(8) NOT NULL,
    `date_of_birth` DATE NOT NULL,
    `phone` VARCHAR(20) DEFAULT NULL,
    `status` VARCHAR(10) NOT NULL,
    `company_id` CHAR(32) DEFAULT NULL,
    `responsible_user_id` CHAR(32) DEFAULT NULL,
    `enabled` TINYINT(1) NOT NULL,
    `created_at` DATETIME(6) NOT NULL,
    `updated_at` DATETIME(6) NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `uk_client_email` (`email`),
    UNIQUE KEY `uk_client_dni` (`dni`),
    KEY `fk_client_company` (`company_id`),
    KEY `fk_client_user` (`responsible_user_id`),

    CONSTRAINT `fk_client_company`
        FOREIGN KEY (`company_id`)
        REFERENCES `company_app_company` (`id`),

    CONSTRAINT `fk_client_user`
        FOREIGN KEY (`responsible_user_id`)
        REFERENCES `user_app_user` (`id`)
) ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `task_app_task` (
    `id` CHAR(32) NOT NULL,
    `title` VARCHAR(150) NOT NULL,
    `description` LONGTEXT,
    `due_date` DATE DEFAULT NULL,
    `status` VARCHAR(15) NOT NULL,
    `assigned_user_id` CHAR(32) NOT NULL,
    `client_id` CHAR(32) NOT NULL,
    `enabled` TINYINT(1) NOT NULL,
    `created_at` DATETIME(6) NOT NULL,
    `updated_at` DATETIME(6) NOT NULL,
    PRIMARY KEY (`id`),
    KEY `fk_task_user` (`assigned_user_id`),
    KEY `fk_task_client` (`client_id`),

    CONSTRAINT `fk_task_user`
        FOREIGN KEY (`assigned_user_id`)
        REFERENCES `user_app_user` (`id`),

    CONSTRAINT `fk_task_client`
        FOREIGN KEY (`client_id`)
        REFERENCES `client_app_client` (`id`)
) ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_0900_ai_ci;


/* INSERTIONS */

INSERT INTO `user_app_user`
(
    `id`,
    `password`,
    `last_login`,
    `is_superuser`,
    `is_staff`,
    `is_active`,
    `username`,
    `first_name`,
    `last_name`,
    `email`,
    `role`,
    `enabled`,
    `date_joined`,
    `created_at`,
    `updated_at`
)
VALUES

(
    '41e1f9a2c7d34f5ab8c1d2e3f4a5b01',
    'pbkdf2_sha256$1000000$hash01',
    NULL,
    1, 1, 1,
    'admin01',
    'Name',
    'Surname',
    'admin01@gestiontotal.com',
    'admin',
    1,
    '2026-01-03 08:00:00.000000',
    '2026-01-03 08:00:00.000000',
    '2026-04-02 09:20:00.000000'
),

(
    '52f2a0b3d8e45f6bc9d2e3f4a5b6c02',
    'pbkdf2_sha256$1000000$hash02',
    NULL,
    1, 1, 1,
    'admin02',
    'Name',
    'Surname',
    'admin02@gestiontotal.com',
    'admin',
    1,
    '2026-01-03 08:00:00.000000',
    '2026-01-06 09:10:00.000000',
    '2026-04-03 11:40:00.000000'
),

(
    '63a3b1c4e9f5607cad3e4f5a6b7c8d03',
    'pbkdf2_sha256$1000000$hash03',
    NULL,
    1, 1, 1,
    'user01',
    'Name',
    'Surname',
    'user01@gestiontotal.com',
    'user',
    1,
    '2026-01-03 08:00:00.000000',
    '2026-01-10 10:30:00.000000',
    '2026-04-04 14:00:00.000000'
),

(
    '74b4c2d5f0a6718dbe4f5a6b7c8d9e04',
    'pbkdf2_sha256$1000000$hash04',
    NULL,
    1, 1, 1,
    'user02',
    'Name',
    'Surname',
    'user02@gestiontotal.com',
    'user',
    1,
    '2026-01-03 08:00:00.000000',
    '2026-01-12 12:00:00.000000',
    '2026-04-05 16:15:00.000000'
),

(
    '85c5d3e6a1b7829ecf5a6b7c8d9e0f05',
    'pbkdf2_sha256$1000000$hash05',
    NULL,
    1, 1, 1,
    'user03',
    'Name',
    'Surname',
    'user03@gestiontotal.com',
    'user',
    1,
    '2026-01-03 08:00:00.000000',
    '2026-01-15 11:15:00.000000',
    '2026-04-07 09:50:00.000000'
),

(
    '96d6e4f7b2c8930fad6b7c8d9e0f1a06',
    'pbkdf2_sha256$1000000$hash06',
    NULL,
    1, 1, 1,
    'user04',
    'Name',
    'Surname',
    'user04@gestiontotal.com',
    'user',
    1,
    '2026-01-03 08:00:00.000000',
    '2026-01-18 15:40:00.000000',
    '2026-04-08 13:20:00.000000'
),

(
    'a7e7f508c3d9a14be7c8d9e0f1a2b07',
    'pbkdf2_sha256$1000000$hash07',
    NULL,
    1, 1, 1,
    'user05',
    'Name',
    'Surname',
    'user05@gestiontotal.com',
    'user',
    1,
    '2026-01-03 08:00:00.000000',
    '2026-01-22 08:25:00.000000',
    '2026-04-10 10:45:00.000000'
),

(
    'b8f80919d4eab25cf8d9e0f1a2b3c08',
    'pbkdf2_sha256$1000000$hash08',
    NULL,
    1, 1, 1,
    'user06',
    'Name',
    'Surname',
    'user06@gestiontotal.com',
    'user',
    1,
    '2026-01-03 08:00:00.000000',
    '2026-02-01 09:00:00.000000',
    '2026-04-12 15:30:00.000000'
);


INSERT INTO `company_app_company`
(`id`, `name`, `cuil`, `phone`, `email`, `enabled`, `created_at`, `updated_at`)
VALUES

('a1f4b9c2d7e84b57a3c1d6e9f2b4a001',
'Arcor SAIC',
'30-50279308-1',
'3514201001',
'contacto@arcor.com',
1,
'2026-01-05 09:15:00.000000',
'2026-04-02 11:40:00.000000'),

('b2e5c0d3f8a94c68b4d2e7f0a3c5b002',
'Mercado Libre SRL',
'30-70308853-4',
'3514201002',
'marketing@mercadolibre.com',
1,
'2026-01-08 10:20:00.000000',
'2026-04-03 14:10:00.000000'),

('c3f6d1e4a9b05d79c5e3f8a1b4d6c003',
'Globant SA',
'30-70821335-7',
'3514201003',
'corporativo@globant.com',
1,
'2026-01-12 13:05:00.000000',
'2026-04-04 10:00:00.000000'),

('d4a7e2f5b0c16e8ad6f4a9b2c5e7d004',
'YPF SA',
'30-54668997-9',
'3514201004',
'clientes@ypf.com',
1,
'2026-01-15 15:40:00.000000',
'2026-04-05 16:30:00.000000'),

('e5b8f3a6c1d27f9be7a5b0c3d6f8e005',
'Personal Flow',
'30-64145357-6',
'3514201005',
'contacto@personal.com.ar',
1,
'2026-01-18 11:25:00.000000',
'2026-04-07 09:50:00.000000'),

('f6c9a4b7d2e380acf8b6c1d4e7a9f006',
'Banco Galicia',
'30-50000173-3',
'3514201006',
'marketing@bancogalicia.com.ar',
1,
'2026-01-22 08:45:00.000000',
'2026-04-08 13:15:00.000000'),

('07dab5c8e3f491bd09c7d2e5f8a0b07',
'Despegar.com',
'30-69284574-1',
'3514201007',
'prensa@despegar.com',
1,
'2026-02-01 14:10:00.000000',
'2026-04-10 12:20:00.000000'),

('18ebc6d9f4a502ce1ad8e3f6a9b1c08',
'Coca-Cola FEMSA Argentina',
'30-70712865-8',
'3514201008',
'contacto@cocacola.com.ar',
1,
'2026-02-05 09:30:00.000000',
'2026-04-12 15:40:00.000000'),

('29fcd7e0a5b613df2be9f4a7b0c2d09',
'Mastellone Hnos SA',
'30-54712456-0',
'3514201009',
'info@mastellone.com.ar',
1,
'2026-02-10 16:00:00.000000',
'2026-04-15 10:35:00.000000'),

('3ad0e8f1b6c724e03cf0a5b8c1d3e10',
'Grupo Clarin',
'30-50612418-2',
'3514201010',
'corporativo@clarin.com',
1,
'2026-02-15 10:50:00.000000',
'2026-04-18 17:10:00.000000');


INSERT INTO `client_app_client`
(
    `id`,
    `name`,
    `email`,
    `dni`,
    `date_of_birth`,
    `phone`,
    `status`,
    `company_id`,
    `responsible_user_id`,
    `enabled`,
    `created_at`,
    `updated_at`
)
VALUES

('ecb13c4df7bde58f1a2b3c4d5e6f7021',
'Carlos Ramirez',
'carlos.ramirez@gmail.com',
'30111222',
'1990-03-12',
'3515101001',
'lead',
'a1f4b9c2d7e84b57a3c1d6e9f2b4a001',
'63a3b1c4e9f5607cad3e4f5a6b7c8d03',
1,
'2026-01-05 10:00:00.000000',
'2026-04-02 11:00:00.000000'),

('fcd24d5ea8cef6902b3c4d5e6f7a8022',
'Lucia Torres',
'lucia.torres@gmail.com',
'30111223',
'1988-07-25',
'3515101002',
'active',
'b2e5c0d3f8a94c68b4d2e7f0a3c5b002',
'74b4c2d5f0a6718dbe4f5a6b7c8d9e04',
1,
'2026-01-08 09:30:00.000000',
'2026-04-03 14:20:00.000000'),

('0de35e6fb9dfa7a13c4d5e6f7a8b9023',
'Martin Suarez',
'martin.suarez@gmail.com',
'30111224',
'1992-09-14',
'3515101003',
'closed',
'c3f6d1e4a9b05d79c5e3f8a1b4d6c003',
'85c5d3e6a1b7829ecf5a6b7c8d9e0f05',
1,
'2026-01-12 11:40:00.000000',
'2026-04-04 10:30:00.000000'),

('1ef46f70cad0b8b24d5e6f7a8b9c0024',
'Valeria Gomez',
'valeria.gomez@gmail.com',
'30111225',
'1989-11-08',
'3515101004',
'active',
'd4a7e2f5b0c16e8ad6f4a9b2c5e7d004',
'41e1f9a2c7d34f5ab8c1d2e3f4a5b01',
1,
'2026-01-15 13:20:00.000000',
'2026-04-05 15:40:00.000000'),

('2f057081dbe1c9c35e6f7a8b9c0d1025',
'Nicolas Acosta',
'nicolas.acosta@gmail.com',
'30111226',
'1995-01-18',
'3515101005',
'lead',
'e5b8f3a6c1d27f9be7a5b0c3d6f8e005',
'63a3b1c4e9f5607cad3e4f5a6b7c8d03',
1,
'2026-01-18 16:10:00.000000',
'2026-04-07 09:15:00.000000'),

('30168192ecf2dad46f7a8b9c0d1e2026',
'Camila Diaz',
'camila.diaz@gmail.com',
'30111227',
'1993-04-30',
'3515101006',
'active',
'f6c9a4b7d2e380acf8b6c1d4e7a9f006',
'74b4c2d5f0a6718dbe4f5a6b7c8d9e04',
1,
'2026-01-22 10:30:00.000000',
'2026-04-08 12:10:00.000000'),

('412792a3f0a3ebe5708b9c0d1e2f3027',
'Fernando Luna',
'fernando.luna@gmail.com',
'30111228',
'1987-06-11',
'3515101007',
'closed',
'07dab5c8e3f491bd09c7d2e5f8a0b07',
'85c5d3e6a1b7829ecf5a6b7c8d9e0f05',
1,
'2026-02-01 08:40:00.000000',
'2026-04-10 11:50:00.000000'),

('5238a3b4a1b4fcf6819c0d1e2f3a4028',
'Agustina Vega',
'agustina.vega@gmail.com',
'30111229',
'1996-10-05',
'3515101008',
'active',
'18ebc6d9f4a502ce1ad8e3f6a9b1c08',
'41e1f9a2c7d34f5ab8c1d2e3f4a5b01',
1,
'2026-02-05 09:50:00.000000',
'2026-04-12 14:40:00.000000'),

('6349b4c5b2c50df7920d1e2f3a4b5029',
'Sebastian Rios',
'sebastian.rios@gmail.com',
'30111230',
'1991-02-20',
'3515101009',
'lead',
'29fcd7e0a5b613df2be9f4a7b0c2d09',
'63a3b1c4e9f5607cad3e4f5a6b7c8d03',
1,
'2026-02-10 15:15:00.000000',
'2026-04-15 10:10:00.000000'),

('745ac5d6c3d61ef8a31e2f3a4b5c6030',
'Florencia Medina',
'florencia.medina@gmail.com',
'30111231',
'1994-12-09',
'3515101010',
'active',
'3ad0e8f1b6c724e03cf0a5b8c1d3e10',
'74b4c2d5f0a6718dbe4f5a6b7c8d9e04',
1,
'2026-02-15 11:00:00.000000',
'2026-04-18 16:20:00.000000');


INSERT INTO `task_app_task`
(
    `id`,
    `title`,
    `description`,
    `due_date`,
    `status`,
    `assigned_user_id`,
    `client_id`,
    `enabled`,
    `created_at`,
    `updated_at`
)
VALUES

('856bd6e7d4e72f09b42f3a4b5c6d7031',
'Campaña de lanzamiento de snacks saludables Arcor',
'Diseñar y coordinar anuncios pagos en Meta Ads y TikTok para el lanzamiento nacional de nuevos productos saludables.',
'2026-05-10',
'pending',
'63a3b1c4e9f5607cad3e4f5a6b7c8d03',
'ecb13c4df7bde58f1a2b3c4d5e6f7021',
1,
'2026-01-06 09:40:00.000000',
'2026-04-02 11:20:00.000000'),

('967ce7f8e5f8301ac53a4b5c6d7e8032',
'Optimización de campañas de conversión Mercado Libre',
'Analizar métricas de adquisición y ajustar segmentaciones para aumentar conversiones en campañas de performance.',
'2026-05-14',
'in_progress',
'74b4c2d5f0a6718dbe4f5a6b7c8d9e04',
'fcd24d5ea8cef6902b3c4d5e6f7a8022',
1,
'2026-01-10 12:10:00.000000',
'2026-04-03 14:50:00.000000'),

('a78df809f6a9412bd64b5c6d7e8f9033',
'Campaña de employer branding Globant',
'Coordinar contenidos audiovisuales y publicaciones orientadas a posicionamiento de marca empleadora en LinkedIn.',
'2026-05-18',
'done',
'85c5d3e6a1b7829ecf5a6b7c8d9e0f05',
'0de35e6fb9dfa7a13c4d5e6f7a8b9023',
1,
'2026-01-12 14:30:00.000000',
'2026-04-04 10:45:00.000000'),

('b89e0910a7ba523ce75c6d7e8f9a0034',
'Programa de fidelización digital YPF Serviclub',
'Desarrollar automatizaciones de email marketing y promociones segmentadas para aumentar recurrencia.',
'2026-05-22',
'in_progress',
'41e1f9a2c7d34f5ab8c1d2e3f4a5b01',
'1ef46f70cad0b8b24d5e6f7a8b9c0024',
1,
'2026-01-16 11:20:00.000000',
'2026-04-05 16:00:00.000000'),

('c9af1a21b8cb634df86d7e8f9a0b1035',
'Rediseño de pauta multiplataforma Personal Flow',
'Actualizar copies publicitarios, banners y segmentación para campañas de captación de clientes móviles.',
'2026-05-25',
'cancelled',
'63a3b1c4e9f5607cad3e4f5a6b7c8d03',
'2f057081dbe1c9c35e6f7a8b9c0d1025',
1,
'2026-01-20 10:40:00.000000',
'2026-04-07 09:40:00.000000'),

('dab02b32c9dc7450f97e8f9a0b1c2036',
'Campaña de captación para tarjetas Banco Galicia',
'Implementar campañas digitales orientadas a adquisición de nuevos usuarios de tarjetas premium.',
'2026-05-28',
'pending',
'74b4c2d5f0a6718dbe4f5a6b7c8d9e04',
'30168192ecf2dad46f7a8b9c0d1e2026',
1,
'2026-01-24 13:50:00.000000',
'2026-04-08 12:45:00.000000'),

('ebc13c43daed8561f08f9a0b1c2d3037',
'Campaña de temporada alta Despegar',
'Desarrollar anuncios de remarketing y campañas segmentadas para aumentar reservas turísticas.',
'2026-06-02',
'done',
'85c5d3e6a1b7829ecf5a6b7c8d9e0f05',
'412792a3f0a3ebe5708b9c0d1e2f3027',
1,
'2026-02-02 09:10:00.000000',
'2026-04-10 12:15:00.000000'),

('fcd24d54ebfe9672f19a0b1c2d3e4038',
'Activación de marca Coca-Cola FEMSA para evento deportivo',
'Coordinar influencers, cobertura digital y contenido en tiempo real para acciones promocionales.',
'2026-06-05',
'in_progress',
'41e1f9a2c7d34f5ab8c1d2e3f4a5b01',
'5238a3b4a1b4fcf6819c0d1e2f3a4028',
1,
'2026-02-06 11:30:00.000000',
'2026-04-12 15:00:00.000000'),

('0de35e65fc0fa783f2ab1c2d3e4f5039',
'Estrategia de reposicionamiento Mastellone',
'Analizar percepción de consumidores y diseñar campañas orientadas a público joven.',
'2026-06-10',
'pending',
'63a3b1c4e9f5607cad3e4f5a6b7c8d03',
'6349b4c5b2c50df7920d1e2f3a4b5029',
1,
'2026-02-10 14:00:00.000000',
'2026-04-15 10:40:00.000000'),

('1ef46f760d10b894f3bc2d3e4f5a6040',
'Producción de contenido promocional Grupo Clarin',
'Coordinar piezas audiovisuales y anuncios digitales para aumentar suscripciones online.',
'2026-06-14',
'done',
'74b4c2d5f0a6718dbe4f5a6b7c8d9e04',
'745ac5d6c3d61ef8a31e2f3a4b5c6030',
1,
'2026-02-14 10:20:00.000000',
'2026-04-18 16:40:00.000000');