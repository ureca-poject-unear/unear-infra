CREATE EXTENSION IF NOT EXISTS postgis;
CREATE EXTENSION IF NOT EXISTS postgis_topology;

DROP TABLE IF EXISTS "discount_policy_detail";

CREATE TABLE "discount_policy_detail" (
  "discount_policy_detail_id"	BIGINT		NOT NULL,
  "places_id"	BIGINT		NULL,
  "unit_base_amount"	INT		NULL,
  "discount_value"	INT		NULL,
  "percent"	INT		NULL,
  "min_purchase_amount"	INT		NULL,
  "max_discount_amount"	INT		NULL,
  "discount_code"	VARCHAR		NULL,
  "membership_code"	VARCHAR		NULL
);

DROP TABLE IF EXISTS "store_owners";

CREATE TABLE "store_owners" (
                                "owner_id"	BIGINT		NOT NULL,
                                "pos_id"	BIGINT		NOT NULL,
                                "owner_name"	VARCHAR		NULL,
                                "owner_email"	VARCHAR		NULL,
                                "owner_password"	VARCHAR		NULL
);

DROP TABLE IF EXISTS "user_histories";

CREATE TABLE "user_histories" (
                                  "user_histories_id"	BIGINT		NOT NULL,
                                  "user_id"	BIGINT		NOT NULL,
                                  "user_coupons_id"	BIGINT		NULL,
                                  "places_id"	BIGINT		NOT NULL,
                                  "used_at"	DATE		NULL,
                                  "original_amount"	INT		NULL,
                                  "membership_discount_amount"	INT		NULL,
                                  "coupon_discount_amount"	INT		NULL,
                                  "total_discount_amount"	INT		NULL,
                                  "total_payment_amount"	INT		NULL,
                                  "is_coupon_used"	BOOLEAN		NULL,
                                  "is_membership_used"	BOOLEAN		NULL,
                                  "paid_at"	DATE		NULL,
                                  "discount_code"	VARCHAR		NULL,
                                  "membership_code"	VARCHAR		NULL
);

DROP TABLE IF EXISTS "users";

CREATE TABLE "users" (
                         "user_id"	BIGINT		NOT NULL,
                         "name"	VARCHAR		NULL,
                         "email"	VARCHAR		NULL,
                         "password"	VARCHAR		NULL,
                         "birthdate"	DATE		NULL,
                         "membership_code"	VARCHAR		NULL,
                         "gender"	VARCHAR		NULL
);

DROP TABLE IF EXISTS "unear_events";

CREATE TABLE "unear_events" (
                                "unear_events_id"	BIGINT		NOT NULL,
                                "event_name"	VARCHAR		NULL,
                                "event_description"	VARCHAR		NULL,
                                "latitude"	NUMERIC(10, 7)		NULL,
                                "longitude"	NUMERIC(10, 7)		NULL,
                                "radius_meter"	NUMERIC(10, 7)		NULL,
                                "start_at"	DATE		NULL,
                                "end_at"	DATE		NULL
);

DROP TABLE IF EXISTS "pos";

CREATE TABLE "pos" (
                       "pos_id"	BIGINT		NOT NULL,
                       "places_id"	BIGINT		NOT NULL
);

DROP TABLE IF EXISTS "commoncode";

CREATE TABLE "commoncode" (
                              "groupcode_id"	VARCHAR		NOT NULL,
                              "coomoncode_id"	VARCHAR		NOT NULL,
                              "code_desc"	VARCHAR		NULL
);

DROP TABLE IF EXISTS "stamps";

CREATE TABLE "stamps" (
                          "stamps_id"	BIGINT		NOT NULL,
                          "user_id"	BIGINT		NOT NULL,
                          "event_places_id"	BIGINT		NOT NULL,
                          "stamped_at"	DATE		NULL,
                          "event_code"	VARCHAR		NULL
);

DROP TABLE IF EXISTS "roulette_results";

CREATE TABLE "roulette_results" (
                                    "roulette_results_id"	BIGINT		NOT NULL,
                                    "unear_events_id"	BIGINT		NOT NULL,
                                    "user_id"	BIGINT		NOT NULL,
                                    "reward"	VARCHAR		NULL,
                                    "participated"	BOOLEAN		NULL
);

DROP TABLE IF EXISTS "places";

CREATE TABLE "places" (
                          "places_id"	BIGINT		NOT NULL,
                          "franchise_id"	BIGINT		NOT NULL,
                          "place_name"	VARCHAR		NULL,
                          "address"	VARCHAR		NULL,
                          "business_hours"	VARCHAR		NULL,
                          "latitude"	NUMERIC(10, 7)		NULL,
                          "longitude"	NUMERIC(10, 7)		NULL,
                          "place_code"	VARCHAR		NULL,
                          "event_code"	VARCHAR		NULL
);

DROP TABLE IF EXISTS "coupon_templates";

CREATE TABLE "coupon_templates" (
                                    "coupon_templates_id"	BIGINT		NOT NULL,
                                    "coupon_name"	VARCHAR		NULL,
                                    "coupon_desc"	VARCHAR		NULL,
                                    "remaining_quantity"	INT		NULL,
                                    "coupon_start"	DATE		NULL,
                                    "coupon_end"	DATE		NULL,
                                    "discount_code"	VARCHAR		NULL,
                                    "membership_code"	VARCHAR		NULL
);

DROP TABLE IF EXISTS "membership_barcodes";

CREATE TABLE "membership_barcodes" (
                                       "membership_barcodes_id"	BIGINT		NOT NULL,
                                       "user_id"	BIGINT		NOT NULL,
                                       "barcode_number"	VARCHAR		NULL
);

DROP TABLE IF EXISTS "user_coupons";

CREATE TABLE "user_coupons" (
                                "user_coupons_id"	BIGINT		NOT NULL,
                                "user_id"	BIGINT		NOT NULL,
                                "coupon_templates_id"	BIGINT		NOT NULL,
                                "coupon_status_code"	VARCHAR		NULL
);

DROP TABLE IF EXISTS "admins";

CREATE TABLE "admins" (
                          "admin_id"	BIGINT		NOT NULL,
                          "admin_name"	VARCHAR		NULL,
                          "admin_email"	VARCHAR		NULL,
                          "admin_password"	VARCHAR		NULL
);

DROP TABLE IF EXISTS "franchise";

CREATE TABLE "franchise" (
                             "franchise_id"	BIGINT		NOT NULL,
                             "name"	VARCHAR		NULL
);

DROP TABLE IF EXISTS "favorite_places";

CREATE TABLE "favorite_places" (
                                   "favorite_places_id"	BIGINT		NOT NULL,
                                   "places_id"	BIGINT		NOT NULL,
                                   "user_id"	BIGINT		NOT NULL,
                                   "created_at"	DATE		NULL,
                                   "deleted_at"	DATE		NULL,
                                   "is_favorited"	BOOLEAN		NULL
);

DROP TABLE IF EXISTS "pos_histories";

CREATE TABLE "pos_histories" (
                                 "pos_histories_id"	BIGINT		NOT NULL,
                                 "pos_id"	BIGINT		NOT NULL,
                                 "user_histories_id"	BIGINT		NOT NULL
);

DROP TABLE IF EXISTS "event_places";

CREATE TABLE "event_places" (
                                "event_places_id"	BIGINT		NOT NULL,
                                "unear_events_id"	BIGINT		NOT NULL,
                                "places_id"	BIGINT		NOT NULL,
                                "event_code"	VARCHAR		NULL
);

ALTER TABLE "discount_policy_detail" ADD CONSTRAINT "PK_DISCOUNT_POLICY_DETAIL" PRIMARY KEY (
                                                                                             "discount_policy_detail_id"
    );

ALTER TABLE "store_owners" ADD CONSTRAINT "PK_STORE_OWNERS" PRIMARY KEY (
                                                                         "owner_id"
    );

ALTER TABLE "user_histories" ADD CONSTRAINT "PK_USER_HISTORIES" PRIMARY KEY (
                                                                             "user_histories_id"
    );

ALTER TABLE "users" ADD CONSTRAINT "PK_USERS" PRIMARY KEY (
                                                           "user_id"
    );

ALTER TABLE "unear_events" ADD CONSTRAINT "PK_UNEAR_EVENTS" PRIMARY KEY (
                                                                         "unear_events_id"
    );

ALTER TABLE "pos" ADD CONSTRAINT "PK_POS" PRIMARY KEY (
                                                       "pos_id"
    );

ALTER TABLE "commoncode" ADD CONSTRAINT "PK_COMMONCODE" PRIMARY KEY (
                                                                     "groupcode_id",
                                                                     "coomoncode_id"
    );

ALTER TABLE "stamps" ADD CONSTRAINT "PK_STAMPS" PRIMARY KEY (
                                                             "stamps_id"
    );

ALTER TABLE "roulette_results" ADD CONSTRAINT "PK_ROULETTE_RESULTS" PRIMARY KEY (
                                                                                 "roulette_results_id"
    );

ALTER TABLE "places" ADD CONSTRAINT "PK_PLACES" PRIMARY KEY (
                                                             "places_id"
    );

ALTER TABLE "coupon_templates" ADD CONSTRAINT "PK_COUPON_TEMPLATES" PRIMARY KEY (
                                                                                 "coupon_templates_id"
    );

ALTER TABLE "membership_barcodes" ADD CONSTRAINT "PK_MEMBERSHIP_BARCODES" PRIMARY KEY (
                                                                                       "membership_barcodes_id"
    );

ALTER TABLE "user_coupons" ADD CONSTRAINT "PK_USER_COUPONS" PRIMARY KEY (
                                                                         "user_coupons_id"
    );

ALTER TABLE "admins" ADD CONSTRAINT "PK_ADMINS" PRIMARY KEY (
                                                             "admin_id"
    );

ALTER TABLE "franchise" ADD CONSTRAINT "PK_FRANCHISE" PRIMARY KEY (
                                                                   "franchise_id"
    );

ALTER TABLE "favorite_places" ADD CONSTRAINT "PK_FAVORITE_PLACES" PRIMARY KEY (
                                                                               "favorite_places_id"
    );

ALTER TABLE "pos_histories" ADD CONSTRAINT "PK_POS_HISTORIES" PRIMARY KEY (
                                                                           "pos_histories_id"
    );

ALTER TABLE "event_places" ADD CONSTRAINT "PK_EVENT_PLACES" PRIMARY KEY (
                                                                         "event_places_id"
    );

ALTER TABLE "discount_policy_detail" ADD CONSTRAINT "FK_places_TO_discount_policy_detail_1" FOREIGN KEY (
                                                                                                         "places_id"
    )
    REFERENCES "places" (
                         "places_id"
        );

ALTER TABLE "store_owners" ADD CONSTRAINT "FK_pos_TO_store_owners_1" FOREIGN KEY (
                                                                                  "pos_id"
    )
    REFERENCES "pos" (
                      "pos_id"
        );

ALTER TABLE "user_histories" ADD CONSTRAINT "FK_users_TO_user_histories_1" FOREIGN KEY (
                                                                                        "user_id"
    )
    REFERENCES "users" (
                        "user_id"
        );

ALTER TABLE "user_histories" ADD CONSTRAINT "FK_user_coupons_TO_user_histories_1" FOREIGN KEY (
                                                                                               "user_coupons_id"
    )
    REFERENCES "user_coupons" (
                               "user_coupons_id"
        );

ALTER TABLE "user_histories" ADD CONSTRAINT "FK_places_TO_user_histories_1" FOREIGN KEY (
                                                                                         "places_id"
    )
    REFERENCES "places" (
                         "places_id"
        );

ALTER TABLE "pos" ADD CONSTRAINT "FK_places_TO_pos_1" FOREIGN KEY (
                                                                   "places_id"
    )
    REFERENCES "places" (
                         "places_id"
        );

ALTER TABLE "stamps" ADD CONSTRAINT "FK_users_TO_stamps_1" FOREIGN KEY (
                                                                        "user_id"
    )
    REFERENCES "users" (
                        "user_id"
        );

ALTER TABLE "stamps" ADD CONSTRAINT "FK_event_places_TO_stamps_1" FOREIGN KEY (
                                                                               "event_places_id"
    )
    REFERENCES "event_places" (
                               "event_places_id"
        );

ALTER TABLE "roulette_results" ADD CONSTRAINT "FK_unear_events_TO_roulette_results_1" FOREIGN KEY (
                                                                                                   "unear_events_id"
    )
    REFERENCES "unear_events" (
                               "unear_events_id"
        );

ALTER TABLE "roulette_results" ADD CONSTRAINT "FK_users_TO_roulette_results_1" FOREIGN KEY (
                                                                                            "user_id"
    )
    REFERENCES "users" (
                        "user_id"
        );

ALTER TABLE "places" ADD CONSTRAINT "FK_franchise_TO_places_1" FOREIGN KEY (
                                                                            "franchise_id"
    )
    REFERENCES "franchise" (
                            "franchise_id"
        );

ALTER TABLE "membership_barcodes" ADD CONSTRAINT "FK_users_TO_membership_barcodes_1" FOREIGN KEY (
                                                                                                  "user_id"
    )
    REFERENCES "users" (
                        "user_id"
        );

ALTER TABLE "user_coupons" ADD CONSTRAINT "FK_users_TO_user_coupons_1" FOREIGN KEY (
                                                                                    "user_id"
    )
    REFERENCES "users" (
                        "user_id"
        );

ALTER TABLE "user_coupons" ADD CONSTRAINT "FK_coupon_templates_TO_user_coupons_1" FOREIGN KEY (
                                                                                               "coupon_templates_id"
    )
    REFERENCES "coupon_templates" (
                                   "coupon_templates_id"
        );

ALTER TABLE "favorite_places" ADD CONSTRAINT "FK_places_TO_favorite_places_1" FOREIGN KEY (
                                                                                           "places_id"
    )
    REFERENCES "places" (
                         "places_id"
        );

ALTER TABLE "favorite_places" ADD CONSTRAINT "FK_users_TO_favorite_places_1" FOREIGN KEY (
                                                                                          "user_id"
    )
    REFERENCES "users" (
                        "user_id"
        );

ALTER TABLE "pos_histories" ADD CONSTRAINT "FK_pos_TO_pos_histories_1" FOREIGN KEY (
                                                                                    "pos_id"
    )
    REFERENCES "pos" (
                      "pos_id"
        );

ALTER TABLE "pos_histories" ADD CONSTRAINT "FK_user_histories_TO_pos_histories_1" FOREIGN KEY (
                                                                                               "user_histories_id"
    )
    REFERENCES "user_histories" (
                                 "user_histories_id"
        );

ALTER TABLE "event_places" ADD CONSTRAINT "FK_unear_events_TO_event_places_1" FOREIGN KEY (
                                                                                           "unear_events_id"
    )
    REFERENCES "unear_events" (
                               "unear_events_id"
        );

ALTER TABLE "event_places" ADD CONSTRAINT "FK_places_TO_event_places_1" FOREIGN KEY (
                                                                                     "places_id"
    )
    REFERENCES "places" (
                         "places_id"
        );

