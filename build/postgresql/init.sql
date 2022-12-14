--
-- PostgreSQL database dump
--

-- Dumped from database version 14.4
-- Dumped by pg_dump version 14.4

-- Started on 2022-11-14 23:37:40 MSK

CREATE DATABASE magnittest WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';
ALTER DATABASE magnittest OWNER TO magnittest;

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 250 (class 1259 OID 17017)
-- Name: admin_event_entity; Type: TABLE; Schema: public; Owner: magnittest
--

CREATE TABLE public.admin_event_entity
(
    id               character varying(36) NOT NULL,
    admin_event_time bigint,
    realm_id         character varying(255),
    operation_type   character varying(255),
    auth_realm_id    character varying(255),
    auth_client_id   character varying(255),
    auth_user_id     character varying(255),
    ip_address       character varying(255),
    resource_path    character varying(2550),
    representation   text,
    error            character varying(255),
    resource_type    character varying(64)
);


ALTER TABLE public.admin_event_entity
    OWNER TO magnittest;

--
-- TOC entry 279 (class 1259 OID 17462)
-- Name: associated_policy; Type: TABLE; Schema: public; Owner: magnittest
--

CREATE TABLE public.associated_policy
(
    policy_id            character varying(36) NOT NULL,
    associated_policy_id character varying(36) NOT NULL
);


ALTER TABLE public.associated_policy
    OWNER TO magnittest;

--
-- TOC entry 253 (class 1259 OID 17032)
-- Name: authentication_execution; Type: TABLE; Schema: public; Owner: magnittest
--

CREATE TABLE public.authentication_execution
(
    id                 character varying(36) NOT NULL,
    alias              character varying(255),
    authenticator      character varying(36),
    realm_id           character varying(36),
    flow_id            character varying(36),
    requirement        integer,
    priority           integer,
    authenticator_flow boolean DEFAULT false NOT NULL,
    auth_flow_id       character varying(36),
    auth_config        character varying(36)
);


ALTER TABLE public.authentication_execution
    OWNER TO magnittest;

--
-- TOC entry 252 (class 1259 OID 17027)
-- Name: authentication_flow; Type: TABLE; Schema: public; Owner: magnittest
--

CREATE TABLE public.authentication_flow
(
    id          character varying(36)                                         NOT NULL,
    alias       character varying(255),
    description character varying(255),
    realm_id    character varying(36),
    provider_id character varying(36) DEFAULT 'basic-flow'::character varying NOT NULL,
    top_level   boolean               DEFAULT false                           NOT NULL,
    built_in    boolean               DEFAULT false                           NOT NULL
);


ALTER TABLE public.authentication_flow
    OWNER TO magnittest;

--
-- TOC entry 251 (class 1259 OID 17022)
-- Name: authenticator_config; Type: TABLE; Schema: public; Owner: magnittest
--

CREATE TABLE public.authenticator_config
(
    id       character varying(36) NOT NULL,
    alias    character varying(255),
    realm_id character varying(36)
);


ALTER TABLE public.authenticator_config
    OWNER TO magnittest;

--
-- TOC entry 254 (class 1259 OID 17037)
-- Name: authenticator_config_entry; Type: TABLE; Schema: public; Owner: magnittest
--

CREATE TABLE public.authenticator_config_entry
(
    authenticator_id character varying(36)  NOT NULL,
    value            text,
    name             character varying(255) NOT NULL
);


ALTER TABLE public.authenticator_config_entry
    OWNER TO magnittest;

--
-- TOC entry 280 (class 1259 OID 17477)
-- Name: broker_link; Type: TABLE; Schema: public; Owner: magnittest
--

CREATE TABLE public.broker_link
(
    identity_provider   character varying(255) NOT NULL,
    storage_provider_id character varying(255),
    realm_id            character varying(36)  NOT NULL,
    broker_user_id      character varying(255),
    broker_username     character varying(255),
    token               text,
    user_id             character varying(255) NOT NULL
);


ALTER TABLE public.broker_link
    OWNER TO magnittest;

--
-- TOC entry 211 (class 1259 OID 16398)
-- Name: client; Type: TABLE; Schema: public; Owner: magnittest
--

CREATE TABLE public.client
(
    id                           character varying(36) NOT NULL,
    enabled                      boolean DEFAULT false NOT NULL,
    full_scope_allowed           boolean DEFAULT false NOT NULL,
    client_id                    character varying(255),
    not_before                   integer,
    public_client                boolean DEFAULT false NOT NULL,
    secret                       character varying(255),
    base_url                     character varying(255),
    bearer_only                  boolean DEFAULT false NOT NULL,
    management_url               character varying(255),
    surrogate_auth_required      boolean DEFAULT false NOT NULL,
    realm_id                     character varying(36),
    protocol                     character varying(255),
    node_rereg_timeout           integer DEFAULT 0,
    frontchannel_logout          boolean DEFAULT false NOT NULL,
    consent_required             boolean DEFAULT false NOT NULL,
    name                         character varying(255),
    service_accounts_enabled     boolean DEFAULT false NOT NULL,
    client_authenticator_type    character varying(255),
    root_url                     character varying(255),
    description                  character varying(255),
    registration_token           character varying(255),
    standard_flow_enabled        boolean DEFAULT true  NOT NULL,
    implicit_flow_enabled        boolean DEFAULT false NOT NULL,
    direct_access_grants_enabled boolean DEFAULT false NOT NULL,
    always_display_in_console    boolean DEFAULT false NOT NULL
);


ALTER TABLE public.client
    OWNER TO magnittest;

--
-- TOC entry 234 (class 1259 OID 16756)
-- Name: client_attributes; Type: TABLE; Schema: public; Owner: magnittest
--

CREATE TABLE public.client_attributes
(
    client_id character varying(36)  NOT NULL,
    value     character varying(4000),
    name      character varying(255) NOT NULL
);


ALTER TABLE public.client_attributes
    OWNER TO magnittest;

--
-- TOC entry 291 (class 1259 OID 17726)
-- Name: client_auth_flow_bindings; Type: TABLE; Schema: public; Owner: magnittest
--

CREATE TABLE public.client_auth_flow_bindings
(
    client_id    character varying(36)  NOT NULL,
    flow_id      character varying(36),
    binding_name character varying(255) NOT NULL
);


ALTER TABLE public.client_auth_flow_bindings
    OWNER TO magnittest;

--
-- TOC entry 290 (class 1259 OID 17601)
-- Name: client_initial_access; Type: TABLE; Schema: public; Owner: magnittest
--

CREATE TABLE public.client_initial_access
(
    id              character varying(36) NOT NULL,
    realm_id        character varying(36) NOT NULL,
    "timestamp"     integer,
    expiration      integer,
    count           integer,
    remaining_count integer
);


ALTER TABLE public.client_initial_access
    OWNER TO magnittest;

--
-- TOC entry 236 (class 1259 OID 16766)
-- Name: client_node_registrations; Type: TABLE; Schema: public; Owner: magnittest
--

CREATE TABLE public.client_node_registrations
(
    client_id character varying(36)  NOT NULL,
    value     integer,
    name      character varying(255) NOT NULL
);


ALTER TABLE public.client_node_registrations
    OWNER TO magnittest;

--
-- TOC entry 268 (class 1259 OID 17266)
-- Name: client_scope; Type: TABLE; Schema: public; Owner: magnittest
--

CREATE TABLE public.client_scope
(
    id          character varying(36) NOT NULL,
    name        character varying(255),
    realm_id    character varying(36),
    description character varying(255),
    protocol    character varying(255)
);


ALTER TABLE public.client_scope
    OWNER TO magnittest;

--
-- TOC entry 269 (class 1259 OID 17280)
-- Name: client_scope_attributes; Type: TABLE; Schema: public; Owner: magnittest
--

CREATE TABLE public.client_scope_attributes
(
    scope_id character varying(36)  NOT NULL,
    value    character varying(2048),
    name     character varying(255) NOT NULL
);


ALTER TABLE public.client_scope_attributes
    OWNER TO magnittest;

--
-- TOC entry 292 (class 1259 OID 17767)
-- Name: client_scope_client; Type: TABLE; Schema: public; Owner: magnittest
--

CREATE TABLE public.client_scope_client
(
    client_id     character varying(255) NOT NULL,
    scope_id      character varying(255) NOT NULL,
    default_scope boolean DEFAULT false  NOT NULL
);


ALTER TABLE public.client_scope_client
    OWNER TO magnittest;

--
-- TOC entry 270 (class 1259 OID 17285)
-- Name: client_scope_role_mapping; Type: TABLE; Schema: public; Owner: magnittest
--

CREATE TABLE public.client_scope_role_mapping
(
    scope_id character varying(36) NOT NULL,
    role_id  character varying(36) NOT NULL
);


ALTER TABLE public.client_scope_role_mapping
    OWNER TO magnittest;

--
-- TOC entry 212 (class 1259 OID 16409)
-- Name: client_session; Type: TABLE; Schema: public; Owner: magnittest
--

CREATE TABLE public.client_session
(
    id             character varying(36) NOT NULL,
    client_id      character varying(36),
    redirect_uri   character varying(255),
    state          character varying(255),
    "timestamp"    integer,
    session_id     character varying(36),
    auth_method    character varying(255),
    realm_id       character varying(255),
    auth_user_id   character varying(36),
    current_action character varying(36)
);


ALTER TABLE public.client_session
    OWNER TO magnittest;

--
-- TOC entry 257 (class 1259 OID 17055)
-- Name: client_session_auth_status; Type: TABLE; Schema: public; Owner: magnittest
--

CREATE TABLE public.client_session_auth_status
(
    authenticator  character varying(36) NOT NULL,
    status         integer,
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_auth_status
    OWNER TO magnittest;

--
-- TOC entry 235 (class 1259 OID 16761)
-- Name: client_session_note; Type: TABLE; Schema: public; Owner: magnittest
--

CREATE TABLE public.client_session_note
(
    name           character varying(255) NOT NULL,
    value          character varying(255),
    client_session character varying(36)  NOT NULL
);


ALTER TABLE public.client_session_note
    OWNER TO magnittest;

--
-- TOC entry 249 (class 1259 OID 16939)
-- Name: client_session_prot_mapper; Type: TABLE; Schema: public; Owner: magnittest
--

CREATE TABLE public.client_session_prot_mapper
(
    protocol_mapper_id character varying(36) NOT NULL,
    client_session     character varying(36) NOT NULL
);


ALTER TABLE public.client_session_prot_mapper
    OWNER TO magnittest;

--
-- TOC entry 213 (class 1259 OID 16414)
-- Name: client_session_role; Type: TABLE; Schema: public; Owner: magnittest
--

CREATE TABLE public.client_session_role
(
    role_id        character varying(255) NOT NULL,
    client_session character varying(36)  NOT NULL
);


ALTER TABLE public.client_session_role
    OWNER TO magnittest;

--
-- TOC entry 258 (class 1259 OID 17136)
-- Name: client_user_session_note; Type: TABLE; Schema: public; Owner: magnittest
--

CREATE TABLE public.client_user_session_note
(
    name           character varying(255) NOT NULL,
    value          character varying(2048),
    client_session character varying(36)  NOT NULL
);


ALTER TABLE public.client_user_session_note
    OWNER TO magnittest;

--
-- TOC entry 288 (class 1259 OID 17522)
-- Name: component; Type: TABLE; Schema: public; Owner: magnittest
--

CREATE TABLE public.component
(
    id            character varying(36) NOT NULL,
    name          character varying(255),
    parent_id     character varying(36),
    provider_id   character varying(36),
    provider_type character varying(255),
    realm_id      character varying(36),
    sub_type      character varying(255)
);


ALTER TABLE public.component
    OWNER TO magnittest;

--
-- TOC entry 287 (class 1259 OID 17517)
-- Name: component_config; Type: TABLE; Schema: public; Owner: magnittest
--

CREATE TABLE public.component_config
(
    id           character varying(36)  NOT NULL,
    component_id character varying(36)  NOT NULL,
    name         character varying(255) NOT NULL,
    value        character varying(4000)
);


ALTER TABLE public.component_config
    OWNER TO magnittest;

--
-- TOC entry 214 (class 1259 OID 16417)
-- Name: composite_role; Type: TABLE; Schema: public; Owner: magnittest
--

CREATE TABLE public.composite_role
(
    composite  character varying(36) NOT NULL,
    child_role character varying(36) NOT NULL
);


ALTER TABLE public.composite_role
    OWNER TO magnittest;

--
-- TOC entry 215 (class 1259 OID 16420)
-- Name: credential; Type: TABLE; Schema: public; Owner: magnittest
--

CREATE TABLE public.credential
(
    id              character varying(36) NOT NULL,
    salt            bytea,
    type            character varying(255),
    user_id         character varying(36),
    created_date    bigint,
    user_label      character varying(255),
    secret_data     text,
    credential_data text,
    priority        integer
);


ALTER TABLE public.credential
    OWNER TO magnittest;

--
-- TOC entry 210 (class 1259 OID 16390)
-- Name: databasechangelog; Type: TABLE; Schema: public; Owner: magnittest
--

CREATE TABLE public.databasechangelog
(
    id            character varying(255)      NOT NULL,
    author        character varying(255)      NOT NULL,
    filename      character varying(255)      NOT NULL,
    dateexecuted  timestamp without time zone NOT NULL,
    orderexecuted integer                     NOT NULL,
    exectype      character varying(10)       NOT NULL,
    md5sum        character varying(35),
    description   character varying(255),
    comments      character varying(255),
    tag           character varying(255),
    liquibase     character varying(20),
    contexts      character varying(255),
    labels        character varying(255),
    deployment_id character varying(10)
);


ALTER TABLE public.databasechangelog
    OWNER TO magnittest;

--
-- TOC entry 209 (class 1259 OID 16385)
-- Name: databasechangeloglock; Type: TABLE; Schema: public; Owner: magnittest
--

CREATE TABLE public.databasechangeloglock
(
    id          integer NOT NULL,
    locked      boolean NOT NULL,
    lockgranted timestamp without time zone,
    lockedby    character varying(255)
);


ALTER TABLE public.databasechangeloglock
    OWNER TO magnittest;

--
-- TOC entry 293 (class 1259 OID 17783)
-- Name: default_client_scope; Type: TABLE; Schema: public; Owner: magnittest
--

CREATE TABLE public.default_client_scope
(
    realm_id      character varying(36) NOT NULL,
    scope_id      character varying(36) NOT NULL,
    default_scope boolean DEFAULT false NOT NULL
);


ALTER TABLE public.default_client_scope
    OWNER TO magnittest;

--
-- TOC entry 216 (class 1259 OID 16425)
-- Name: event_entity; Type: TABLE; Schema: public; Owner: magnittest
--

CREATE TABLE public.event_entity
(
    id           character varying(36) NOT NULL,
    client_id    character varying(255),
    details_json character varying(2550),
    error        character varying(255),
    ip_address   character varying(255),
    realm_id     character varying(255),
    session_id   character varying(255),
    event_time   bigint,
    type         character varying(255),
    user_id      character varying(255)
);


ALTER TABLE public.event_entity
    OWNER TO magnittest;

--
-- TOC entry 281 (class 1259 OID 17482)
-- Name: fed_user_attribute; Type: TABLE; Schema: public; Owner: magnittest
--

CREATE TABLE public.fed_user_attribute
(
    id                  character varying(36)  NOT NULL,
    name                character varying(255) NOT NULL,
    user_id             character varying(255) NOT NULL,
    realm_id            character varying(36)  NOT NULL,
    storage_provider_id character varying(36),
    value               character varying(2024)
);


ALTER TABLE public.fed_user_attribute
    OWNER TO magnittest;

--
-- TOC entry 282 (class 1259 OID 17487)
-- Name: fed_user_consent; Type: TABLE; Schema: public; Owner: magnittest
--

CREATE TABLE public.fed_user_consent
(
    id                      character varying(36)  NOT NULL,
    client_id               character varying(255),
    user_id                 character varying(255) NOT NULL,
    realm_id                character varying(36)  NOT NULL,
    storage_provider_id     character varying(36),
    created_date            bigint,
    last_updated_date       bigint,
    client_storage_provider character varying(36),
    external_client_id      character varying(255)
);


ALTER TABLE public.fed_user_consent
    OWNER TO magnittest;

--
-- TOC entry 295 (class 1259 OID 17809)
-- Name: fed_user_consent_cl_scope; Type: TABLE; Schema: public; Owner: magnittest
--

CREATE TABLE public.fed_user_consent_cl_scope
(
    user_consent_id character varying(36) NOT NULL,
    scope_id        character varying(36) NOT NULL
);


ALTER TABLE public.fed_user_consent_cl_scope
    OWNER TO magnittest;

--
-- TOC entry 283 (class 1259 OID 17496)
-- Name: fed_user_credential; Type: TABLE; Schema: public; Owner: magnittest
--

CREATE TABLE public.fed_user_credential
(
    id                  character varying(36)  NOT NULL,
    salt                bytea,
    type                character varying(255),
    created_date        bigint,
    user_id             character varying(255) NOT NULL,
    realm_id            character varying(36)  NOT NULL,
    storage_provider_id character varying(36),
    user_label          character varying(255),
    secret_data         text,
    credential_data     text,
    priority            integer
);


ALTER TABLE public.fed_user_credential
    OWNER TO magnittest;

--
-- TOC entry 284 (class 1259 OID 17505)
-- Name: fed_user_group_membership; Type: TABLE; Schema: public; Owner: magnittest
--

CREATE TABLE public.fed_user_group_membership
(
    group_id            character varying(36)  NOT NULL,
    user_id             character varying(255) NOT NULL,
    realm_id            character varying(36)  NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_group_membership
    OWNER TO magnittest;

--
-- TOC entry 285 (class 1259 OID 17508)
-- Name: fed_user_required_action; Type: TABLE; Schema: public; Owner: magnittest
--

CREATE TABLE public.fed_user_required_action
(
    required_action     character varying(255) DEFAULT ' '::character varying NOT NULL,
    user_id             character varying(255)                                NOT NULL,
    realm_id            character varying(36)                                 NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_required_action
    OWNER TO magnittest;

--
-- TOC entry 286 (class 1259 OID 17514)
-- Name: fed_user_role_mapping; Type: TABLE; Schema: public; Owner: magnittest
--

CREATE TABLE public.fed_user_role_mapping
(
    role_id             character varying(36)  NOT NULL,
    user_id             character varying(255) NOT NULL,
    realm_id            character varying(36)  NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_role_mapping
    OWNER TO magnittest;

--
-- TOC entry 239 (class 1259 OID 16802)
-- Name: federated_identity; Type: TABLE; Schema: public; Owner: magnittest
--

CREATE TABLE public.federated_identity
(
    identity_provider  character varying(255) NOT NULL,
    realm_id           character varying(36),
    federated_user_id  character varying(255),
    federated_username character varying(255),
    token              text,
    user_id            character varying(36)  NOT NULL
);


ALTER TABLE public.federated_identity
    OWNER TO magnittest;

--
-- TOC entry 289 (class 1259 OID 17579)
-- Name: federated_user; Type: TABLE; Schema: public; Owner: magnittest
--

CREATE TABLE public.federated_user
(
    id                  character varying(255) NOT NULL,
    storage_provider_id character varying(255),
    realm_id            character varying(36)  NOT NULL
);


ALTER TABLE public.federated_user
    OWNER TO magnittest;

--
-- TOC entry 265 (class 1259 OID 17204)
-- Name: group_attribute; Type: TABLE; Schema: public; Owner: magnittest
--

CREATE TABLE public.group_attribute
(
    id       character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    name     character varying(255)                                                         NOT NULL,
    value    character varying(255),
    group_id character varying(36)                                                          NOT NULL
);


ALTER TABLE public.group_attribute
    OWNER TO magnittest;

--
-- TOC entry 264 (class 1259 OID 17201)
-- Name: group_role_mapping; Type: TABLE; Schema: public; Owner: magnittest
--

CREATE TABLE public.group_role_mapping
(
    role_id  character varying(36) NOT NULL,
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.group_role_mapping
    OWNER TO magnittest;

--
-- TOC entry 240 (class 1259 OID 16807)
-- Name: identity_provider; Type: TABLE; Schema: public; Owner: magnittest
--

CREATE TABLE public.identity_provider
(
    internal_id                character varying(36) NOT NULL,
    enabled                    boolean DEFAULT false NOT NULL,
    provider_alias             character varying(255),
    provider_id                character varying(255),
    store_token                boolean DEFAULT false NOT NULL,
    authenticate_by_default    boolean DEFAULT false NOT NULL,
    realm_id                   character varying(36),
    add_token_role             boolean DEFAULT true  NOT NULL,
    trust_email                boolean DEFAULT false NOT NULL,
    first_broker_login_flow_id character varying(36),
    post_broker_login_flow_id  character varying(36),
    provider_display_name      character varying(255),
    link_only                  boolean DEFAULT false NOT NULL
);


ALTER TABLE public.identity_provider
    OWNER TO magnittest;

--
-- TOC entry 241 (class 1259 OID 16816)
-- Name: identity_provider_config; Type: TABLE; Schema: public; Owner: magnittest
--

CREATE TABLE public.identity_provider_config
(
    identity_provider_id character varying(36)  NOT NULL,
    value                text,
    name                 character varying(255) NOT NULL
);


ALTER TABLE public.identity_provider_config
    OWNER TO magnittest;

--
-- TOC entry 246 (class 1259 OID 16920)
-- Name: identity_provider_mapper; Type: TABLE; Schema: public; Owner: magnittest
--

CREATE TABLE public.identity_provider_mapper
(
    id              character varying(36)  NOT NULL,
    name            character varying(255) NOT NULL,
    idp_alias       character varying(255) NOT NULL,
    idp_mapper_name character varying(255) NOT NULL,
    realm_id        character varying(36)  NOT NULL
);


ALTER TABLE public.identity_provider_mapper
    OWNER TO magnittest;

--
-- TOC entry 247 (class 1259 OID 16925)
-- Name: idp_mapper_config; Type: TABLE; Schema: public; Owner: magnittest
--

CREATE TABLE public.idp_mapper_config
(
    idp_mapper_id character varying(36)  NOT NULL,
    value         text,
    name          character varying(255) NOT NULL
);


ALTER TABLE public.idp_mapper_config
    OWNER TO magnittest;

--
-- TOC entry 263 (class 1259 OID 17198)
-- Name: keycloak_group; Type: TABLE; Schema: public; Owner: magnittest
--

CREATE TABLE public.keycloak_group
(
    id           character varying(36) NOT NULL,
    name         character varying(255),
    parent_group character varying(36) NOT NULL,
    realm_id     character varying(36)
);


ALTER TABLE public.keycloak_group
    OWNER TO magnittest;

--
-- TOC entry 217 (class 1259 OID 16433)
-- Name: keycloak_role; Type: TABLE; Schema: public; Owner: magnittest
--

CREATE TABLE public.keycloak_role
(
    id                      character varying(36) NOT NULL,
    client_realm_constraint character varying(255),
    client_role             boolean DEFAULT false NOT NULL,
    description             character varying(255),
    name                    character varying(255),
    realm_id                character varying(255),
    client                  character varying(36),
    realm                   character varying(36)
);


ALTER TABLE public.keycloak_role
    OWNER TO magnittest;

--
-- TOC entry 245 (class 1259 OID 16917)
-- Name: migration_model; Type: TABLE; Schema: public; Owner: magnittest
--

CREATE TABLE public.migration_model
(
    id          character varying(36) NOT NULL,
    version     character varying(36),
    update_time bigint DEFAULT 0      NOT NULL
);


ALTER TABLE public.migration_model
    OWNER TO magnittest;

--
-- TOC entry 262 (class 1259 OID 17189)
-- Name: offline_client_session; Type: TABLE; Schema: public; Owner: magnittest
--

CREATE TABLE public.offline_client_session
(
    user_session_id         character varying(36)                                     NOT NULL,
    client_id               character varying(255)                                    NOT NULL,
    offline_flag            character varying(4)                                      NOT NULL,
    "timestamp"             integer,
    data                    text,
    client_storage_provider character varying(36)  DEFAULT 'local'::character varying NOT NULL,
    external_client_id      character varying(255) DEFAULT 'local'::character varying NOT NULL
);


ALTER TABLE public.offline_client_session
    OWNER TO magnittest;

--
-- TOC entry 261 (class 1259 OID 17184)
-- Name: offline_user_session; Type: TABLE; Schema: public; Owner: magnittest
--

CREATE TABLE public.offline_user_session
(
    user_session_id      character varying(36)  NOT NULL,
    user_id              character varying(255) NOT NULL,
    realm_id             character varying(36)  NOT NULL,
    created_on           integer                NOT NULL,
    offline_flag         character varying(4)   NOT NULL,
    data                 text,
    last_session_refresh integer DEFAULT 0      NOT NULL
);


ALTER TABLE public.offline_user_session
    OWNER TO magnittest;

--
-- TOC entry 275 (class 1259 OID 17405)
-- Name: policy_config; Type: TABLE; Schema: public; Owner: magnittest
--

CREATE TABLE public.policy_config
(
    policy_id character varying(36)  NOT NULL,
    name      character varying(255) NOT NULL,
    value     text
);


ALTER TABLE public.policy_config
    OWNER TO magnittest;

--
-- TOC entry 237 (class 1259 OID 16791)
-- Name: protocol_mapper; Type: TABLE; Schema: public; Owner: magnittest
--

CREATE TABLE public.protocol_mapper
(
    id                   character varying(36)  NOT NULL,
    name                 character varying(255) NOT NULL,
    protocol             character varying(255) NOT NULL,
    protocol_mapper_name character varying(255) NOT NULL,
    client_id            character varying(36),
    client_scope_id      character varying(36)
);


ALTER TABLE public.protocol_mapper
    OWNER TO magnittest;

--
-- TOC entry 238 (class 1259 OID 16797)
-- Name: protocol_mapper_config; Type: TABLE; Schema: public; Owner: magnittest
--

CREATE TABLE public.protocol_mapper_config
(
    protocol_mapper_id character varying(36)  NOT NULL,
    value              text,
    name               character varying(255) NOT NULL
);


ALTER TABLE public.protocol_mapper_config
    OWNER TO magnittest;

--
-- TOC entry 218 (class 1259 OID 16439)
-- Name: realm; Type: TABLE; Schema: public; Owner: magnittest
--

CREATE TABLE public.realm
(
    id                           character varying(36)               NOT NULL,
    access_code_lifespan         integer,
    user_action_lifespan         integer,
    access_token_lifespan        integer,
    account_theme                character varying(255),
    admin_theme                  character varying(255),
    email_theme                  character varying(255),
    enabled                      boolean               DEFAULT false NOT NULL,
    events_enabled               boolean               DEFAULT false NOT NULL,
    events_expiration            bigint,
    login_theme                  character varying(255),
    name                         character varying(255),
    not_before                   integer,
    password_policy              character varying(2550),
    registration_allowed         boolean               DEFAULT false NOT NULL,
    remember_me                  boolean               DEFAULT false NOT NULL,
    reset_password_allowed       boolean               DEFAULT false NOT NULL,
    social                       boolean               DEFAULT false NOT NULL,
    ssl_required                 character varying(255),
    sso_idle_timeout             integer,
    sso_max_lifespan             integer,
    update_profile_on_soc_login  boolean               DEFAULT false NOT NULL,
    verify_email                 boolean               DEFAULT false NOT NULL,
    master_admin_client          character varying(36),
    login_lifespan               integer,
    internationalization_enabled boolean               DEFAULT false NOT NULL,
    default_locale               character varying(255),
    reg_email_as_username        boolean               DEFAULT false NOT NULL,
    admin_events_enabled         boolean               DEFAULT false NOT NULL,
    admin_events_details_enabled boolean               DEFAULT false NOT NULL,
    edit_username_allowed        boolean               DEFAULT false NOT NULL,
    otp_policy_counter           integer               DEFAULT 0,
    otp_policy_window            integer               DEFAULT 1,
    otp_policy_period            integer               DEFAULT 30,
    otp_policy_digits            integer               DEFAULT 6,
    otp_policy_alg               character varying(36) DEFAULT 'HmacSHA1'::character varying,
    otp_policy_type              character varying(36) DEFAULT 'totp'::character varying,
    browser_flow                 character varying(36),
    registration_flow            character varying(36),
    direct_grant_flow            character varying(36),
    reset_credentials_flow       character varying(36),
    client_auth_flow             character varying(36),
    offline_session_idle_timeout integer               DEFAULT 0,
    revoke_refresh_token         boolean               DEFAULT false NOT NULL,
    access_token_life_implicit   integer               DEFAULT 0,
    login_with_email_allowed     boolean               DEFAULT true  NOT NULL,
    duplicate_emails_allowed     boolean               DEFAULT false NOT NULL,
    docker_auth_flow             character varying(36),
    refresh_token_max_reuse      integer               DEFAULT 0,
    allow_user_managed_access    boolean               DEFAULT false NOT NULL,
    sso_max_lifespan_remember_me integer               DEFAULT 0     NOT NULL,
    sso_idle_timeout_remember_me integer               DEFAULT 0     NOT NULL,
    default_role                 character varying(255)
);


ALTER TABLE public.realm
    OWNER TO magnittest;

--
-- TOC entry 219 (class 1259 OID 16456)
-- Name: realm_attribute; Type: TABLE; Schema: public; Owner: magnittest
--

CREATE TABLE public.realm_attribute
(
    name     character varying(255) NOT NULL,
    realm_id character varying(36)  NOT NULL,
    value    text
);


ALTER TABLE public.realm_attribute
    OWNER TO magnittest;

--
-- TOC entry 267 (class 1259 OID 17213)
-- Name: realm_default_groups; Type: TABLE; Schema: public; Owner: magnittest
--

CREATE TABLE public.realm_default_groups
(
    realm_id character varying(36) NOT NULL,
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.realm_default_groups
    OWNER TO magnittest;

--
-- TOC entry 244 (class 1259 OID 16909)
-- Name: realm_enabled_event_types; Type: TABLE; Schema: public; Owner: magnittest
--

CREATE TABLE public.realm_enabled_event_types
(
    realm_id character varying(36)  NOT NULL,
    value    character varying(255) NOT NULL
);


ALTER TABLE public.realm_enabled_event_types
    OWNER TO magnittest;

--
-- TOC entry 220 (class 1259 OID 16464)
-- Name: realm_events_listeners; Type: TABLE; Schema: public; Owner: magnittest
--

CREATE TABLE public.realm_events_listeners
(
    realm_id character varying(36)  NOT NULL,
    value    character varying(255) NOT NULL
);


ALTER TABLE public.realm_events_listeners
    OWNER TO magnittest;

--
-- TOC entry 300 (class 1259 OID 17919)
-- Name: realm_localizations; Type: TABLE; Schema: public; Owner: magnittest
--

CREATE TABLE public.realm_localizations
(
    realm_id character varying(255) NOT NULL,
    locale   character varying(255) NOT NULL,
    texts    text                   NOT NULL
);


ALTER TABLE public.realm_localizations
    OWNER TO magnittest;

--
-- TOC entry 221 (class 1259 OID 16467)
-- Name: realm_required_credential; Type: TABLE; Schema: public; Owner: magnittest
--

CREATE TABLE public.realm_required_credential
(
    type       character varying(255) NOT NULL,
    form_label character varying(255),
    input      boolean DEFAULT false  NOT NULL,
    secret     boolean DEFAULT false  NOT NULL,
    realm_id   character varying(36)  NOT NULL
);


ALTER TABLE public.realm_required_credential
    OWNER TO magnittest;

--
-- TOC entry 222 (class 1259 OID 16474)
-- Name: realm_smtp_config; Type: TABLE; Schema: public; Owner: magnittest
--

CREATE TABLE public.realm_smtp_config
(
    realm_id character varying(36)  NOT NULL,
    value    character varying(255),
    name     character varying(255) NOT NULL
);


ALTER TABLE public.realm_smtp_config
    OWNER TO magnittest;

--
-- TOC entry 242 (class 1259 OID 16825)
-- Name: realm_supported_locales; Type: TABLE; Schema: public; Owner: magnittest
--

CREATE TABLE public.realm_supported_locales
(
    realm_id character varying(36)  NOT NULL,
    value    character varying(255) NOT NULL
);


ALTER TABLE public.realm_supported_locales
    OWNER TO magnittest;

--
-- TOC entry 223 (class 1259 OID 16484)
-- Name: redirect_uris; Type: TABLE; Schema: public; Owner: magnittest
--

CREATE TABLE public.redirect_uris
(
    client_id character varying(36)  NOT NULL,
    value     character varying(255) NOT NULL
);


ALTER TABLE public.redirect_uris
    OWNER TO magnittest;

--
-- TOC entry 260 (class 1259 OID 17148)
-- Name: required_action_config; Type: TABLE; Schema: public; Owner: magnittest
--

CREATE TABLE public.required_action_config
(
    required_action_id character varying(36)  NOT NULL,
    value              text,
    name               character varying(255) NOT NULL
);


ALTER TABLE public.required_action_config
    OWNER TO magnittest;

--
-- TOC entry 259 (class 1259 OID 17141)
-- Name: required_action_provider; Type: TABLE; Schema: public; Owner: magnittest
--

CREATE TABLE public.required_action_provider
(
    id             character varying(36) NOT NULL,
    alias          character varying(255),
    name           character varying(255),
    realm_id       character varying(36),
    enabled        boolean DEFAULT false NOT NULL,
    default_action boolean DEFAULT false NOT NULL,
    provider_id    character varying(255),
    priority       integer
);


ALTER TABLE public.required_action_provider
    OWNER TO magnittest;

--
-- TOC entry 297 (class 1259 OID 17848)
-- Name: resource_attribute; Type: TABLE; Schema: public; Owner: magnittest
--

CREATE TABLE public.resource_attribute
(
    id          character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    name        character varying(255)                                                         NOT NULL,
    value       character varying(255),
    resource_id character varying(36)                                                          NOT NULL
);


ALTER TABLE public.resource_attribute
    OWNER TO magnittest;

--
-- TOC entry 277 (class 1259 OID 17432)
-- Name: resource_policy; Type: TABLE; Schema: public; Owner: magnittest
--

CREATE TABLE public.resource_policy
(
    resource_id character varying(36) NOT NULL,
    policy_id   character varying(36) NOT NULL
);


ALTER TABLE public.resource_policy
    OWNER TO magnittest;

--
-- TOC entry 276 (class 1259 OID 17417)
-- Name: resource_scope; Type: TABLE; Schema: public; Owner: magnittest
--

CREATE TABLE public.resource_scope
(
    resource_id character varying(36) NOT NULL,
    scope_id    character varying(36) NOT NULL
);


ALTER TABLE public.resource_scope
    OWNER TO magnittest;

--
-- TOC entry 271 (class 1259 OID 17355)
-- Name: resource_server; Type: TABLE; Schema: public; Owner: magnittest
--

CREATE TABLE public.resource_server
(
    id                   character varying(36)  NOT NULL,
    allow_rs_remote_mgmt boolean  DEFAULT false NOT NULL,
    policy_enforce_mode  character varying(15)  NOT NULL,
    decision_strategy    smallint DEFAULT 1     NOT NULL
);


ALTER TABLE public.resource_server
    OWNER TO magnittest;

--
-- TOC entry 296 (class 1259 OID 17824)
-- Name: resource_server_perm_ticket; Type: TABLE; Schema: public; Owner: magnittest
--

CREATE TABLE public.resource_server_perm_ticket
(
    id                 character varying(36)  NOT NULL,
    owner              character varying(255) NOT NULL,
    requester          character varying(255) NOT NULL,
    created_timestamp  bigint                 NOT NULL,
    granted_timestamp  bigint,
    resource_id        character varying(36)  NOT NULL,
    scope_id           character varying(36),
    resource_server_id character varying(36)  NOT NULL,
    policy_id          character varying(36)
);


ALTER TABLE public.resource_server_perm_ticket
    OWNER TO magnittest;

--
-- TOC entry 274 (class 1259 OID 17391)
-- Name: resource_server_policy; Type: TABLE; Schema: public; Owner: magnittest
--

CREATE TABLE public.resource_server_policy
(
    id                 character varying(36)  NOT NULL,
    name               character varying(255) NOT NULL,
    description        character varying(255),
    type               character varying(255) NOT NULL,
    decision_strategy  character varying(20),
    logic              character varying(20),
    resource_server_id character varying(36)  NOT NULL,
    owner              character varying(255)
);


ALTER TABLE public.resource_server_policy
    OWNER TO magnittest;

--
-- TOC entry 272 (class 1259 OID 17363)
-- Name: resource_server_resource; Type: TABLE; Schema: public; Owner: magnittest
--

CREATE TABLE public.resource_server_resource
(
    id                   character varying(36)  NOT NULL,
    name                 character varying(255) NOT NULL,
    type                 character varying(255),
    icon_uri             character varying(255),
    owner                character varying(255) NOT NULL,
    resource_server_id   character varying(36)  NOT NULL,
    owner_managed_access boolean DEFAULT false  NOT NULL,
    display_name         character varying(255)
);


ALTER TABLE public.resource_server_resource
    OWNER TO magnittest;

--
-- TOC entry 273 (class 1259 OID 17377)
-- Name: resource_server_scope; Type: TABLE; Schema: public; Owner: magnittest
--

CREATE TABLE public.resource_server_scope
(
    id                 character varying(36)  NOT NULL,
    name               character varying(255) NOT NULL,
    icon_uri           character varying(255),
    resource_server_id character varying(36)  NOT NULL,
    display_name       character varying(255)
);


ALTER TABLE public.resource_server_scope
    OWNER TO magnittest;

--
-- TOC entry 298 (class 1259 OID 17866)
-- Name: resource_uris; Type: TABLE; Schema: public; Owner: magnittest
--

CREATE TABLE public.resource_uris
(
    resource_id character varying(36)  NOT NULL,
    value       character varying(255) NOT NULL
);


ALTER TABLE public.resource_uris
    OWNER TO magnittest;

--
-- TOC entry 299 (class 1259 OID 17876)
-- Name: role_attribute; Type: TABLE; Schema: public; Owner: magnittest
--

CREATE TABLE public.role_attribute
(
    id      character varying(36)  NOT NULL,
    role_id character varying(36)  NOT NULL,
    name    character varying(255) NOT NULL,
    value   character varying(255)
);


ALTER TABLE public.role_attribute
    OWNER TO magnittest;

--
-- TOC entry 224 (class 1259 OID 16487)
-- Name: scope_mapping; Type: TABLE; Schema: public; Owner: magnittest
--

CREATE TABLE public.scope_mapping
(
    client_id character varying(36) NOT NULL,
    role_id   character varying(36) NOT NULL
);


ALTER TABLE public.scope_mapping
    OWNER TO magnittest;

--
-- TOC entry 278 (class 1259 OID 17447)
-- Name: scope_policy; Type: TABLE; Schema: public; Owner: magnittest
--

CREATE TABLE public.scope_policy
(
    scope_id  character varying(36) NOT NULL,
    policy_id character varying(36) NOT NULL
);


ALTER TABLE public.scope_policy
    OWNER TO magnittest;

--
-- TOC entry 226 (class 1259 OID 16493)
-- Name: user_attribute; Type: TABLE; Schema: public; Owner: magnittest
--

CREATE TABLE public.user_attribute
(
    name    character varying(255)                                                         NOT NULL,
    value   character varying(255),
    user_id character varying(36)                                                          NOT NULL,
    id      character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL
);


ALTER TABLE public.user_attribute
    OWNER TO magnittest;

--
-- TOC entry 248 (class 1259 OID 16930)
-- Name: user_consent; Type: TABLE; Schema: public; Owner: magnittest
--

CREATE TABLE public.user_consent
(
    id                      character varying(36) NOT NULL,
    client_id               character varying(255),
    user_id                 character varying(36) NOT NULL,
    created_date            bigint,
    last_updated_date       bigint,
    client_storage_provider character varying(36),
    external_client_id      character varying(255)
);


ALTER TABLE public.user_consent
    OWNER TO magnittest;

--
-- TOC entry 294 (class 1259 OID 17799)
-- Name: user_consent_client_scope; Type: TABLE; Schema: public; Owner: magnittest
--

CREATE TABLE public.user_consent_client_scope
(
    user_consent_id character varying(36) NOT NULL,
    scope_id        character varying(36) NOT NULL
);


ALTER TABLE public.user_consent_client_scope
    OWNER TO magnittest;

--
-- TOC entry 227 (class 1259 OID 16498)
-- Name: user_entity; Type: TABLE; Schema: public; Owner: magnittest
--

CREATE TABLE public.user_entity
(
    id                          character varying(36) NOT NULL,
    email                       character varying(255),
    email_constraint            character varying(255),
    email_verified              boolean DEFAULT false NOT NULL,
    enabled                     boolean DEFAULT false NOT NULL,
    federation_link             character varying(255),
    first_name                  character varying(255),
    last_name                   character varying(255),
    realm_id                    character varying(255),
    username                    character varying(255),
    created_timestamp           bigint,
    service_account_client_link character varying(255),
    not_before                  integer DEFAULT 0     NOT NULL
);


ALTER TABLE public.user_entity
    OWNER TO magnittest;

--
-- TOC entry 228 (class 1259 OID 16506)
-- Name: user_federation_config; Type: TABLE; Schema: public; Owner: magnittest
--

CREATE TABLE public.user_federation_config
(
    user_federation_provider_id character varying(36)  NOT NULL,
    value                       character varying(255),
    name                        character varying(255) NOT NULL
);


ALTER TABLE public.user_federation_config
    OWNER TO magnittest;

--
-- TOC entry 255 (class 1259 OID 17042)
-- Name: user_federation_mapper; Type: TABLE; Schema: public; Owner: magnittest
--

CREATE TABLE public.user_federation_mapper
(
    id                     character varying(36)  NOT NULL,
    name                   character varying(255) NOT NULL,
    federation_provider_id character varying(36)  NOT NULL,
    federation_mapper_type character varying(255) NOT NULL,
    realm_id               character varying(36)  NOT NULL
);


ALTER TABLE public.user_federation_mapper
    OWNER TO magnittest;

--
-- TOC entry 256 (class 1259 OID 17047)
-- Name: user_federation_mapper_config; Type: TABLE; Schema: public; Owner: magnittest
--

CREATE TABLE public.user_federation_mapper_config
(
    user_federation_mapper_id character varying(36)  NOT NULL,
    value                     character varying(255),
    name                      character varying(255) NOT NULL
);


ALTER TABLE public.user_federation_mapper_config
    OWNER TO magnittest;

--
-- TOC entry 229 (class 1259 OID 16511)
-- Name: user_federation_provider; Type: TABLE; Schema: public; Owner: magnittest
--

CREATE TABLE public.user_federation_provider
(
    id                  character varying(36) NOT NULL,
    changed_sync_period integer,
    display_name        character varying(255),
    full_sync_period    integer,
    last_sync           integer,
    priority            integer,
    provider_name       character varying(255),
    realm_id            character varying(36)
);


ALTER TABLE public.user_federation_provider
    OWNER TO magnittest;

--
-- TOC entry 266 (class 1259 OID 17210)
-- Name: user_group_membership; Type: TABLE; Schema: public; Owner: magnittest
--

CREATE TABLE public.user_group_membership
(
    group_id character varying(36) NOT NULL,
    user_id  character varying(36) NOT NULL
);


ALTER TABLE public.user_group_membership
    OWNER TO magnittest;

--
-- TOC entry 230 (class 1259 OID 16516)
-- Name: user_required_action; Type: TABLE; Schema: public; Owner: magnittest
--

CREATE TABLE public.user_required_action
(
    user_id         character varying(36)                                 NOT NULL,
    required_action character varying(255) DEFAULT ' '::character varying NOT NULL
);


ALTER TABLE public.user_required_action
    OWNER TO magnittest;

--
-- TOC entry 231 (class 1259 OID 16519)
-- Name: user_role_mapping; Type: TABLE; Schema: public; Owner: magnittest
--

CREATE TABLE public.user_role_mapping
(
    role_id character varying(255) NOT NULL,
    user_id character varying(36)  NOT NULL
);


ALTER TABLE public.user_role_mapping
    OWNER TO magnittest;

--
-- TOC entry 232 (class 1259 OID 16522)
-- Name: user_session; Type: TABLE; Schema: public; Owner: magnittest
--

CREATE TABLE public.user_session
(
    id                   character varying(36) NOT NULL,
    auth_method          character varying(255),
    ip_address           character varying(255),
    last_session_refresh integer,
    login_username       character varying(255),
    realm_id             character varying(255),
    remember_me          boolean DEFAULT false NOT NULL,
    started              integer,
    user_id              character varying(255),
    user_session_state   integer,
    broker_session_id    character varying(255),
    broker_user_id       character varying(255)
);


ALTER TABLE public.user_session
    OWNER TO magnittest;

--
-- TOC entry 243 (class 1259 OID 16828)
-- Name: user_session_note; Type: TABLE; Schema: public; Owner: magnittest
--

CREATE TABLE public.user_session_note
(
    user_session character varying(36)  NOT NULL,
    name         character varying(255) NOT NULL,
    value        character varying(2048)
);


ALTER TABLE public.user_session_note
    OWNER TO magnittest;

--
-- TOC entry 225 (class 1259 OID 16490)
-- Name: username_login_failure; Type: TABLE; Schema: public; Owner: magnittest
--

CREATE TABLE public.username_login_failure
(
    realm_id                character varying(36)  NOT NULL,
    username                character varying(255) NOT NULL,
    failed_login_not_before integer,
    last_failure            bigint,
    last_ip_failure         character varying(255),
    num_failures            integer
);


ALTER TABLE public.username_login_failure
    OWNER TO magnittest;

--
-- TOC entry 233 (class 1259 OID 16533)
-- Name: web_origins; Type: TABLE; Schema: public; Owner: magnittest
--

CREATE TABLE public.web_origins
(
    client_id character varying(36)  NOT NULL,
    value     character varying(255) NOT NULL
);


ALTER TABLE public.web_origins
    OWNER TO magnittest;

--
-- TOC entry 4161 (class 0 OID 17017)
-- Dependencies: 250
-- Data for Name: admin_event_entity; Type: TABLE DATA; Schema: public; Owner: magnittest
--


--
-- TOC entry 4190 (class 0 OID 17462)
-- Dependencies: 279
-- Data for Name: associated_policy; Type: TABLE DATA; Schema: public; Owner: magnittest
--

INSERT INTO public.associated_policy (policy_id, associated_policy_id)
VALUES ('bc06c310-16e1-4b62-a728-462bfb94c5b1', '954ebfde-9c97-4215-831d-64b240427051');
INSERT INTO public.associated_policy (policy_id, associated_policy_id)
VALUES ('e33cc715-2781-42a0-8b8f-c603b71c8efc', 'a2484a5c-c4ef-4493-b355-ef4182186009');


--
-- TOC entry 4164 (class 0 OID 17032)
-- Dependencies: 253
-- Data for Name: authentication_execution; Type: TABLE DATA; Schema: public; Owner: magnittest
--

INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority,
                                             authenticator_flow, auth_flow_id, auth_config)
VALUES ('c177c7f4-ee5f-428e-83c0-9c9ce9faf6f8', NULL, 'auth-cookie', 'master', '9f3c2c6f-ab64-4f3d-baa6-42f40dc27e67',
        2, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority,
                                             authenticator_flow, auth_flow_id, auth_config)
VALUES ('b50868a6-e5fa-47ef-bae7-1f6127bbd25d', NULL, 'auth-spnego', 'master', '9f3c2c6f-ab64-4f3d-baa6-42f40dc27e67',
        3, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority,
                                             authenticator_flow, auth_flow_id, auth_config)
VALUES ('fcdaffa9-2795-411f-b806-f021e8732f51', NULL, 'identity-provider-redirector', 'master',
        '9f3c2c6f-ab64-4f3d-baa6-42f40dc27e67', 2, 25, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority,
                                             authenticator_flow, auth_flow_id, auth_config)
VALUES ('4c3314dc-1aa5-4d73-8c34-df46f2178faa', NULL, NULL, 'master', '9f3c2c6f-ab64-4f3d-baa6-42f40dc27e67', 2, 30,
        true, '1c4d9282-1e73-4f06-9ab3-6040bd9d8a8c', NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority,
                                             authenticator_flow, auth_flow_id, auth_config)
VALUES ('cfd9b4f8-a974-4593-86be-770ec9f1ebe5', NULL, 'auth-username-password-form', 'master',
        '1c4d9282-1e73-4f06-9ab3-6040bd9d8a8c', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority,
                                             authenticator_flow, auth_flow_id, auth_config)
VALUES ('f0e55702-4f79-4e2d-a420-4dcc45abe03d', NULL, NULL, 'master', '1c4d9282-1e73-4f06-9ab3-6040bd9d8a8c', 1, 20,
        true, 'bd8cebae-0634-42ae-bebb-e6895fdc80f7', NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority,
                                             authenticator_flow, auth_flow_id, auth_config)
VALUES ('c36eece6-ac74-4980-80a4-7da156d81dd8', NULL, 'conditional-user-configured', 'master',
        'bd8cebae-0634-42ae-bebb-e6895fdc80f7', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority,
                                             authenticator_flow, auth_flow_id, auth_config)
VALUES ('20c61efe-36d7-47d9-8180-99feeaa19dca', NULL, 'auth-otp-form', 'master', 'bd8cebae-0634-42ae-bebb-e6895fdc80f7',
        0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority,
                                             authenticator_flow, auth_flow_id, auth_config)
VALUES ('7e8856fe-d86a-49e8-a836-bdd72f4f7951', NULL, 'direct-grant-validate-username', 'master',
        'cb1c42d2-3794-4f51-8dce-ff687da4705d', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority,
                                             authenticator_flow, auth_flow_id, auth_config)
VALUES ('51096764-9aa4-4a3a-bae6-aaf819bfdea4', NULL, 'direct-grant-validate-password', 'master',
        'cb1c42d2-3794-4f51-8dce-ff687da4705d', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority,
                                             authenticator_flow, auth_flow_id, auth_config)
VALUES ('75f1f4bb-39de-44ba-8a97-2572c6675d1b', NULL, NULL, 'master', 'cb1c42d2-3794-4f51-8dce-ff687da4705d', 1, 30,
        true, '3ef66f8b-315b-4839-bb41-f748aa42a085', NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority,
                                             authenticator_flow, auth_flow_id, auth_config)
VALUES ('4e4006c4-9a92-4a1e-a19f-8d141d4a57f1', NULL, 'conditional-user-configured', 'master',
        '3ef66f8b-315b-4839-bb41-f748aa42a085', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority,
                                             authenticator_flow, auth_flow_id, auth_config)
VALUES ('6a69dcc6-02e9-48b0-a4d2-19252699bbfd', NULL, 'direct-grant-validate-otp', 'master',
        '3ef66f8b-315b-4839-bb41-f748aa42a085', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority,
                                             authenticator_flow, auth_flow_id, auth_config)
VALUES ('d0b2e529-2bcb-4f0f-9fcb-c1c1dc6b5254', NULL, 'registration-page-form', 'master',
        'da98a785-d0dc-4e03-8c53-46a22070b8f0', 0, 10, true, '653d0c00-ffec-4b2e-a390-eaca7677a242', NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority,
                                             authenticator_flow, auth_flow_id, auth_config)
VALUES ('8e434cef-dd70-4ab4-a6fa-42ffe07e234a', NULL, 'registration-user-creation', 'master',
        '653d0c00-ffec-4b2e-a390-eaca7677a242', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority,
                                             authenticator_flow, auth_flow_id, auth_config)
VALUES ('daaabb83-421b-42e1-be8c-4332b8ab7044', NULL, 'registration-profile-action', 'master',
        '653d0c00-ffec-4b2e-a390-eaca7677a242', 0, 40, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority,
                                             authenticator_flow, auth_flow_id, auth_config)
VALUES ('a763b933-7429-49ab-bffa-1679b56e58c5', NULL, 'registration-password-action', 'master',
        '653d0c00-ffec-4b2e-a390-eaca7677a242', 0, 50, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority,
                                             authenticator_flow, auth_flow_id, auth_config)
VALUES ('b4cd0005-dc19-4c73-8baf-222f86853ca6', NULL, 'registration-recaptcha-action', 'master',
        '653d0c00-ffec-4b2e-a390-eaca7677a242', 3, 60, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority,
                                             authenticator_flow, auth_flow_id, auth_config)
VALUES ('402821f9-ef73-42f5-9c24-752fe45aebe0', NULL, 'reset-credentials-choose-user', 'master',
        '5ad7d74e-2358-4c84-8870-4ba82b8b4ee3', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority,
                                             authenticator_flow, auth_flow_id, auth_config)
VALUES ('059120ef-7729-4c90-9ab7-e22d3f7dfd81', NULL, 'reset-credential-email', 'master',
        '5ad7d74e-2358-4c84-8870-4ba82b8b4ee3', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority,
                                             authenticator_flow, auth_flow_id, auth_config)
VALUES ('1b9ee81d-f47d-4490-8876-f67587af7647', NULL, 'reset-password', 'master',
        '5ad7d74e-2358-4c84-8870-4ba82b8b4ee3', 0, 30, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority,
                                             authenticator_flow, auth_flow_id, auth_config)
VALUES ('d980ff75-fec7-4621-9f6e-04d88fb69371', NULL, NULL, 'master', '5ad7d74e-2358-4c84-8870-4ba82b8b4ee3', 1, 40,
        true, '1883306c-14c1-4b75-b327-10552649a982', NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority,
                                             authenticator_flow, auth_flow_id, auth_config)
VALUES ('bb8976f8-1939-4b61-8236-9c30aebcc4fd', NULL, 'conditional-user-configured', 'master',
        '1883306c-14c1-4b75-b327-10552649a982', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority,
                                             authenticator_flow, auth_flow_id, auth_config)
VALUES ('b2fe6b26-9245-4a68-ab63-7310ef77d135', NULL, 'reset-otp', 'master', '1883306c-14c1-4b75-b327-10552649a982', 0,
        20, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority,
                                             authenticator_flow, auth_flow_id, auth_config)
VALUES ('b7eb63fe-7ab3-4cd9-a95e-944cb345fa9b', NULL, 'client-secret', 'master', '2369b4a8-8686-4056-bac4-f588de4ff093',
        2, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority,
                                             authenticator_flow, auth_flow_id, auth_config)
VALUES ('aef83251-f090-48d5-8978-921636cf33d6', NULL, 'client-jwt', 'master', '2369b4a8-8686-4056-bac4-f588de4ff093', 2,
        20, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority,
                                             authenticator_flow, auth_flow_id, auth_config)
VALUES ('e4be8c0a-c5ea-458f-8c6e-89e09d2b620a', NULL, 'client-secret-jwt', 'master',
        '2369b4a8-8686-4056-bac4-f588de4ff093', 2, 30, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority,
                                             authenticator_flow, auth_flow_id, auth_config)
VALUES ('cc432a89-bbe4-44cb-b8b5-f13b75db0ff2', NULL, 'client-x509', 'master', '2369b4a8-8686-4056-bac4-f588de4ff093',
        2, 40, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority,
                                             authenticator_flow, auth_flow_id, auth_config)
VALUES ('89739da7-b22f-41cb-a3a4-362f4f585ad2', NULL, 'idp-review-profile', 'master',
        'cf2636c0-1542-466f-9d86-b3c4925061c3', 0, 10, false, NULL, '2847ba10-edcc-4665-bd4a-1a6c68d096f2');
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority,
                                             authenticator_flow, auth_flow_id, auth_config)
VALUES ('7aef7f74-37da-49d0-b0a3-3315fb2cf7b8', NULL, NULL, 'master', 'cf2636c0-1542-466f-9d86-b3c4925061c3', 0, 20,
        true, 'f6548858-10b3-400b-9d61-a6055af9ba0a', NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority,
                                             authenticator_flow, auth_flow_id, auth_config)
VALUES ('aaa5395e-12b6-4fb6-88c2-e38df82d701b', NULL, 'idp-create-user-if-unique', 'master',
        'f6548858-10b3-400b-9d61-a6055af9ba0a', 2, 10, false, NULL, 'e56e24e4-8080-4526-8d70-709ef620102e');
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority,
                                             authenticator_flow, auth_flow_id, auth_config)
VALUES ('ae574e5f-089b-436c-8f94-c365932456b9', NULL, NULL, 'master', 'f6548858-10b3-400b-9d61-a6055af9ba0a', 2, 20,
        true, '25fbdfec-4b9c-4400-996a-2115a4749120', NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority,
                                             authenticator_flow, auth_flow_id, auth_config)
VALUES ('7d077e4c-84fa-48c7-a54d-8fd6b487aabf', NULL, 'idp-confirm-link', 'master',
        '25fbdfec-4b9c-4400-996a-2115a4749120', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority,
                                             authenticator_flow, auth_flow_id, auth_config)
VALUES ('f1951209-d307-46d4-be99-d9c3f28041c0', NULL, NULL, 'master', '25fbdfec-4b9c-4400-996a-2115a4749120', 0, 20,
        true, '2d3be1c4-97e7-4322-8579-1a256dca7960', NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority,
                                             authenticator_flow, auth_flow_id, auth_config)
VALUES ('995d2530-1ad7-4652-ba2a-bff007434dc7', NULL, 'idp-email-verification', 'master',
        '2d3be1c4-97e7-4322-8579-1a256dca7960', 2, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority,
                                             authenticator_flow, auth_flow_id, auth_config)
VALUES ('dd056c99-1e7a-4c10-9ac2-ad38319394ae', NULL, NULL, 'master', '2d3be1c4-97e7-4322-8579-1a256dca7960', 2, 20,
        true, 'bf6c87fb-35e4-48cd-93e8-181ad4224093', NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority,
                                             authenticator_flow, auth_flow_id, auth_config)
VALUES ('f2d36e8e-9c31-48ec-bbbf-882a1cd9f26a', NULL, 'idp-username-password-form', 'master',
        'bf6c87fb-35e4-48cd-93e8-181ad4224093', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority,
                                             authenticator_flow, auth_flow_id, auth_config)
VALUES ('fc4378b2-f094-434c-98bb-94347c8f05f1', NULL, NULL, 'master', 'bf6c87fb-35e4-48cd-93e8-181ad4224093', 1, 20,
        true, '3ae1f349-06e5-48b4-9618-3cd10b521b9d', NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority,
                                             authenticator_flow, auth_flow_id, auth_config)
VALUES ('4953cec9-210d-42e2-9e7d-5802fbf17fd2', NULL, 'conditional-user-configured', 'master',
        '3ae1f349-06e5-48b4-9618-3cd10b521b9d', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority,
                                             authenticator_flow, auth_flow_id, auth_config)
VALUES ('f4fff274-fe03-4552-a7a5-c5f2cbf8c1a3', NULL, 'auth-otp-form', 'master', '3ae1f349-06e5-48b4-9618-3cd10b521b9d',
        0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority,
                                             authenticator_flow, auth_flow_id, auth_config)
VALUES ('308b1705-fa5a-4bc3-a453-8b3a7775af01', NULL, 'http-basic-authenticator', 'master',
        '2b8ffb9e-9189-4e63-ab9e-1912ad4b00a8', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority,
                                             authenticator_flow, auth_flow_id, auth_config)
VALUES ('2a7cb053-18c4-4f54-8963-754db2733df5', NULL, 'docker-http-basic-authenticator', 'master',
        '33ab4bad-2cac-45fe-b4db-57bae7e00001', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority,
                                             authenticator_flow, auth_flow_id, auth_config)
VALUES ('9a5368d8-bca1-4683-88b7-3cf63a16eba1', NULL, 'no-cookie-redirect', 'master',
        '12374bba-f50c-4d02-bfd5-dd67a76bae18', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority,
                                             authenticator_flow, auth_flow_id, auth_config)
VALUES ('1dc05a5e-7569-4fac-937b-28e12bd51bce', NULL, NULL, 'master', '12374bba-f50c-4d02-bfd5-dd67a76bae18', 0, 20,
        true, 'e5be5a64-7fd1-420e-9fef-6bc3902f7f50', NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority,
                                             authenticator_flow, auth_flow_id, auth_config)
VALUES ('a9232acf-2ee9-45fe-8ebe-8f0a5f53e25a', NULL, 'basic-auth', 'master', 'e5be5a64-7fd1-420e-9fef-6bc3902f7f50', 0,
        10, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority,
                                             authenticator_flow, auth_flow_id, auth_config)
VALUES ('79e13d4d-85aa-4718-acaa-17a96c02b4be', NULL, 'basic-auth-otp', 'master',
        'e5be5a64-7fd1-420e-9fef-6bc3902f7f50', 3, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority,
                                             authenticator_flow, auth_flow_id, auth_config)
VALUES ('3acc6173-a0ad-491e-8826-98cd520afb24', NULL, 'auth-spnego', 'master', 'e5be5a64-7fd1-420e-9fef-6bc3902f7f50',
        3, 30, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority,
                                             authenticator_flow, auth_flow_id, auth_config)
VALUES ('3b51fbf0-4629-4d7e-b53e-d1c9365bfbec', NULL, 'idp-email-verification', 'CoreRealm',
        'aa2a5cb8-613b-492d-9dbe-1cc7cb6c320e', 2, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority,
                                             authenticator_flow, auth_flow_id, auth_config)
VALUES ('d0c084a2-9151-4ddc-b87b-a8318af8046a', NULL, NULL, 'CoreRealm', 'aa2a5cb8-613b-492d-9dbe-1cc7cb6c320e', 2, 20,
        true, '8d578a30-a22f-4648-8ebc-e1fbfb3f23ff', NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority,
                                             authenticator_flow, auth_flow_id, auth_config)
VALUES ('636fb9ae-1163-4692-8f02-3c8372049af7', NULL, 'basic-auth', 'CoreRealm', 'b69db3be-9d12-485c-91be-aee890d50048',
        0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority,
                                             authenticator_flow, auth_flow_id, auth_config)
VALUES ('ef5ad757-ea6e-4403-8777-384c7b87ab4e', NULL, 'basic-auth-otp', 'CoreRealm',
        'b69db3be-9d12-485c-91be-aee890d50048', 3, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority,
                                             authenticator_flow, auth_flow_id, auth_config)
VALUES ('6685be2f-bb2d-4e11-a51b-120634c2b48d', NULL, 'auth-spnego', 'CoreRealm',
        'b69db3be-9d12-485c-91be-aee890d50048', 3, 30, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority,
                                             authenticator_flow, auth_flow_id, auth_config)
VALUES ('267bd767-313e-4512-952a-4ebde08ecfbb', NULL, 'conditional-user-configured', 'CoreRealm',
        '258900bd-7470-4814-be69-4c02b0aa14cb', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority,
                                             authenticator_flow, auth_flow_id, auth_config)
VALUES ('39b2cbb8-e97e-4d62-acbc-f778a3e2b5f7', NULL, 'auth-otp-form', 'CoreRealm',
        '258900bd-7470-4814-be69-4c02b0aa14cb', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority,
                                             authenticator_flow, auth_flow_id, auth_config)
VALUES ('11244c19-8b75-49d0-a5e2-131b81df1f97', NULL, 'conditional-user-configured', 'CoreRealm',
        '2510b798-c3e0-4a76-a117-b1ad251ce461', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority,
                                             authenticator_flow, auth_flow_id, auth_config)
VALUES ('c848bce4-3fc9-4363-89c7-46a80902aa7a', NULL, 'direct-grant-validate-otp', 'CoreRealm',
        '2510b798-c3e0-4a76-a117-b1ad251ce461', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority,
                                             authenticator_flow, auth_flow_id, auth_config)
VALUES ('73b36940-c05a-4224-87db-87e5488d75a6', NULL, 'conditional-user-configured', 'CoreRealm',
        '1fb74cc4-a5dd-45e3-b1ed-75f7ca95166a', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority,
                                             authenticator_flow, auth_flow_id, auth_config)
VALUES ('af7618da-9a78-4a0a-892d-8a8e3ab582a7', NULL, 'auth-otp-form', 'CoreRealm',
        '1fb74cc4-a5dd-45e3-b1ed-75f7ca95166a', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority,
                                             authenticator_flow, auth_flow_id, auth_config)
VALUES ('1579b856-b39d-4e86-a0ee-9be6a7ed270b', NULL, 'idp-confirm-link', 'CoreRealm',
        '1c9d8076-5e2e-4d55-b6e0-f5a932dec005', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority,
                                             authenticator_flow, auth_flow_id, auth_config)
VALUES ('1d073253-4770-4f3b-a7a3-d7bead6abc65', NULL, NULL, 'CoreRealm', '1c9d8076-5e2e-4d55-b6e0-f5a932dec005', 0, 20,
        true, 'aa2a5cb8-613b-492d-9dbe-1cc7cb6c320e', NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority,
                                             authenticator_flow, auth_flow_id, auth_config)
VALUES ('92382a8c-b521-48bf-90aa-2be7de9f85c2', NULL, 'conditional-user-configured', 'CoreRealm',
        '6350cb5a-74d3-4d8a-90e8-8f37309e7856', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority,
                                             authenticator_flow, auth_flow_id, auth_config)
VALUES ('2a2d851e-180b-4377-ae55-8f4dac92cbfc', NULL, 'reset-otp', 'CoreRealm', '6350cb5a-74d3-4d8a-90e8-8f37309e7856',
        0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority,
                                             authenticator_flow, auth_flow_id, auth_config)
VALUES ('247d731f-decf-4bf6-be55-eb5a2257a94f', NULL, 'idp-create-user-if-unique', 'CoreRealm',
        '35a30192-997d-4aab-9cd9-5ca77f668557', 2, 10, false, NULL, '47c25fdd-6d44-4f88-b592-611521e26ee9');
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority,
                                             authenticator_flow, auth_flow_id, auth_config)
VALUES ('30d23752-77c5-40fc-bc4d-602989bc2be1', NULL, NULL, 'CoreRealm', '35a30192-997d-4aab-9cd9-5ca77f668557', 2, 20,
        true, '1c9d8076-5e2e-4d55-b6e0-f5a932dec005', NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority,
                                             authenticator_flow, auth_flow_id, auth_config)
VALUES ('6e12f039-63ef-41d4-8882-cf882b4e18e6', NULL, 'idp-username-password-form', 'CoreRealm',
        '8d578a30-a22f-4648-8ebc-e1fbfb3f23ff', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority,
                                             authenticator_flow, auth_flow_id, auth_config)
VALUES ('6416f463-e1fe-4953-8617-1ba82d19acc1', NULL, NULL, 'CoreRealm', '8d578a30-a22f-4648-8ebc-e1fbfb3f23ff', 1, 20,
        true, '1fb74cc4-a5dd-45e3-b1ed-75f7ca95166a', NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority,
                                             authenticator_flow, auth_flow_id, auth_config)
VALUES ('b7a16c73-c9e0-4c4a-a607-9660276f321e', NULL, 'auth-cookie', 'CoreRealm',
        'c8874279-ecc7-43ab-b13f-93a1e16faaf9', 2, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority,
                                             authenticator_flow, auth_flow_id, auth_config)
VALUES ('311124c6-197e-4406-81e0-575c2a33d12a', NULL, 'auth-spnego', 'CoreRealm',
        'c8874279-ecc7-43ab-b13f-93a1e16faaf9', 3, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority,
                                             authenticator_flow, auth_flow_id, auth_config)
VALUES ('7c0279d1-1409-46f4-a1c1-e3feeade45b5', NULL, 'identity-provider-redirector', 'CoreRealm',
        'c8874279-ecc7-43ab-b13f-93a1e16faaf9', 2, 25, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority,
                                             authenticator_flow, auth_flow_id, auth_config)
VALUES ('b1a05b3f-c5aa-4dbb-bccb-2e65f7cf82f7', NULL, NULL, 'CoreRealm', 'c8874279-ecc7-43ab-b13f-93a1e16faaf9', 2, 30,
        true, '5a2154d7-0d9a-403f-8568-40c05f4648ee', NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority,
                                             authenticator_flow, auth_flow_id, auth_config)
VALUES ('2f557eae-c296-4639-9083-6e1e9df2e59a', NULL, 'client-secret', 'CoreRealm',
        '621c99b3-dea7-45b5-b723-350480747bb1', 2, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority,
                                             authenticator_flow, auth_flow_id, auth_config)
VALUES ('80b8b1af-56df-4647-9205-967cf1d2ef6a', NULL, 'client-jwt', 'CoreRealm', '621c99b3-dea7-45b5-b723-350480747bb1',
        2, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority,
                                             authenticator_flow, auth_flow_id, auth_config)
VALUES ('4753df92-7700-4dd1-810e-8e38ab4c0bdd', NULL, 'client-secret-jwt', 'CoreRealm',
        '621c99b3-dea7-45b5-b723-350480747bb1', 2, 30, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority,
                                             authenticator_flow, auth_flow_id, auth_config)
VALUES ('a6d92815-e116-4b6c-91d7-e8efc1d56153', NULL, 'client-x509', 'CoreRealm',
        '621c99b3-dea7-45b5-b723-350480747bb1', 2, 40, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority,
                                             authenticator_flow, auth_flow_id, auth_config)
VALUES ('63109fbc-a671-419a-9d75-3ccc7bc66f88', NULL, 'direct-grant-validate-username', 'CoreRealm',
        '9e6be99a-a235-4ca0-a59a-90d9fa364ad0', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority,
                                             authenticator_flow, auth_flow_id, auth_config)
VALUES ('c4e770db-84bb-46bf-aa36-98b8ecb837fe', NULL, 'direct-grant-validate-password', 'CoreRealm',
        '9e6be99a-a235-4ca0-a59a-90d9fa364ad0', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority,
                                             authenticator_flow, auth_flow_id, auth_config)
VALUES ('c788dfec-0a3f-4d12-92fd-92525b7e63e8', NULL, NULL, 'CoreRealm', '9e6be99a-a235-4ca0-a59a-90d9fa364ad0', 1, 30,
        true, '2510b798-c3e0-4a76-a117-b1ad251ce461', NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority,
                                             authenticator_flow, auth_flow_id, auth_config)
VALUES ('0decef88-f8b6-420d-a8c7-8f923115772c', NULL, 'docker-http-basic-authenticator', 'CoreRealm',
        'e041d4b7-3bbe-4c8c-9234-f31f4446e953', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority,
                                             authenticator_flow, auth_flow_id, auth_config)
VALUES ('2f5a30b1-f136-4e1e-ad73-338cbffa4e25', NULL, 'idp-review-profile', 'CoreRealm',
        'd30ab811-e495-479e-9556-0cee506e0335', 0, 10, false, NULL, '372a5292-c345-4e09-86c7-db3eacc8bf33');
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority,
                                             authenticator_flow, auth_flow_id, auth_config)
VALUES ('44de9537-203d-4ffb-902d-a1af39beb559', NULL, NULL, 'CoreRealm', 'd30ab811-e495-479e-9556-0cee506e0335', 0, 20,
        true, '35a30192-997d-4aab-9cd9-5ca77f668557', NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority,
                                             authenticator_flow, auth_flow_id, auth_config)
VALUES ('4e88ffb4-10da-4644-89ff-cf7ff3da562f', NULL, 'auth-username-password-form', 'CoreRealm',
        '5a2154d7-0d9a-403f-8568-40c05f4648ee', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority,
                                             authenticator_flow, auth_flow_id, auth_config)
VALUES ('632e8649-ea02-4465-ae59-d816977c0ca8', NULL, NULL, 'CoreRealm', '5a2154d7-0d9a-403f-8568-40c05f4648ee', 1, 20,
        true, '258900bd-7470-4814-be69-4c02b0aa14cb', NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority,
                                             authenticator_flow, auth_flow_id, auth_config)
VALUES ('3a4e7eac-e459-4cfc-9743-b810251f7c04', NULL, 'no-cookie-redirect', 'CoreRealm',
        'ef589e23-5c2b-4472-babe-128df3cc1217', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority,
                                             authenticator_flow, auth_flow_id, auth_config)
VALUES ('d08ab7b8-532e-4780-ad6c-00f11b1c8ee3', NULL, NULL, 'CoreRealm', 'ef589e23-5c2b-4472-babe-128df3cc1217', 0, 20,
        true, 'b69db3be-9d12-485c-91be-aee890d50048', NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority,
                                             authenticator_flow, auth_flow_id, auth_config)
VALUES ('477cee47-3e01-4afa-a093-bc7d14c29648', NULL, 'registration-page-form', 'CoreRealm',
        '0c305325-05cd-4640-bf37-ef9627e8127d', 0, 10, true, '014e2f86-118c-4dff-80d3-05e48c6c00d0', NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority,
                                             authenticator_flow, auth_flow_id, auth_config)
VALUES ('eb8b99d0-c92c-4420-955b-cc35fcc9c742', NULL, 'registration-user-creation', 'CoreRealm',
        '014e2f86-118c-4dff-80d3-05e48c6c00d0', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority,
                                             authenticator_flow, auth_flow_id, auth_config)
VALUES ('f1b75d47-b024-4822-9194-1236fe3fa948', NULL, 'registration-profile-action', 'CoreRealm',
        '014e2f86-118c-4dff-80d3-05e48c6c00d0', 0, 40, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority,
                                             authenticator_flow, auth_flow_id, auth_config)
VALUES ('f6e61b72-fd12-4f9f-b57b-a0336285d8ed', NULL, 'registration-password-action', 'CoreRealm',
        '014e2f86-118c-4dff-80d3-05e48c6c00d0', 0, 50, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority,
                                             authenticator_flow, auth_flow_id, auth_config)
VALUES ('18ec5f9d-3f29-49bc-b2fa-2a08f00bc89b', NULL, 'registration-recaptcha-action', 'CoreRealm',
        '014e2f86-118c-4dff-80d3-05e48c6c00d0', 3, 60, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority,
                                             authenticator_flow, auth_flow_id, auth_config)
VALUES ('252c45d1-2e47-4f98-9757-5c4cdf4d515d', NULL, 'reset-credentials-choose-user', 'CoreRealm',
        '5482562b-942d-4f53-9e47-ff6d8c0aefdf', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority,
                                             authenticator_flow, auth_flow_id, auth_config)
VALUES ('e8efb50a-8f14-488d-8979-ed8307f24e1a', NULL, 'reset-credential-email', 'CoreRealm',
        '5482562b-942d-4f53-9e47-ff6d8c0aefdf', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority,
                                             authenticator_flow, auth_flow_id, auth_config)
VALUES ('a31dbbd8-a56b-48b5-944d-28861a2aba01', NULL, 'reset-password', 'CoreRealm',
        '5482562b-942d-4f53-9e47-ff6d8c0aefdf', 0, 30, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority,
                                             authenticator_flow, auth_flow_id, auth_config)
VALUES ('e2378127-8774-4e79-a853-cc524fe13a4d', NULL, NULL, 'CoreRealm', '5482562b-942d-4f53-9e47-ff6d8c0aefdf', 1, 40,
        true, '6350cb5a-74d3-4d8a-90e8-8f37309e7856', NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority,
                                             authenticator_flow, auth_flow_id, auth_config)
VALUES ('0e88a879-3392-437c-abf9-254124fd895f', NULL, 'http-basic-authenticator', 'CoreRealm',
        '43fabf1f-029e-4ea7-a96c-1a9a024d8ce6', 0, 10, false, NULL, NULL);


--
-- TOC entry 4163 (class 0 OID 17027)
-- Dependencies: 252
-- Data for Name: authentication_flow; Type: TABLE DATA; Schema: public; Owner: magnittest
--

INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in)
VALUES ('9f3c2c6f-ab64-4f3d-baa6-42f40dc27e67', 'browser', 'browser based authentication', 'master', 'basic-flow', true,
        true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in)
VALUES ('1c4d9282-1e73-4f06-9ab3-6040bd9d8a8c', 'forms', 'Username, password, otp and other auth forms.', 'master',
        'basic-flow', false, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in)
VALUES ('bd8cebae-0634-42ae-bebb-e6895fdc80f7', 'Browser - Conditional OTP',
        'Flow to determine if the OTP is required for the authentication', 'master', 'basic-flow', false, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in)
VALUES ('cb1c42d2-3794-4f51-8dce-ff687da4705d', 'direct grant', 'OpenID Connect Resource Owner Grant', 'master',
        'basic-flow', true, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in)
VALUES ('3ef66f8b-315b-4839-bb41-f748aa42a085', 'Direct Grant - Conditional OTP',
        'Flow to determine if the OTP is required for the authentication', 'master', 'basic-flow', false, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in)
VALUES ('da98a785-d0dc-4e03-8c53-46a22070b8f0', 'registration', 'registration flow', 'master', 'basic-flow', true,
        true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in)
VALUES ('653d0c00-ffec-4b2e-a390-eaca7677a242', 'registration form', 'registration form', 'master', 'form-flow', false,
        true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in)
VALUES ('5ad7d74e-2358-4c84-8870-4ba82b8b4ee3', 'reset credentials',
        'Reset credentials for a user if they forgot their password or something', 'master', 'basic-flow', true, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in)
VALUES ('1883306c-14c1-4b75-b327-10552649a982', 'Reset - Conditional OTP',
        'Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.', 'master', 'basic-flow', false,
        true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in)
VALUES ('2369b4a8-8686-4056-bac4-f588de4ff093', 'clients', 'Base authentication for clients', 'master', 'client-flow',
        true, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in)
VALUES ('cf2636c0-1542-466f-9d86-b3c4925061c3', 'first broker login',
        'Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account',
        'master', 'basic-flow', true, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in)
VALUES ('f6548858-10b3-400b-9d61-a6055af9ba0a', 'User creation or linking',
        'Flow for the existing/non-existing user alternatives', 'master', 'basic-flow', false, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in)
VALUES ('25fbdfec-4b9c-4400-996a-2115a4749120', 'Handle Existing Account',
        'Handle what to do if there is existing account with same email/username like authenticated identity provider',
        'master', 'basic-flow', false, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in)
VALUES ('2d3be1c4-97e7-4322-8579-1a256dca7960', 'Account verification options',
        'Method with which to verity the existing account', 'master', 'basic-flow', false, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in)
VALUES ('bf6c87fb-35e4-48cd-93e8-181ad4224093', 'Verify Existing Account by Re-authentication',
        'Reauthentication of existing account', 'master', 'basic-flow', false, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in)
VALUES ('3ae1f349-06e5-48b4-9618-3cd10b521b9d', 'First broker login - Conditional OTP',
        'Flow to determine if the OTP is required for the authentication', 'master', 'basic-flow', false, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in)
VALUES ('2b8ffb9e-9189-4e63-ab9e-1912ad4b00a8', 'saml ecp', 'SAML ECP Profile Authentication Flow', 'master',
        'basic-flow', true, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in)
VALUES ('33ab4bad-2cac-45fe-b4db-57bae7e00001', 'docker auth', 'Used by Docker clients to authenticate against the IDP',
        'master', 'basic-flow', true, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in)
VALUES ('12374bba-f50c-4d02-bfd5-dd67a76bae18', 'http challenge',
        'An authentication flow based on challenge-response HTTP Authentication Schemes', 'master', 'basic-flow', true,
        true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in)
VALUES ('e5be5a64-7fd1-420e-9fef-6bc3902f7f50', 'Authentication Options', 'Authentication options.', 'master',
        'basic-flow', false, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in)
VALUES ('aa2a5cb8-613b-492d-9dbe-1cc7cb6c320e', 'Account verification options',
        'Method with which to verity the existing account', 'CoreRealm', 'basic-flow', false, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in)
VALUES ('b69db3be-9d12-485c-91be-aee890d50048', 'Authentication Options', 'Authentication options.', 'CoreRealm',
        'basic-flow', false, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in)
VALUES ('258900bd-7470-4814-be69-4c02b0aa14cb', 'Browser - Conditional OTP',
        'Flow to determine if the OTP is required for the authentication', 'CoreRealm', 'basic-flow', false, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in)
VALUES ('2510b798-c3e0-4a76-a117-b1ad251ce461', 'Direct Grant - Conditional OTP',
        'Flow to determine if the OTP is required for the authentication', 'CoreRealm', 'basic-flow', false, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in)
VALUES ('1fb74cc4-a5dd-45e3-b1ed-75f7ca95166a', 'First broker login - Conditional OTP',
        'Flow to determine if the OTP is required for the authentication', 'CoreRealm', 'basic-flow', false, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in)
VALUES ('1c9d8076-5e2e-4d55-b6e0-f5a932dec005', 'Handle Existing Account',
        'Handle what to do if there is existing account with same email/username like authenticated identity provider',
        'CoreRealm', 'basic-flow', false, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in)
VALUES ('6350cb5a-74d3-4d8a-90e8-8f37309e7856', 'Reset - Conditional OTP',
        'Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.', 'CoreRealm', 'basic-flow',
        false, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in)
VALUES ('35a30192-997d-4aab-9cd9-5ca77f668557', 'User creation or linking',
        'Flow for the existing/non-existing user alternatives', 'CoreRealm', 'basic-flow', false, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in)
VALUES ('8d578a30-a22f-4648-8ebc-e1fbfb3f23ff', 'Verify Existing Account by Re-authentication',
        'Reauthentication of existing account', 'CoreRealm', 'basic-flow', false, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in)
VALUES ('c8874279-ecc7-43ab-b13f-93a1e16faaf9', 'browser', 'browser based authentication', 'CoreRealm', 'basic-flow',
        true, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in)
VALUES ('621c99b3-dea7-45b5-b723-350480747bb1', 'clients', 'Base authentication for clients', 'CoreRealm',
        'client-flow', true, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in)
VALUES ('9e6be99a-a235-4ca0-a59a-90d9fa364ad0', 'direct grant', 'OpenID Connect Resource Owner Grant', 'CoreRealm',
        'basic-flow', true, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in)
VALUES ('e041d4b7-3bbe-4c8c-9234-f31f4446e953', 'docker auth', 'Used by Docker clients to authenticate against the IDP',
        'CoreRealm', 'basic-flow', true, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in)
VALUES ('d30ab811-e495-479e-9556-0cee506e0335', 'first broker login',
        'Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account',
        'CoreRealm', 'basic-flow', true, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in)
VALUES ('5a2154d7-0d9a-403f-8568-40c05f4648ee', 'forms', 'Username, password, otp and other auth forms.', 'CoreRealm',
        'basic-flow', false, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in)
VALUES ('ef589e23-5c2b-4472-babe-128df3cc1217', 'http challenge',
        'An authentication flow based on challenge-response HTTP Authentication Schemes', 'CoreRealm', 'basic-flow',
        true, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in)
VALUES ('0c305325-05cd-4640-bf37-ef9627e8127d', 'registration', 'registration flow', 'CoreRealm', 'basic-flow', true,
        true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in)
VALUES ('014e2f86-118c-4dff-80d3-05e48c6c00d0', 'registration form', 'registration form', 'CoreRealm', 'form-flow',
        false, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in)
VALUES ('5482562b-942d-4f53-9e47-ff6d8c0aefdf', 'reset credentials',
        'Reset credentials for a user if they forgot their password or something', 'CoreRealm', 'basic-flow', true,
        true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in)
VALUES ('43fabf1f-029e-4ea7-a96c-1a9a024d8ce6', 'saml ecp', 'SAML ECP Profile Authentication Flow', 'CoreRealm',
        'basic-flow', true, true);


--
-- TOC entry 4162 (class 0 OID 17022)
-- Dependencies: 251
-- Data for Name: authenticator_config; Type: TABLE DATA; Schema: public; Owner: magnittest
--

INSERT INTO public.authenticator_config (id, alias, realm_id)
VALUES ('2847ba10-edcc-4665-bd4a-1a6c68d096f2', 'review profile config', 'master');
INSERT INTO public.authenticator_config (id, alias, realm_id)
VALUES ('e56e24e4-8080-4526-8d70-709ef620102e', 'create unique user config', 'master');
INSERT INTO public.authenticator_config (id, alias, realm_id)
VALUES ('47c25fdd-6d44-4f88-b592-611521e26ee9', 'create unique user config', 'CoreRealm');
INSERT INTO public.authenticator_config (id, alias, realm_id)
VALUES ('372a5292-c345-4e09-86c7-db3eacc8bf33', 'review profile config', 'CoreRealm');


--
-- TOC entry 4165 (class 0 OID 17037)
-- Dependencies: 254
-- Data for Name: authenticator_config_entry; Type: TABLE DATA; Schema: public; Owner: magnittest
--

INSERT INTO public.authenticator_config_entry (authenticator_id, value, name)
VALUES ('2847ba10-edcc-4665-bd4a-1a6c68d096f2', 'missing', 'update.profile.on.first.login');
INSERT INTO public.authenticator_config_entry (authenticator_id, value, name)
VALUES ('e56e24e4-8080-4526-8d70-709ef620102e', 'false', 'require.password.update.after.registration');
INSERT INTO public.authenticator_config_entry (authenticator_id, value, name)
VALUES ('47c25fdd-6d44-4f88-b592-611521e26ee9', 'false', 'require.password.update.after.registration');
INSERT INTO public.authenticator_config_entry (authenticator_id, value, name)
VALUES ('372a5292-c345-4e09-86c7-db3eacc8bf33', 'missing', 'update.profile.on.first.login');


--
-- TOC entry 4191 (class 0 OID 17477)
-- Dependencies: 280
-- Data for Name: broker_link; Type: TABLE DATA; Schema: public; Owner: magnittest
--


--
-- TOC entry 4122 (class 0 OID 16398)
-- Dependencies: 211
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: magnittest
--

INSERT INTO public.client (id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url,
                           bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout,
                           frontchannel_logout, consent_required, name, service_accounts_enabled,
                           client_authenticator_type, root_url, description, registration_token, standard_flow_enabled,
                           implicit_flow_enabled, direct_access_grants_enabled, always_display_in_console)
VALUES ('3ee8f127-eb12-47e6-b244-12c2032aa970', true, false, 'master-realm', 0, false, NULL, NULL, true, NULL, false,
        'master', NULL, 0, false, false, 'master Realm', false, 'client-secret', NULL, NULL, NULL, true, false, false,
        false);
INSERT INTO public.client (id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url,
                           bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout,
                           frontchannel_logout, consent_required, name, service_accounts_enabled,
                           client_authenticator_type, root_url, description, registration_token, standard_flow_enabled,
                           implicit_flow_enabled, direct_access_grants_enabled, always_display_in_console)
VALUES ('84a8181d-8ab4-443c-b8d0-795a8ad439a3', true, false, 'account', 0, true, NULL, '/realms/master/account/', false,
        NULL, false, 'master', 'openid-connect', 0, false, false, '${client_account}', false, 'client-secret',
        '${authBaseUrl}', NULL, NULL, true, false, false, false);
INSERT INTO public.client (id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url,
                           bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout,
                           frontchannel_logout, consent_required, name, service_accounts_enabled,
                           client_authenticator_type, root_url, description, registration_token, standard_flow_enabled,
                           implicit_flow_enabled, direct_access_grants_enabled, always_display_in_console)
VALUES ('8504b483-2893-442f-be1c-cda746f649cb', true, false, 'broker', 0, false, NULL, NULL, true, NULL, false,
        'master', 'openid-connect', 0, false, false, '${client_broker}', false, 'client-secret', NULL, NULL, NULL, true,
        false, false, false);
INSERT INTO public.client (id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url,
                           bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout,
                           frontchannel_logout, consent_required, name, service_accounts_enabled,
                           client_authenticator_type, root_url, description, registration_token, standard_flow_enabled,
                           implicit_flow_enabled, direct_access_grants_enabled, always_display_in_console)
VALUES ('20bc77ee-a5b5-49fd-a844-4ca70936bf3c', true, false, 'security-admin-console', 0, true, NULL,
        '/admin/master/console/', false, NULL, false, 'master', 'openid-connect', 0, false, false,
        '${client_security-admin-console}', false, 'client-secret', '${authAdminUrl}', NULL, NULL, true, false, false,
        false);
INSERT INTO public.client (id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url,
                           bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout,
                           frontchannel_logout, consent_required, name, service_accounts_enabled,
                           client_authenticator_type, root_url, description, registration_token, standard_flow_enabled,
                           implicit_flow_enabled, direct_access_grants_enabled, always_display_in_console)
VALUES ('d3bfe4bb-efa1-49d1-85a2-1d70d28b250e', true, false, 'admin-cli', 0, true, NULL, NULL, false, NULL, false,
        'master', 'openid-connect', 0, false, false, '${client_admin-cli}', false, 'client-secret', NULL, NULL, NULL,
        false, false, true, false);
INSERT INTO public.client (id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url,
                           bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout,
                           frontchannel_logout, consent_required, name, service_accounts_enabled,
                           client_authenticator_type, root_url, description, registration_token, standard_flow_enabled,
                           implicit_flow_enabled, direct_access_grants_enabled, always_display_in_console)
VALUES ('33c55894-c8a9-4ba4-8f91-64ed6c71eb26', true, false, 'realm-management', 0, false, NULL, NULL, true, NULL,
        false, 'CoreRealm', 'openid-connect', 0, false, false, '${client_realm-management}', false, 'client-secret',
        NULL, NULL, NULL, true, false, false, false);
INSERT INTO public.client (id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url,
                           bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout,
                           frontchannel_logout, consent_required, name, service_accounts_enabled,
                           client_authenticator_type, root_url, description, registration_token, standard_flow_enabled,
                           implicit_flow_enabled, direct_access_grants_enabled, always_display_in_console)
VALUES ('51a6b69c-8ad8-458d-94dd-c8919a688046', true, false, 'security-admin-console', 0, true, NULL,
        '/admin/CoreRealm/console/', false, NULL, false, 'CoreRealm', 'openid-connect', 0, false, false,
        '${client_security-admin-console}', false, 'client-secret', '${authAdminUrl}', NULL, NULL, true, false, false,
        false);
INSERT INTO public.client (id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url,
                           bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout,
                           frontchannel_logout, consent_required, name, service_accounts_enabled,
                           client_authenticator_type, root_url, description, registration_token, standard_flow_enabled,
                           implicit_flow_enabled, direct_access_grants_enabled, always_display_in_console)
VALUES ('75bf2e37-dcc7-42a4-bc94-79a2da14c029', true, false, 'account-console', 0, true, NULL,
        '/realms/CoreRealm/account/', false, NULL, false, 'master', 'openid-connect', 0, false, false,
        '${client_account-console}', false, 'client-secret', '${authBaseUrl}', NULL, NULL, true, false, false, false);
INSERT INTO public.client (id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url,
                           bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout,
                           frontchannel_logout, consent_required, name, service_accounts_enabled,
                           client_authenticator_type, root_url, description, registration_token, standard_flow_enabled,
                           implicit_flow_enabled, direct_access_grants_enabled, always_display_in_console)
VALUES ('f0c04cb9-541a-4192-ae8d-1c406fb61794', true, true, 'core', 0, false, '**********', 'http://localhost', false,
        NULL, false, 'master', 'openid-connect', -1, false, false, NULL, true, 'client-secret', 'http://localhost',
        NULL, NULL, true, false, false, true);
INSERT INTO public.client (id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url,
                           bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout,
                           frontchannel_logout, consent_required, name, service_accounts_enabled,
                           client_authenticator_type, root_url, description, registration_token, standard_flow_enabled,
                           implicit_flow_enabled, direct_access_grants_enabled, always_display_in_console)
VALUES ('e97410ff-be3b-4e9f-8e62-2b5f20f72c44', true, false, 'CoreRealm-realm', 0, false, NULL, NULL, true, NULL, false,
        'master', NULL, 0, false, false, 'CoreRealm Realm', false, 'client-secret', NULL, NULL, NULL, true, false,
        false, false);
INSERT INTO public.client (id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url,
                           bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout,
                           frontchannel_logout, consent_required, name, service_accounts_enabled,
                           client_authenticator_type, root_url, description, registration_token, standard_flow_enabled,
                           implicit_flow_enabled, direct_access_grants_enabled, always_display_in_console)
VALUES ('a9b58495-213e-4c37-9d10-548a76bdf8dc', true, false, 'account', 0, true, NULL, '/realms/CoreRealm/account/',
        false, NULL, false, 'CoreRealm', 'openid-connect', 0, false, false, '${client_account}', false, 'client-secret',
        '${authBaseUrl}', NULL, NULL, true, false, false, false);
INSERT INTO public.client (id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url,
                           bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout,
                           frontchannel_logout, consent_required, name, service_accounts_enabled,
                           client_authenticator_type, root_url, description, registration_token, standard_flow_enabled,
                           implicit_flow_enabled, direct_access_grants_enabled, always_display_in_console)
VALUES ('02c23fb3-34df-4dbe-8045-ce1f85f03033', true, false, 'account-console', 0, true, NULL,
        '/realms/CoreRealm/account/', false, NULL, false, 'CoreRealm', 'openid-connect', 0, false, false,
        '${client_account-console}', false, 'client-secret', '${authBaseUrl}', NULL, NULL, true, false, false, false);
INSERT INTO public.client (id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url,
                           bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout,
                           frontchannel_logout, consent_required, name, service_accounts_enabled,
                           client_authenticator_type, root_url, description, registration_token, standard_flow_enabled,
                           implicit_flow_enabled, direct_access_grants_enabled, always_display_in_console)
VALUES ('2e3fb4e8-9999-4ebd-8cda-a69af7561fe1', true, false, 'admin-cli', 0, true, NULL, NULL, false, NULL, false,
        'CoreRealm', 'openid-connect', 0, false, false, '${client_admin-cli}', false, 'client-secret', NULL, NULL, NULL,
        false, false, true, false);
INSERT INTO public.client (id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url,
                           bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout,
                           frontchannel_logout, consent_required, name, service_accounts_enabled,
                           client_authenticator_type, root_url, description, registration_token, standard_flow_enabled,
                           implicit_flow_enabled, direct_access_grants_enabled, always_display_in_console)
VALUES ('bb705eb6-2a29-4aa0-a7b6-8c4dc1579246', true, false, 'broker', 0, false, NULL, NULL, true, NULL, false,
        'CoreRealm', 'openid-connect', 0, false, false, '${client_broker}', false, 'client-secret', NULL, NULL, NULL,
        true, false, false, false);
INSERT INTO public.client (id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url,
                           bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout,
                           frontchannel_logout, consent_required, name, service_accounts_enabled,
                           client_authenticator_type, root_url, description, registration_token, standard_flow_enabled,
                           implicit_flow_enabled, direct_access_grants_enabled, always_display_in_console)
VALUES ('d521b2b1-b33e-4a55-a524-ab3d9fb5ef93', true, true, 'core', 0, false, 'FIrZ9L6m6UZvnBuEMDX9JsoIVt69215f', NULL,
        false, 'http://localhost', false, 'CoreRealm', 'openid-connect', -1, false, false, NULL, true, 'client-secret',
        'http://localhost', NULL, NULL, true, false, true, false);


--
-- TOC entry 4145 (class 0 OID 16756)
-- Dependencies: 234
-- Data for Name: client_attributes; Type: TABLE DATA; Schema: public; Owner: magnittest
--

INSERT INTO public.client_attributes (client_id, value, name)
VALUES ('02c23fb3-34df-4dbe-8045-ce1f85f03033', 'S256', 'pkce.code.challenge.method');
INSERT INTO public.client_attributes (client_id, value, name)
VALUES ('20bc77ee-a5b5-49fd-a844-4ca70936bf3c', 'S256', 'pkce.code.challenge.method');
INSERT INTO public.client_attributes (client_id, value, name)
VALUES ('51a6b69c-8ad8-458d-94dd-c8919a688046', 'S256', 'pkce.code.challenge.method');
INSERT INTO public.client_attributes (client_id, value, name)
VALUES ('d521b2b1-b33e-4a55-a524-ab3d9fb5ef93', 'true', 'backchannel.logout.session.required');
INSERT INTO public.client_attributes (client_id, value, name)
VALUES ('d521b2b1-b33e-4a55-a524-ab3d9fb5ef93', 'false', 'backchannel.logout.revoke.offline.tokens');
INSERT INTO public.client_attributes (client_id, value, name)
VALUES ('d521b2b1-b33e-4a55-a524-ab3d9fb5ef93', 'false', 'saml.artifact.binding');
INSERT INTO public.client_attributes (client_id, value, name)
VALUES ('d521b2b1-b33e-4a55-a524-ab3d9fb5ef93', 'false', 'saml.server.signature');
INSERT INTO public.client_attributes (client_id, value, name)
VALUES ('d521b2b1-b33e-4a55-a524-ab3d9fb5ef93', 'false', 'saml.server.signature.keyinfo.ext');
INSERT INTO public.client_attributes (client_id, value, name)
VALUES ('d521b2b1-b33e-4a55-a524-ab3d9fb5ef93', 'false', 'saml.assertion.signature');
INSERT INTO public.client_attributes (client_id, value, name)
VALUES ('d521b2b1-b33e-4a55-a524-ab3d9fb5ef93', 'false', 'saml.client.signature');
INSERT INTO public.client_attributes (client_id, value, name)
VALUES ('d521b2b1-b33e-4a55-a524-ab3d9fb5ef93', 'false', 'saml.encrypt');
INSERT INTO public.client_attributes (client_id, value, name)
VALUES ('d521b2b1-b33e-4a55-a524-ab3d9fb5ef93', 'false', 'saml.authnstatement');
INSERT INTO public.client_attributes (client_id, value, name)
VALUES ('d521b2b1-b33e-4a55-a524-ab3d9fb5ef93', 'false', 'saml.onetimeuse.condition');
INSERT INTO public.client_attributes (client_id, value, name)
VALUES ('d521b2b1-b33e-4a55-a524-ab3d9fb5ef93', 'false', 'saml_force_name_id_format');
INSERT INTO public.client_attributes (client_id, value, name)
VALUES ('d521b2b1-b33e-4a55-a524-ab3d9fb5ef93', 'false', 'saml.multivalued.roles');
INSERT INTO public.client_attributes (client_id, value, name)
VALUES ('d521b2b1-b33e-4a55-a524-ab3d9fb5ef93', 'false', 'saml.force.post.binding');
INSERT INTO public.client_attributes (client_id, value, name)
VALUES ('d521b2b1-b33e-4a55-a524-ab3d9fb5ef93', 'false', 'exclude.session.state.from.auth.response');
INSERT INTO public.client_attributes (client_id, value, name)
VALUES ('d521b2b1-b33e-4a55-a524-ab3d9fb5ef93', 'false', 'oauth2.device.authorization.grant.enabled');
INSERT INTO public.client_attributes (client_id, value, name)
VALUES ('d521b2b1-b33e-4a55-a524-ab3d9fb5ef93', 'false', 'oidc.ciba.grant.enabled');
INSERT INTO public.client_attributes (client_id, value, name)
VALUES ('d521b2b1-b33e-4a55-a524-ab3d9fb5ef93', 'true', 'use.refresh.tokens');
INSERT INTO public.client_attributes (client_id, value, name)
VALUES ('d521b2b1-b33e-4a55-a524-ab3d9fb5ef93', 'false', 'id.token.as.detached.signature');
INSERT INTO public.client_attributes (client_id, value, name)
VALUES ('d521b2b1-b33e-4a55-a524-ab3d9fb5ef93', 'false', 'tls.client.certificate.bound.access.tokens');
INSERT INTO public.client_attributes (client_id, value, name)
VALUES ('d521b2b1-b33e-4a55-a524-ab3d9fb5ef93', 'false', 'require.pushed.authorization.requests');
INSERT INTO public.client_attributes (client_id, value, name)
VALUES ('d521b2b1-b33e-4a55-a524-ab3d9fb5ef93', 'false', 'client_credentials.use_refresh_token');
INSERT INTO public.client_attributes (client_id, value, name)
VALUES ('d521b2b1-b33e-4a55-a524-ab3d9fb5ef93', 'false', 'display.on.consent.screen');
INSERT INTO public.client_attributes (client_id, value, name)
VALUES ('f0c04cb9-541a-4192-ae8d-1c406fb61794', 'false', 'saml.assertion.signature');
INSERT INTO public.client_attributes (client_id, value, name)
VALUES ('f0c04cb9-541a-4192-ae8d-1c406fb61794', 'false', 'id.token.as.detached.signature');
INSERT INTO public.client_attributes (client_id, value, name)
VALUES ('f0c04cb9-541a-4192-ae8d-1c406fb61794', 'false', 'saml.multivalued.roles');
INSERT INTO public.client_attributes (client_id, value, name)
VALUES ('f0c04cb9-541a-4192-ae8d-1c406fb61794', 'false', 'saml.force.post.binding');
INSERT INTO public.client_attributes (client_id, value, name)
VALUES ('f0c04cb9-541a-4192-ae8d-1c406fb61794', 'false', 'saml.encrypt');
INSERT INTO public.client_attributes (client_id, value, name)
VALUES ('f0c04cb9-541a-4192-ae8d-1c406fb61794', 'false', 'oauth2.device.authorization.grant.enabled');
INSERT INTO public.client_attributes (client_id, value, name)
VALUES ('f0c04cb9-541a-4192-ae8d-1c406fb61794', 'false', 'backchannel.logout.revoke.offline.tokens');
INSERT INTO public.client_attributes (client_id, value, name)
VALUES ('f0c04cb9-541a-4192-ae8d-1c406fb61794', 'false', 'saml.server.signature');
INSERT INTO public.client_attributes (client_id, value, name)
VALUES ('f0c04cb9-541a-4192-ae8d-1c406fb61794', 'false', 'saml.server.signature.keyinfo.ext');
INSERT INTO public.client_attributes (client_id, value, name)
VALUES ('f0c04cb9-541a-4192-ae8d-1c406fb61794', 'true', 'use.refresh.tokens');
INSERT INTO public.client_attributes (client_id, value, name)
VALUES ('f0c04cb9-541a-4192-ae8d-1c406fb61794', 'false', 'exclude.session.state.from.auth.response');
INSERT INTO public.client_attributes (client_id, value, name)
VALUES ('f0c04cb9-541a-4192-ae8d-1c406fb61794', 'false', 'oidc.ciba.grant.enabled');
INSERT INTO public.client_attributes (client_id, value, name)
VALUES ('f0c04cb9-541a-4192-ae8d-1c406fb61794', 'false', 'saml.artifact.binding');
INSERT INTO public.client_attributes (client_id, value, name)
VALUES ('f0c04cb9-541a-4192-ae8d-1c406fb61794', 'true', 'backchannel.logout.session.required');
INSERT INTO public.client_attributes (client_id, value, name)
VALUES ('f0c04cb9-541a-4192-ae8d-1c406fb61794', 'false', 'client_credentials.use_refresh_token');
INSERT INTO public.client_attributes (client_id, value, name)
VALUES ('f0c04cb9-541a-4192-ae8d-1c406fb61794', 'false', 'saml_force_name_id_format');
INSERT INTO public.client_attributes (client_id, value, name)
VALUES ('f0c04cb9-541a-4192-ae8d-1c406fb61794', 'false', 'saml.client.signature');
INSERT INTO public.client_attributes (client_id, value, name)
VALUES ('f0c04cb9-541a-4192-ae8d-1c406fb61794', 'false', 'tls.client.certificate.bound.access.tokens');
INSERT INTO public.client_attributes (client_id, value, name)
VALUES ('f0c04cb9-541a-4192-ae8d-1c406fb61794', 'false', 'require.pushed.authorization.requests');
INSERT INTO public.client_attributes (client_id, value, name)
VALUES ('f0c04cb9-541a-4192-ae8d-1c406fb61794', 'false', 'saml.authnstatement');
INSERT INTO public.client_attributes (client_id, value, name)
VALUES ('f0c04cb9-541a-4192-ae8d-1c406fb61794', 'false', 'display.on.consent.screen');
INSERT INTO public.client_attributes (client_id, value, name)
VALUES ('f0c04cb9-541a-4192-ae8d-1c406fb61794', 'false', 'saml.onetimeuse.condition');
INSERT INTO public.client_attributes (client_id, value, name)
VALUES ('75bf2e37-dcc7-42a4-bc94-79a2da14c029', 'S256', 'pkce.code.challenge.method');


--
-- TOC entry 4202 (class 0 OID 17726)
-- Dependencies: 291
-- Data for Name: client_auth_flow_bindings; Type: TABLE DATA; Schema: public; Owner: magnittest
--


--
-- TOC entry 4201 (class 0 OID 17601)
-- Dependencies: 290
-- Data for Name: client_initial_access; Type: TABLE DATA; Schema: public; Owner: magnittest
--


--
-- TOC entry 4147 (class 0 OID 16766)
-- Dependencies: 236
-- Data for Name: client_node_registrations; Type: TABLE DATA; Schema: public; Owner: magnittest
--


--
-- TOC entry 4179 (class 0 OID 17266)
-- Dependencies: 268
-- Data for Name: client_scope; Type: TABLE DATA; Schema: public; Owner: magnittest
--

INSERT INTO public.client_scope (id, name, realm_id, description, protocol)
VALUES ('9b385db8-f556-4b35-9038-78724b8322d1', 'offline_access', 'master',
        'OpenID Connect built-in scope: offline_access', 'openid-connect');
INSERT INTO public.client_scope (id, name, realm_id, description, protocol)
VALUES ('1fa570c4-f1de-4e65-bf32-d49596205e4a', 'role_list', 'master', 'SAML role list', 'saml');
INSERT INTO public.client_scope (id, name, realm_id, description, protocol)
VALUES ('08246169-7f99-4a9e-8afb-f90ef919e38a', 'profile', 'master', 'OpenID Connect built-in scope: profile',
        'openid-connect');
INSERT INTO public.client_scope (id, name, realm_id, description, protocol)
VALUES ('d283e024-290a-46eb-9b41-b89571e1b2c5', 'email', 'master', 'OpenID Connect built-in scope: email',
        'openid-connect');
INSERT INTO public.client_scope (id, name, realm_id, description, protocol)
VALUES ('9c58a12c-0612-425b-9eb9-4a8d9128cd70', 'address', 'master', 'OpenID Connect built-in scope: address',
        'openid-connect');
INSERT INTO public.client_scope (id, name, realm_id, description, protocol)
VALUES ('dd115e44-65f9-4ecf-924a-365893e6cbe1', 'phone', 'master', 'OpenID Connect built-in scope: phone',
        'openid-connect');
INSERT INTO public.client_scope (id, name, realm_id, description, protocol)
VALUES ('caa60bb2-6e7b-4269-99e1-df55a6373056', 'roles', 'master',
        'OpenID Connect scope for add user roles to the access token', 'openid-connect');
INSERT INTO public.client_scope (id, name, realm_id, description, protocol)
VALUES ('a9ecffd4-d0d9-4825-8677-9bdd22901fe1', 'web-origins', 'master',
        'OpenID Connect scope for add allowed web origins to the access token', 'openid-connect');
INSERT INTO public.client_scope (id, name, realm_id, description, protocol)
VALUES ('844f4726-cd45-4e06-88ff-92a3b1d8a089', 'microprofile-jwt', 'master', 'Microprofile - JWT built-in scope',
        'openid-connect');
INSERT INTO public.client_scope (id, name, realm_id, description, protocol)
VALUES ('233807dd-cd6a-4dff-90ef-60594f541bc5', 'phone', 'CoreRealm', 'OpenID Connect built-in scope: phone',
        'openid-connect');
INSERT INTO public.client_scope (id, name, realm_id, description, protocol)
VALUES ('dad43592-70d2-4ebd-ae1a-1a2d7b21db12', 'microprofile-jwt', 'CoreRealm', 'Microprofile - JWT built-in scope',
        'openid-connect');
INSERT INTO public.client_scope (id, name, realm_id, description, protocol)
VALUES ('b0ab1a7f-8bfa-4c0b-bd55-6335b3826530', 'email', 'CoreRealm', 'OpenID Connect built-in scope: email',
        'openid-connect');
INSERT INTO public.client_scope (id, name, realm_id, description, protocol)
VALUES ('eb4adf8e-d668-4a1c-beba-2d6ce867a1a1', 'roles', 'CoreRealm',
        'OpenID Connect scope for add user roles to the access token', 'openid-connect');
INSERT INTO public.client_scope (id, name, realm_id, description, protocol)
VALUES ('c61fabbf-a68b-49ef-a23f-29d674e422f4', 'role_list', 'CoreRealm', 'SAML role list', 'saml');
INSERT INTO public.client_scope (id, name, realm_id, description, protocol)
VALUES ('421c8df6-09e7-49b0-b3dd-8c8aece0c497', 'profile', 'CoreRealm', 'OpenID Connect built-in scope: profile',
        'openid-connect');
INSERT INTO public.client_scope (id, name, realm_id, description, protocol)
VALUES ('a31d7ccc-a026-4491-afd0-c9eee180b464', 'offline_access', 'CoreRealm',
        'OpenID Connect built-in scope: offline_access', 'openid-connect');
INSERT INTO public.client_scope (id, name, realm_id, description, protocol)
VALUES ('fed16ddf-f8c8-48dc-95ab-12200d026faf', 'address', 'CoreRealm', 'OpenID Connect built-in scope: address',
        'openid-connect');
INSERT INTO public.client_scope (id, name, realm_id, description, protocol)
VALUES ('bcfd119a-b7be-4959-b4f5-636890cd051b', 'web-origins', 'CoreRealm',
        'OpenID Connect scope for add allowed web origins to the access token', 'openid-connect');


--
-- TOC entry 4180 (class 0 OID 17280)
-- Dependencies: 269
-- Data for Name: client_scope_attributes; Type: TABLE DATA; Schema: public; Owner: magnittest
--

INSERT INTO public.client_scope_attributes (scope_id, value, name)
VALUES ('9b385db8-f556-4b35-9038-78724b8322d1', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes (scope_id, value, name)
VALUES ('9b385db8-f556-4b35-9038-78724b8322d1', '${offlineAccessScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes (scope_id, value, name)
VALUES ('1fa570c4-f1de-4e65-bf32-d49596205e4a', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes (scope_id, value, name)
VALUES ('1fa570c4-f1de-4e65-bf32-d49596205e4a', '${samlRoleListScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes (scope_id, value, name)
VALUES ('08246169-7f99-4a9e-8afb-f90ef919e38a', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes (scope_id, value, name)
VALUES ('08246169-7f99-4a9e-8afb-f90ef919e38a', '${profileScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes (scope_id, value, name)
VALUES ('08246169-7f99-4a9e-8afb-f90ef919e38a', 'true', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes (scope_id, value, name)
VALUES ('d283e024-290a-46eb-9b41-b89571e1b2c5', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes (scope_id, value, name)
VALUES ('d283e024-290a-46eb-9b41-b89571e1b2c5', '${emailScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes (scope_id, value, name)
VALUES ('d283e024-290a-46eb-9b41-b89571e1b2c5', 'true', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes (scope_id, value, name)
VALUES ('9c58a12c-0612-425b-9eb9-4a8d9128cd70', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes (scope_id, value, name)
VALUES ('9c58a12c-0612-425b-9eb9-4a8d9128cd70', '${addressScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes (scope_id, value, name)
VALUES ('9c58a12c-0612-425b-9eb9-4a8d9128cd70', 'true', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes (scope_id, value, name)
VALUES ('dd115e44-65f9-4ecf-924a-365893e6cbe1', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes (scope_id, value, name)
VALUES ('dd115e44-65f9-4ecf-924a-365893e6cbe1', '${phoneScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes (scope_id, value, name)
VALUES ('dd115e44-65f9-4ecf-924a-365893e6cbe1', 'true', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes (scope_id, value, name)
VALUES ('caa60bb2-6e7b-4269-99e1-df55a6373056', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes (scope_id, value, name)
VALUES ('caa60bb2-6e7b-4269-99e1-df55a6373056', '${rolesScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes (scope_id, value, name)
VALUES ('caa60bb2-6e7b-4269-99e1-df55a6373056', 'false', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes (scope_id, value, name)
VALUES ('a9ecffd4-d0d9-4825-8677-9bdd22901fe1', 'false', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes (scope_id, value, name)
VALUES ('a9ecffd4-d0d9-4825-8677-9bdd22901fe1', '', 'consent.screen.text');
INSERT INTO public.client_scope_attributes (scope_id, value, name)
VALUES ('a9ecffd4-d0d9-4825-8677-9bdd22901fe1', 'false', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes (scope_id, value, name)
VALUES ('844f4726-cd45-4e06-88ff-92a3b1d8a089', 'false', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes (scope_id, value, name)
VALUES ('844f4726-cd45-4e06-88ff-92a3b1d8a089', 'true', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes (scope_id, value, name)
VALUES ('233807dd-cd6a-4dff-90ef-60594f541bc5', 'true', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes (scope_id, value, name)
VALUES ('233807dd-cd6a-4dff-90ef-60594f541bc5', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes (scope_id, value, name)
VALUES ('233807dd-cd6a-4dff-90ef-60594f541bc5', '${phoneScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes (scope_id, value, name)
VALUES ('dad43592-70d2-4ebd-ae1a-1a2d7b21db12', 'true', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes (scope_id, value, name)
VALUES ('dad43592-70d2-4ebd-ae1a-1a2d7b21db12', 'false', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes (scope_id, value, name)
VALUES ('b0ab1a7f-8bfa-4c0b-bd55-6335b3826530', 'true', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes (scope_id, value, name)
VALUES ('b0ab1a7f-8bfa-4c0b-bd55-6335b3826530', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes (scope_id, value, name)
VALUES ('b0ab1a7f-8bfa-4c0b-bd55-6335b3826530', '${emailScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes (scope_id, value, name)
VALUES ('eb4adf8e-d668-4a1c-beba-2d6ce867a1a1', 'false', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes (scope_id, value, name)
VALUES ('eb4adf8e-d668-4a1c-beba-2d6ce867a1a1', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes (scope_id, value, name)
VALUES ('eb4adf8e-d668-4a1c-beba-2d6ce867a1a1', '${rolesScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes (scope_id, value, name)
VALUES ('c61fabbf-a68b-49ef-a23f-29d674e422f4', '${samlRoleListScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes (scope_id, value, name)
VALUES ('c61fabbf-a68b-49ef-a23f-29d674e422f4', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes (scope_id, value, name)
VALUES ('421c8df6-09e7-49b0-b3dd-8c8aece0c497', 'true', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes (scope_id, value, name)
VALUES ('421c8df6-09e7-49b0-b3dd-8c8aece0c497', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes (scope_id, value, name)
VALUES ('421c8df6-09e7-49b0-b3dd-8c8aece0c497', '${profileScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes (scope_id, value, name)
VALUES ('a31d7ccc-a026-4491-afd0-c9eee180b464', '${offlineAccessScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes (scope_id, value, name)
VALUES ('a31d7ccc-a026-4491-afd0-c9eee180b464', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes (scope_id, value, name)
VALUES ('fed16ddf-f8c8-48dc-95ab-12200d026faf', 'true', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes (scope_id, value, name)
VALUES ('fed16ddf-f8c8-48dc-95ab-12200d026faf', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes (scope_id, value, name)
VALUES ('fed16ddf-f8c8-48dc-95ab-12200d026faf', '${addressScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes (scope_id, value, name)
VALUES ('bcfd119a-b7be-4959-b4f5-636890cd051b', 'false', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes (scope_id, value, name)
VALUES ('bcfd119a-b7be-4959-b4f5-636890cd051b', 'false', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes (scope_id, value, name)
VALUES ('bcfd119a-b7be-4959-b4f5-636890cd051b', '', 'consent.screen.text');


--
-- TOC entry 4203 (class 0 OID 17767)
-- Dependencies: 292
-- Data for Name: client_scope_client; Type: TABLE DATA; Schema: public; Owner: magnittest
--

INSERT INTO public.client_scope_client (client_id, scope_id, default_scope)
VALUES ('84a8181d-8ab4-443c-b8d0-795a8ad439a3', 'd283e024-290a-46eb-9b41-b89571e1b2c5', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope)
VALUES ('84a8181d-8ab4-443c-b8d0-795a8ad439a3', 'caa60bb2-6e7b-4269-99e1-df55a6373056', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope)
VALUES ('84a8181d-8ab4-443c-b8d0-795a8ad439a3', 'a9ecffd4-d0d9-4825-8677-9bdd22901fe1', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope)
VALUES ('84a8181d-8ab4-443c-b8d0-795a8ad439a3', '08246169-7f99-4a9e-8afb-f90ef919e38a', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope)
VALUES ('84a8181d-8ab4-443c-b8d0-795a8ad439a3', '9c58a12c-0612-425b-9eb9-4a8d9128cd70', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope)
VALUES ('84a8181d-8ab4-443c-b8d0-795a8ad439a3', '844f4726-cd45-4e06-88ff-92a3b1d8a089', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope)
VALUES ('84a8181d-8ab4-443c-b8d0-795a8ad439a3', '9b385db8-f556-4b35-9038-78724b8322d1', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope)
VALUES ('84a8181d-8ab4-443c-b8d0-795a8ad439a3', 'dd115e44-65f9-4ecf-924a-365893e6cbe1', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope)
VALUES ('d3bfe4bb-efa1-49d1-85a2-1d70d28b250e', 'd283e024-290a-46eb-9b41-b89571e1b2c5', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope)
VALUES ('d3bfe4bb-efa1-49d1-85a2-1d70d28b250e', 'caa60bb2-6e7b-4269-99e1-df55a6373056', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope)
VALUES ('d3bfe4bb-efa1-49d1-85a2-1d70d28b250e', 'a9ecffd4-d0d9-4825-8677-9bdd22901fe1', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope)
VALUES ('d3bfe4bb-efa1-49d1-85a2-1d70d28b250e', '08246169-7f99-4a9e-8afb-f90ef919e38a', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope)
VALUES ('d3bfe4bb-efa1-49d1-85a2-1d70d28b250e', '9c58a12c-0612-425b-9eb9-4a8d9128cd70', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope)
VALUES ('d3bfe4bb-efa1-49d1-85a2-1d70d28b250e', '844f4726-cd45-4e06-88ff-92a3b1d8a089', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope)
VALUES ('d3bfe4bb-efa1-49d1-85a2-1d70d28b250e', '9b385db8-f556-4b35-9038-78724b8322d1', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope)
VALUES ('d3bfe4bb-efa1-49d1-85a2-1d70d28b250e', 'dd115e44-65f9-4ecf-924a-365893e6cbe1', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope)
VALUES ('8504b483-2893-442f-be1c-cda746f649cb', 'd283e024-290a-46eb-9b41-b89571e1b2c5', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope)
VALUES ('8504b483-2893-442f-be1c-cda746f649cb', 'caa60bb2-6e7b-4269-99e1-df55a6373056', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope)
VALUES ('8504b483-2893-442f-be1c-cda746f649cb', 'a9ecffd4-d0d9-4825-8677-9bdd22901fe1', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope)
VALUES ('8504b483-2893-442f-be1c-cda746f649cb', '08246169-7f99-4a9e-8afb-f90ef919e38a', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope)
VALUES ('8504b483-2893-442f-be1c-cda746f649cb', '9c58a12c-0612-425b-9eb9-4a8d9128cd70', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope)
VALUES ('8504b483-2893-442f-be1c-cda746f649cb', '844f4726-cd45-4e06-88ff-92a3b1d8a089', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope)
VALUES ('8504b483-2893-442f-be1c-cda746f649cb', '9b385db8-f556-4b35-9038-78724b8322d1', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope)
VALUES ('8504b483-2893-442f-be1c-cda746f649cb', 'dd115e44-65f9-4ecf-924a-365893e6cbe1', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope)
VALUES ('3ee8f127-eb12-47e6-b244-12c2032aa970', 'd283e024-290a-46eb-9b41-b89571e1b2c5', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope)
VALUES ('3ee8f127-eb12-47e6-b244-12c2032aa970', 'caa60bb2-6e7b-4269-99e1-df55a6373056', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope)
VALUES ('3ee8f127-eb12-47e6-b244-12c2032aa970', 'a9ecffd4-d0d9-4825-8677-9bdd22901fe1', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope)
VALUES ('3ee8f127-eb12-47e6-b244-12c2032aa970', '08246169-7f99-4a9e-8afb-f90ef919e38a', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope)
VALUES ('3ee8f127-eb12-47e6-b244-12c2032aa970', '9c58a12c-0612-425b-9eb9-4a8d9128cd70', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope)
VALUES ('3ee8f127-eb12-47e6-b244-12c2032aa970', '844f4726-cd45-4e06-88ff-92a3b1d8a089', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope)
VALUES ('3ee8f127-eb12-47e6-b244-12c2032aa970', '9b385db8-f556-4b35-9038-78724b8322d1', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope)
VALUES ('3ee8f127-eb12-47e6-b244-12c2032aa970', 'dd115e44-65f9-4ecf-924a-365893e6cbe1', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope)
VALUES ('20bc77ee-a5b5-49fd-a844-4ca70936bf3c', 'd283e024-290a-46eb-9b41-b89571e1b2c5', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope)
VALUES ('20bc77ee-a5b5-49fd-a844-4ca70936bf3c', 'caa60bb2-6e7b-4269-99e1-df55a6373056', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope)
VALUES ('20bc77ee-a5b5-49fd-a844-4ca70936bf3c', 'a9ecffd4-d0d9-4825-8677-9bdd22901fe1', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope)
VALUES ('20bc77ee-a5b5-49fd-a844-4ca70936bf3c', '08246169-7f99-4a9e-8afb-f90ef919e38a', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope)
VALUES ('20bc77ee-a5b5-49fd-a844-4ca70936bf3c', '9c58a12c-0612-425b-9eb9-4a8d9128cd70', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope)
VALUES ('20bc77ee-a5b5-49fd-a844-4ca70936bf3c', '844f4726-cd45-4e06-88ff-92a3b1d8a089', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope)
VALUES ('20bc77ee-a5b5-49fd-a844-4ca70936bf3c', '9b385db8-f556-4b35-9038-78724b8322d1', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope)
VALUES ('20bc77ee-a5b5-49fd-a844-4ca70936bf3c', 'dd115e44-65f9-4ecf-924a-365893e6cbe1', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope)
VALUES ('a9b58495-213e-4c37-9d10-548a76bdf8dc', 'bcfd119a-b7be-4959-b4f5-636890cd051b', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope)
VALUES ('a9b58495-213e-4c37-9d10-548a76bdf8dc', 'eb4adf8e-d668-4a1c-beba-2d6ce867a1a1', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope)
VALUES ('a9b58495-213e-4c37-9d10-548a76bdf8dc', '421c8df6-09e7-49b0-b3dd-8c8aece0c497', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope)
VALUES ('a9b58495-213e-4c37-9d10-548a76bdf8dc', 'b0ab1a7f-8bfa-4c0b-bd55-6335b3826530', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope)
VALUES ('a9b58495-213e-4c37-9d10-548a76bdf8dc', 'fed16ddf-f8c8-48dc-95ab-12200d026faf', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope)
VALUES ('a9b58495-213e-4c37-9d10-548a76bdf8dc', '233807dd-cd6a-4dff-90ef-60594f541bc5', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope)
VALUES ('a9b58495-213e-4c37-9d10-548a76bdf8dc', 'a31d7ccc-a026-4491-afd0-c9eee180b464', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope)
VALUES ('a9b58495-213e-4c37-9d10-548a76bdf8dc', 'dad43592-70d2-4ebd-ae1a-1a2d7b21db12', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope)
VALUES ('02c23fb3-34df-4dbe-8045-ce1f85f03033', 'bcfd119a-b7be-4959-b4f5-636890cd051b', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope)
VALUES ('02c23fb3-34df-4dbe-8045-ce1f85f03033', 'eb4adf8e-d668-4a1c-beba-2d6ce867a1a1', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope)
VALUES ('02c23fb3-34df-4dbe-8045-ce1f85f03033', '421c8df6-09e7-49b0-b3dd-8c8aece0c497', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope)
VALUES ('02c23fb3-34df-4dbe-8045-ce1f85f03033', 'b0ab1a7f-8bfa-4c0b-bd55-6335b3826530', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope)
VALUES ('02c23fb3-34df-4dbe-8045-ce1f85f03033', 'fed16ddf-f8c8-48dc-95ab-12200d026faf', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope)
VALUES ('02c23fb3-34df-4dbe-8045-ce1f85f03033', '233807dd-cd6a-4dff-90ef-60594f541bc5', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope)
VALUES ('02c23fb3-34df-4dbe-8045-ce1f85f03033', 'a31d7ccc-a026-4491-afd0-c9eee180b464', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope)
VALUES ('02c23fb3-34df-4dbe-8045-ce1f85f03033', 'dad43592-70d2-4ebd-ae1a-1a2d7b21db12', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope)
VALUES ('2e3fb4e8-9999-4ebd-8cda-a69af7561fe1', 'bcfd119a-b7be-4959-b4f5-636890cd051b', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope)
VALUES ('2e3fb4e8-9999-4ebd-8cda-a69af7561fe1', 'eb4adf8e-d668-4a1c-beba-2d6ce867a1a1', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope)
VALUES ('2e3fb4e8-9999-4ebd-8cda-a69af7561fe1', '421c8df6-09e7-49b0-b3dd-8c8aece0c497', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope)
VALUES ('2e3fb4e8-9999-4ebd-8cda-a69af7561fe1', 'b0ab1a7f-8bfa-4c0b-bd55-6335b3826530', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope)
VALUES ('2e3fb4e8-9999-4ebd-8cda-a69af7561fe1', 'fed16ddf-f8c8-48dc-95ab-12200d026faf', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope)
VALUES ('2e3fb4e8-9999-4ebd-8cda-a69af7561fe1', '233807dd-cd6a-4dff-90ef-60594f541bc5', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope)
VALUES ('2e3fb4e8-9999-4ebd-8cda-a69af7561fe1', 'a31d7ccc-a026-4491-afd0-c9eee180b464', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope)
VALUES ('2e3fb4e8-9999-4ebd-8cda-a69af7561fe1', 'dad43592-70d2-4ebd-ae1a-1a2d7b21db12', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope)
VALUES ('bb705eb6-2a29-4aa0-a7b6-8c4dc1579246', 'bcfd119a-b7be-4959-b4f5-636890cd051b', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope)
VALUES ('bb705eb6-2a29-4aa0-a7b6-8c4dc1579246', 'eb4adf8e-d668-4a1c-beba-2d6ce867a1a1', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope)
VALUES ('bb705eb6-2a29-4aa0-a7b6-8c4dc1579246', '421c8df6-09e7-49b0-b3dd-8c8aece0c497', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope)
VALUES ('bb705eb6-2a29-4aa0-a7b6-8c4dc1579246', 'b0ab1a7f-8bfa-4c0b-bd55-6335b3826530', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope)
VALUES ('bb705eb6-2a29-4aa0-a7b6-8c4dc1579246', 'fed16ddf-f8c8-48dc-95ab-12200d026faf', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope)
VALUES ('bb705eb6-2a29-4aa0-a7b6-8c4dc1579246', '233807dd-cd6a-4dff-90ef-60594f541bc5', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope)
VALUES ('bb705eb6-2a29-4aa0-a7b6-8c4dc1579246', 'a31d7ccc-a026-4491-afd0-c9eee180b464', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope)
VALUES ('bb705eb6-2a29-4aa0-a7b6-8c4dc1579246', 'dad43592-70d2-4ebd-ae1a-1a2d7b21db12', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope)
VALUES ('33c55894-c8a9-4ba4-8f91-64ed6c71eb26', 'bcfd119a-b7be-4959-b4f5-636890cd051b', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope)
VALUES ('33c55894-c8a9-4ba4-8f91-64ed6c71eb26', 'eb4adf8e-d668-4a1c-beba-2d6ce867a1a1', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope)
VALUES ('33c55894-c8a9-4ba4-8f91-64ed6c71eb26', '421c8df6-09e7-49b0-b3dd-8c8aece0c497', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope)
VALUES ('f0c04cb9-541a-4192-ae8d-1c406fb61794', 'a9ecffd4-d0d9-4825-8677-9bdd22901fe1', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope)
VALUES ('f0c04cb9-541a-4192-ae8d-1c406fb61794', 'caa60bb2-6e7b-4269-99e1-df55a6373056', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope)
VALUES ('f0c04cb9-541a-4192-ae8d-1c406fb61794', '08246169-7f99-4a9e-8afb-f90ef919e38a', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope)
VALUES ('f0c04cb9-541a-4192-ae8d-1c406fb61794', 'd283e024-290a-46eb-9b41-b89571e1b2c5', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope)
VALUES ('f0c04cb9-541a-4192-ae8d-1c406fb61794', '9c58a12c-0612-425b-9eb9-4a8d9128cd70', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope)
VALUES ('f0c04cb9-541a-4192-ae8d-1c406fb61794', 'dd115e44-65f9-4ecf-924a-365893e6cbe1', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope)
VALUES ('f0c04cb9-541a-4192-ae8d-1c406fb61794', '9b385db8-f556-4b35-9038-78724b8322d1', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope)
VALUES ('f0c04cb9-541a-4192-ae8d-1c406fb61794', '844f4726-cd45-4e06-88ff-92a3b1d8a089', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope)
VALUES ('33c55894-c8a9-4ba4-8f91-64ed6c71eb26', 'b0ab1a7f-8bfa-4c0b-bd55-6335b3826530', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope)
VALUES ('33c55894-c8a9-4ba4-8f91-64ed6c71eb26', 'fed16ddf-f8c8-48dc-95ab-12200d026faf', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope)
VALUES ('33c55894-c8a9-4ba4-8f91-64ed6c71eb26', '233807dd-cd6a-4dff-90ef-60594f541bc5', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope)
VALUES ('75bf2e37-dcc7-42a4-bc94-79a2da14c029', 'a9ecffd4-d0d9-4825-8677-9bdd22901fe1', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope)
VALUES ('75bf2e37-dcc7-42a4-bc94-79a2da14c029', 'caa60bb2-6e7b-4269-99e1-df55a6373056', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope)
VALUES ('75bf2e37-dcc7-42a4-bc94-79a2da14c029', '08246169-7f99-4a9e-8afb-f90ef919e38a', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope)
VALUES ('75bf2e37-dcc7-42a4-bc94-79a2da14c029', 'd283e024-290a-46eb-9b41-b89571e1b2c5', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope)
VALUES ('75bf2e37-dcc7-42a4-bc94-79a2da14c029', '9c58a12c-0612-425b-9eb9-4a8d9128cd70', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope)
VALUES ('75bf2e37-dcc7-42a4-bc94-79a2da14c029', 'dd115e44-65f9-4ecf-924a-365893e6cbe1', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope)
VALUES ('75bf2e37-dcc7-42a4-bc94-79a2da14c029', '9b385db8-f556-4b35-9038-78724b8322d1', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope)
VALUES ('75bf2e37-dcc7-42a4-bc94-79a2da14c029', '844f4726-cd45-4e06-88ff-92a3b1d8a089', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope)
VALUES ('33c55894-c8a9-4ba4-8f91-64ed6c71eb26', 'a31d7ccc-a026-4491-afd0-c9eee180b464', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope)
VALUES ('33c55894-c8a9-4ba4-8f91-64ed6c71eb26', 'dad43592-70d2-4ebd-ae1a-1a2d7b21db12', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope)
VALUES ('51a6b69c-8ad8-458d-94dd-c8919a688046', 'bcfd119a-b7be-4959-b4f5-636890cd051b', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope)
VALUES ('51a6b69c-8ad8-458d-94dd-c8919a688046', 'eb4adf8e-d668-4a1c-beba-2d6ce867a1a1', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope)
VALUES ('51a6b69c-8ad8-458d-94dd-c8919a688046', '421c8df6-09e7-49b0-b3dd-8c8aece0c497', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope)
VALUES ('51a6b69c-8ad8-458d-94dd-c8919a688046', 'b0ab1a7f-8bfa-4c0b-bd55-6335b3826530', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope)
VALUES ('51a6b69c-8ad8-458d-94dd-c8919a688046', 'fed16ddf-f8c8-48dc-95ab-12200d026faf', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope)
VALUES ('51a6b69c-8ad8-458d-94dd-c8919a688046', '233807dd-cd6a-4dff-90ef-60594f541bc5', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope)
VALUES ('51a6b69c-8ad8-458d-94dd-c8919a688046', 'a31d7ccc-a026-4491-afd0-c9eee180b464', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope)
VALUES ('51a6b69c-8ad8-458d-94dd-c8919a688046', 'dad43592-70d2-4ebd-ae1a-1a2d7b21db12', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope)
VALUES ('d521b2b1-b33e-4a55-a524-ab3d9fb5ef93', 'b0ab1a7f-8bfa-4c0b-bd55-6335b3826530', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope)
VALUES ('d521b2b1-b33e-4a55-a524-ab3d9fb5ef93', 'eb4adf8e-d668-4a1c-beba-2d6ce867a1a1', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope)
VALUES ('d521b2b1-b33e-4a55-a524-ab3d9fb5ef93', '421c8df6-09e7-49b0-b3dd-8c8aece0c497', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope)
VALUES ('d521b2b1-b33e-4a55-a524-ab3d9fb5ef93', 'bcfd119a-b7be-4959-b4f5-636890cd051b', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope)
VALUES ('d521b2b1-b33e-4a55-a524-ab3d9fb5ef93', '233807dd-cd6a-4dff-90ef-60594f541bc5', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope)
VALUES ('d521b2b1-b33e-4a55-a524-ab3d9fb5ef93', 'dad43592-70d2-4ebd-ae1a-1a2d7b21db12', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope)
VALUES ('d521b2b1-b33e-4a55-a524-ab3d9fb5ef93', 'a31d7ccc-a026-4491-afd0-c9eee180b464', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope)
VALUES ('d521b2b1-b33e-4a55-a524-ab3d9fb5ef93', 'fed16ddf-f8c8-48dc-95ab-12200d026faf', false);


--
-- TOC entry 4181 (class 0 OID 17285)
-- Dependencies: 270
-- Data for Name: client_scope_role_mapping; Type: TABLE DATA; Schema: public; Owner: magnittest
--

INSERT INTO public.client_scope_role_mapping (scope_id, role_id)
VALUES ('a31d7ccc-a026-4491-afd0-c9eee180b464', '5a8c0f4f-35db-4c9e-b4d0-584919a41a97');


--
-- TOC entry 4123 (class 0 OID 16409)
-- Dependencies: 212
-- Data for Name: client_session; Type: TABLE DATA; Schema: public; Owner: magnittest
--


--
-- TOC entry 4168 (class 0 OID 17055)
-- Dependencies: 257
-- Data for Name: client_session_auth_status; Type: TABLE DATA; Schema: public; Owner: magnittest
--


--
-- TOC entry 4146 (class 0 OID 16761)
-- Dependencies: 235
-- Data for Name: client_session_note; Type: TABLE DATA; Schema: public; Owner: magnittest
--


--
-- TOC entry 4160 (class 0 OID 16939)
-- Dependencies: 249
-- Data for Name: client_session_prot_mapper; Type: TABLE DATA; Schema: public; Owner: magnittest
--


--
-- TOC entry 4124 (class 0 OID 16414)
-- Dependencies: 213
-- Data for Name: client_session_role; Type: TABLE DATA; Schema: public; Owner: magnittest
--


--
-- TOC entry 4169 (class 0 OID 17136)
-- Dependencies: 258
-- Data for Name: client_user_session_note; Type: TABLE DATA; Schema: public; Owner: magnittest
--


--
-- TOC entry 4199 (class 0 OID 17522)
-- Dependencies: 288
-- Data for Name: component; Type: TABLE DATA; Schema: public; Owner: magnittest
--

INSERT INTO public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type)
VALUES ('bb0a8554-1709-452e-ac7b-cad6d37e4be7', 'Trusted Hosts', 'master', 'trusted-hosts',
        'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'master', 'anonymous');
INSERT INTO public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type)
VALUES ('dabb0e0e-0788-45b4-b3b3-539fac140557', 'Consent Required', 'master', 'consent-required',
        'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'master', 'anonymous');
INSERT INTO public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type)
VALUES ('2c8f74ec-9b46-4a7b-aa9e-cd98fb0ab1e9', 'Full Scope Disabled', 'master', 'scope',
        'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'master', 'anonymous');
INSERT INTO public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type)
VALUES ('f84ff0d6-8d20-4b89-9715-ed58f51e788d', 'Max Clients Limit', 'master', 'max-clients',
        'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'master', 'anonymous');
INSERT INTO public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type)
VALUES ('2dae0a1b-40c7-48dd-8844-ca5457065d9f', 'Allowed Protocol Mapper Types', 'master', 'allowed-protocol-mappers',
        'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'master', 'anonymous');
INSERT INTO public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type)
VALUES ('faa6d964-04e5-4cff-a580-88a2257e5637', 'Allowed Client Scopes', 'master', 'allowed-client-templates',
        'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'master', 'anonymous');
INSERT INTO public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type)
VALUES ('716855f4-ed1a-4f2b-b69d-2457fb5b3c0d', 'Allowed Protocol Mapper Types', 'master', 'allowed-protocol-mappers',
        'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'master', 'authenticated');
INSERT INTO public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type)
VALUES ('44160aa8-da8e-4b28-bec0-4ab120300f97', 'Allowed Client Scopes', 'master', 'allowed-client-templates',
        'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'master', 'authenticated');
INSERT INTO public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type)
VALUES ('2ea5a81c-9652-4825-92be-e83d1dd653e3', 'rsa-generated', 'master', 'rsa-generated',
        'org.keycloak.keys.KeyProvider', 'master', NULL);
INSERT INTO public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type)
VALUES ('6ebb070e-c3a4-4a38-bbbc-f9572445797e', 'rsa-enc-generated', 'master', 'rsa-enc-generated',
        'org.keycloak.keys.KeyProvider', 'master', NULL);
INSERT INTO public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type)
VALUES ('b4e547af-54a2-420b-8c79-8de73c066375', 'hmac-generated', 'master', 'hmac-generated',
        'org.keycloak.keys.KeyProvider', 'master', NULL);
INSERT INTO public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type)
VALUES ('71c70b82-c6e4-4a2d-bdb1-5691d5ff01a4', 'aes-generated', 'master', 'aes-generated',
        'org.keycloak.keys.KeyProvider', 'master', NULL);
INSERT INTO public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type)
VALUES ('64f0aa89-04e4-4708-bf6d-d0eb2c9a765d', 'Consent Required', 'CoreRealm', 'consent-required',
        'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'CoreRealm', 'anonymous');
INSERT INTO public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type)
VALUES ('98d9c182-50e0-4c3f-ba41-f68a3aaf5d7e', 'Allowed Protocol Mapper Types', 'CoreRealm',
        'allowed-protocol-mappers', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy',
        'CoreRealm', 'authenticated');
INSERT INTO public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type)
VALUES ('52dfda3f-7943-4524-94a7-cd620b9b51c5', 'Max Clients Limit', 'CoreRealm', 'max-clients',
        'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'CoreRealm', 'anonymous');
INSERT INTO public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type)
VALUES ('7f821e3d-79a7-442a-ad25-1e1c7799cbb4', 'Full Scope Disabled', 'CoreRealm', 'scope',
        'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'CoreRealm', 'anonymous');
INSERT INTO public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type)
VALUES ('20fd35a6-ff5f-49a1-9c3c-8830743c5148', 'Allowed Client Scopes', 'CoreRealm', 'allowed-client-templates',
        'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'CoreRealm', 'authenticated');
INSERT INTO public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type)
VALUES ('13a80153-4e50-401b-8304-9b8a5d370c8e', 'Allowed Protocol Mapper Types', 'CoreRealm',
        'allowed-protocol-mappers', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy',
        'CoreRealm', 'anonymous');
INSERT INTO public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type)
VALUES ('fbdb0d97-8de9-4122-b9ee-4f37b1ec4bfa', 'Trusted Hosts', 'CoreRealm', 'trusted-hosts',
        'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'CoreRealm', 'anonymous');
INSERT INTO public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type)
VALUES ('c4214322-dfbe-4fa9-83b6-507c84c98bad', 'Allowed Client Scopes', 'CoreRealm', 'allowed-client-templates',
        'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'CoreRealm', 'anonymous');
INSERT INTO public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type)
VALUES ('37d66a85-7de5-48a7-94de-8e308a02dfe7', NULL, 'CoreRealm', 'declarative-user-profile',
        'org.keycloak.userprofile.UserProfileProvider', 'CoreRealm', NULL);
INSERT INTO public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type)
VALUES ('b4f90149-0b31-4cdf-a8e2-d9d2690b9466', 'rsa-enc-generated', 'CoreRealm', 'rsa-enc-generated',
        'org.keycloak.keys.KeyProvider', 'CoreRealm', NULL);
INSERT INTO public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type)
VALUES ('c1194b6b-d34d-4936-8a93-d8050e116062', 'rsa-generated', 'CoreRealm', 'rsa-generated',
        'org.keycloak.keys.KeyProvider', 'CoreRealm', NULL);
INSERT INTO public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type)
VALUES ('4bc45ab8-7f09-4d78-ac7d-bed8efe001ef', 'hmac-generated', 'CoreRealm', 'hmac-generated',
        'org.keycloak.keys.KeyProvider', 'CoreRealm', NULL);
INSERT INTO public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type)
VALUES ('08f4f634-4b98-4756-8658-5d9a3952889f', 'aes-generated', 'CoreRealm', 'aes-generated',
        'org.keycloak.keys.KeyProvider', 'CoreRealm', NULL);


--
-- TOC entry 4198 (class 0 OID 17517)
-- Dependencies: 287
-- Data for Name: component_config; Type: TABLE DATA; Schema: public; Owner: magnittest
--

INSERT INTO public.component_config (id, component_id, name, value)
VALUES ('1ddbf1f5-9795-4126-8941-1f48158360c6', 'bb0a8554-1709-452e-ac7b-cad6d37e4be7', 'client-uris-must-match',
        'true');
INSERT INTO public.component_config (id, component_id, name, value)
VALUES ('02792689-23b5-4b16-a7a8-4a34a1f4bca6', 'bb0a8554-1709-452e-ac7b-cad6d37e4be7',
        'host-sending-registration-request-must-match', 'true');
INSERT INTO public.component_config (id, component_id, name, value)
VALUES ('ffde4846-0b5e-4964-b7bf-8c15a3168cd8', 'faa6d964-04e5-4cff-a580-88a2257e5637', 'allow-default-scopes', 'true');
INSERT INTO public.component_config (id, component_id, name, value)
VALUES ('53b4ff57-325a-406a-9e6e-c362a2a2a4c2', '2dae0a1b-40c7-48dd-8844-ca5457065d9f', 'allowed-protocol-mapper-types',
        'oidc-usermodel-property-mapper');
INSERT INTO public.component_config (id, component_id, name, value)
VALUES ('d4191843-3d4c-4fbd-a534-b6f9d049b880', '2dae0a1b-40c7-48dd-8844-ca5457065d9f', 'allowed-protocol-mapper-types',
        'oidc-address-mapper');
INSERT INTO public.component_config (id, component_id, name, value)
VALUES ('edecfe4a-b618-4f02-b9a4-72cb1cb0ae2f', '2dae0a1b-40c7-48dd-8844-ca5457065d9f', 'allowed-protocol-mapper-types',
        'oidc-full-name-mapper');
INSERT INTO public.component_config (id, component_id, name, value)
VALUES ('61227446-9d16-4066-b9e1-3ccba0b8df96', '2dae0a1b-40c7-48dd-8844-ca5457065d9f', 'allowed-protocol-mapper-types',
        'saml-user-attribute-mapper');
INSERT INTO public.component_config (id, component_id, name, value)
VALUES ('33ea3a6e-11ba-4459-8441-44af32eeea28', '2dae0a1b-40c7-48dd-8844-ca5457065d9f', 'allowed-protocol-mapper-types',
        'oidc-sha256-pairwise-sub-mapper');
INSERT INTO public.component_config (id, component_id, name, value)
VALUES ('67b63215-e5e6-4d8b-9d76-5a9704e7acc8', '2dae0a1b-40c7-48dd-8844-ca5457065d9f', 'allowed-protocol-mapper-types',
        'saml-user-property-mapper');
INSERT INTO public.component_config (id, component_id, name, value)
VALUES ('083a85d1-4a5d-46b5-beb8-8130e1621834', '2dae0a1b-40c7-48dd-8844-ca5457065d9f', 'allowed-protocol-mapper-types',
        'saml-role-list-mapper');
INSERT INTO public.component_config (id, component_id, name, value)
VALUES ('3829cd7b-6c5c-48ba-9c78-129436e2c1bf', '2dae0a1b-40c7-48dd-8844-ca5457065d9f', 'allowed-protocol-mapper-types',
        'oidc-usermodel-attribute-mapper');
INSERT INTO public.component_config (id, component_id, name, value)
VALUES ('c765b3e3-a29c-4143-b9b3-a11453412d22', '716855f4-ed1a-4f2b-b69d-2457fb5b3c0d', 'allowed-protocol-mapper-types',
        'oidc-address-mapper');
INSERT INTO public.component_config (id, component_id, name, value)
VALUES ('558b9fe7-e5ae-4f7b-8e86-c338df5c4ea6', '716855f4-ed1a-4f2b-b69d-2457fb5b3c0d', 'allowed-protocol-mapper-types',
        'saml-user-attribute-mapper');
INSERT INTO public.component_config (id, component_id, name, value)
VALUES ('34a5ba0d-3e43-4bf3-bb73-b87d69579c8c', '716855f4-ed1a-4f2b-b69d-2457fb5b3c0d', 'allowed-protocol-mapper-types',
        'oidc-usermodel-attribute-mapper');
INSERT INTO public.component_config (id, component_id, name, value)
VALUES ('0df994a7-c832-475d-8eb8-6d7715e12a7a', '716855f4-ed1a-4f2b-b69d-2457fb5b3c0d', 'allowed-protocol-mapper-types',
        'saml-user-property-mapper');
INSERT INTO public.component_config (id, component_id, name, value)
VALUES ('c580d698-dcc0-4c85-8403-e9b4ac3be928', '716855f4-ed1a-4f2b-b69d-2457fb5b3c0d', 'allowed-protocol-mapper-types',
        'saml-role-list-mapper');
INSERT INTO public.component_config (id, component_id, name, value)
VALUES ('aae5e4c1-21ab-4e49-8da5-4c51d04b75e6', '716855f4-ed1a-4f2b-b69d-2457fb5b3c0d', 'allowed-protocol-mapper-types',
        'oidc-sha256-pairwise-sub-mapper');
INSERT INTO public.component_config (id, component_id, name, value)
VALUES ('8e8954d7-3056-4dc6-a190-0c4aa53c7910', '716855f4-ed1a-4f2b-b69d-2457fb5b3c0d', 'allowed-protocol-mapper-types',
        'oidc-full-name-mapper');
INSERT INTO public.component_config (id, component_id, name, value)
VALUES ('753a43bb-e0e3-47b4-a177-58799d4a97a0', '716855f4-ed1a-4f2b-b69d-2457fb5b3c0d', 'allowed-protocol-mapper-types',
        'oidc-usermodel-property-mapper');
INSERT INTO public.component_config (id, component_id, name, value)
VALUES ('a5b85e35-98e7-4af3-b41e-75803a70a34d', 'f84ff0d6-8d20-4b89-9715-ed58f51e788d', 'max-clients', '200');
INSERT INTO public.component_config (id, component_id, name, value)
VALUES ('67d1e9a5-f99a-4cfc-9315-1a931d0ecac9', '44160aa8-da8e-4b28-bec0-4ab120300f97', 'allow-default-scopes', 'true');
INSERT INTO public.component_config (id, component_id, name, value)
VALUES ('aa81f086-28ad-467f-9603-942023c64f86', 'b4e547af-54a2-420b-8c79-8de73c066375', 'kid',
        'eda92ac9-2cf3-463d-90c9-82fa71621d1f');
INSERT INTO public.component_config (id, component_id, name, value)
VALUES ('4185b087-6ddd-4a78-836c-beb3142a255b', 'b4e547af-54a2-420b-8c79-8de73c066375', 'priority', '100');
INSERT INTO public.component_config (id, component_id, name, value)
VALUES ('cc4967cd-ad85-4c16-93aa-459d10255313', 'b4e547af-54a2-420b-8c79-8de73c066375', 'secret',
        '9wGn_kxYiYlp2hqJc28mUQGfvVr4CFF-vh-zT6hsTETSSFfLoxYrFQJ531AZG5sClQPeCNtT6_MZCwcVDeU9mA');
INSERT INTO public.component_config (id, component_id, name, value)
VALUES ('301e20c9-4e0c-4778-82d6-f0d88a369a32', 'b4e547af-54a2-420b-8c79-8de73c066375', 'algorithm', 'HS256');
INSERT INTO public.component_config (id, component_id, name, value)
VALUES ('a930df61-e609-43e4-ab72-f4621e3870e7', '2ea5a81c-9652-4825-92be-e83d1dd653e3', 'priority', '100');
INSERT INTO public.component_config (id, component_id, name, value)
VALUES ('1c885eff-b389-483f-ac04-4643d0849e75', '2ea5a81c-9652-4825-92be-e83d1dd653e3', 'keyUse', 'SIG');
INSERT INTO public.component_config (id, component_id, name, value)
VALUES ('412e9a6f-6940-4029-bbd2-0bfdfc0c6559', '2ea5a81c-9652-4825-92be-e83d1dd653e3', 'certificate',
        'MIICmzCCAYMCBgGEdxx6oTANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjIxMTE0MTcwNjA1WhcNMzIxMTE0MTcwNzQ1WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCCCozlQ5tjHvtjohu+mKe99P5Kzn2uQhO5+Fg6v1hEfzCaigfnhEJu3XZaJ+EJg4on7PZhhRkf6IJD5MgkrnG3j/8YrSpWm3NcapyxHCPiQ1O5NEvy0PP1seVxzsdSuVjJAJEzmda4lGejdL9/F5JY10/jxu5KLtXFB/CgmWgtlKLWavaZalkMJB5AYSuMCGFpT9oUAHbbOXHHHjGGMmnqTYZDzHtTk7u49Nj5N7ICAKIyufDo9DZOqEzyKji2DS2D96/8ms3iJWXnqv4Onprj+iZeridsCF1UL6iyuJu/YkfQtO4wrPT3/B3f6mkCVZ3xH2sg+Ac9ERUfdiDMUqbTAgMBAAEwDQYJKoZIhvcNAQELBQADggEBABsXRVSe9PMBk1WpGXOiQayw3rP43AECvBeXT8fhNpVI5t7cbspMJxTsO0Qq5wXjQL/9+sdPJQ1/rHrs6LVML4xG2uDuFC2rOZHMS3qsMFBJYfiHdEkToZB7TRxdb6RSw/K3/9XcLAZXF0iS3tWgG7cQD5ha98ZyTty1DFtkjFUloZWX+tRIVb1WExBRYV6eRcIDmN8F9TAJB+gB4C2a26D/2uj9uKzofErWleRZzw9zoMnWdGed3ztHfpB6SA9npOLyqKbutCw5Yc/39peockmhT14Cu62JUL4CtgoifiMaN0PLBlLzbuyGJmYIFiEmSWXJnsFjFf2dl8YSZHs0aoc=');
INSERT INTO public.component_config (id, component_id, name, value)
VALUES ('ceb33d2b-0dbd-4683-8f35-3ada7f5fa55c', '2ea5a81c-9652-4825-92be-e83d1dd653e3', 'privateKey',
        'MIIEpAIBAAKCAQEAggqM5UObYx77Y6IbvpinvfT+Ss59rkITufhYOr9YRH8wmooH54RCbt12WifhCYOKJ+z2YYUZH+iCQ+TIJK5xt4//GK0qVptzXGqcsRwj4kNTuTRL8tDz9bHlcc7HUrlYyQCRM5nWuJRno3S/fxeSWNdP48buSi7VxQfwoJloLZSi1mr2mWpZDCQeQGErjAhhaU/aFAB22zlxxx4xhjJp6k2GQ8x7U5O7uPTY+TeyAgCiMrnw6PQ2TqhM8io4tg0tg/ev/JrN4iVl56r+Dp6a4/omXq4nbAhdVC+osribv2JH0LTuMKz09/wd3+ppAlWd8R9rIPgHPREVH3YgzFKm0wIDAQABAoIBAC/oUx/jWEucDmEWR8Jf2uxQZZ6JlCOulDXfGCIMfCg/81f7og3Y2+CcFg4AwxcOLsemtN4YerkWn2cD0fgxjBNkKUaeBQsDGeziGfflthKVWzLP4WsDL91EPJNA6o2/WsYyP0wTUNePVN8TE7lupau1JulzUDZkKrz7v9pqqcaggElqPgUT5Dv8yQn4nESvMj2kwwBvR3YITwXEVVKNULXZESOaquR46gMt+hK5sUW9seEUxvQaTcS5mVAvbAQwNB9BVeXRlhOKYDTUrIRhy2VGqY9G8dG6Fb8FIqOLZqbFTwiTiN/OwdiYj9YYJqeOr6mft6vj3f8W+30VhuGvT4ECgYEA7r+y/uTyYRjqbn9pp3YPAtotsp9FsjCMQnVKYZuZY8VYQ2e62Fd/l6eN21PtzorHAjvb2nWxFfsCWNAIlF2a7Ci/3VSp+UuDZ06Rbj3Koda738+G7C9ByVohHHXHSsNYusdlsbIBQLoVACT5ehe48vsITiwTBcxzLzljfPs7bdcCgYEAi3ADCw1YJT9jBw0fJcowboojrJM9/h8O2VP/S1kC2amwerWaY7b9w2jbOrY2rQO0ihe1dNm3fElkJpW9QAt3QbOMFWv5shhoyH0OWcV6vW4XRMy6+93Q2O1jL1kgCAM0lIX5YO8RIvHKL7otiEgzlCPm60vNUdJzixfwVCzOF2UCgYEAvFv/ozwLwfE/W4goWhc5hp2NeiRQf2Hv9qrE0TdKkD1tAlj/P5ngr0xhDc4si0xP8AI71SIPYXEUi+8tJaioBnOr07ntFCKwfDuvX1Ne38ojlVMMdqBd/bae8u41GlX+VfXk1InElUV6Ng/1x46ZuxG0nsAFDgkcQwC67irj2ycCgYBcvzzG9TFUVT1BS3EUadCdNjVUbPwnM/FkjYKaU7KZpU1F0dXHzcgtWmm4O8tSecx0riB8gPSTLx32rFMdboL8qLjc5t1HoQTRlp0dCUYDCl9f2+3j6j8oi34V2Gp96ePnhtXBrELxw3KBHI18wMnOF7NZfyoq6pkARAQPeV38IQKBgQCxHDJnomB+bySjgBMepxtHFR261x4PNFBzAkg4oF0ZFwmvigjF/6HCx6StMFdzF2Jeb33+B3puhMzEhViSB6e3jnL7ogpVZM+AdrSrOJypS16QfTniFSelo7Sf/pPRN4MzfKonOs3VK2LQxXqmIwp/NpC779Zda1wM8VaNy75RzA==');
INSERT INTO public.component_config (id, component_id, name, value)
VALUES ('984d7e31-fef6-4926-ab73-47e75a344b65', '6ebb070e-c3a4-4a38-bbbc-f9572445797e', 'certificate',
        'MIICmzCCAYMCBgGEdxx7ljANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjIxMTE0MTcwNjA2WhcNMzIxMTE0MTcwNzQ2WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCEEfu6DQgZCJTzLk+1Xx/zlr5cDPsmuFwWSxO2Djzlu1SYoSg04lU/3OgWUci8Nvl4WQsnnmet1c4d3KDgOLzzWGC+qN2T7fyxpAPqrwCQPANYSo1++0OKb0CBaGbjy06qsA97G+gBI3aKxOvay0jJBKmzW8RURBDLgpTUfj4tZ8N/J9Wz6GNdFCOTDrZCOULqAN9YrGuRYW+pqCj6jF/rTCdkz7LYX/gJ3XCv4V/aJEaqJ0IUmFTVnqchC87ue4ibo8iclrdqkC74iAZ3VC9bYhRlMC0UMrPKA1dNniJ3AOKGgXB/rwP2z0EnSLlaKwTR1VpF6+IStSspe0O+RT6tAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAAlUv5XcuCEpKMWklCaoHI5v4zOfITbMum3NXhSQZ+Yt+akxYWQo4DZwCk3P9oTFUvz2kwFQgH5IMtX9z322Jy315jsdelgWkYZCb1LiNtuUqh2D1lOAv0iDGM6a7vdtGNgFlZv8FEAtAYrKd6CzZXRbq4kMJjTgP+pI4D1DmrjhVBriT/6/b2m+fx9PJA2ZgtXgQJM8XQqgjf6CTNdl8fYtqTMvvotuSFCt8gjuGxxr9oLDzV+rrYW6fZHunQq4NNU0ScVO3m9GvtLkb7QbEakAOFfuj/O76pd58K33zW7TNylSVgBmXc33u8kwKcCbvGPF3iOsWj8YRKUWfLcGbmo=');
INSERT INTO public.component_config (id, component_id, name, value)
VALUES ('bf462a40-9c57-4480-abb8-7357901fabfc', '6ebb070e-c3a4-4a38-bbbc-f9572445797e', 'privateKey',
        'MIIEowIBAAKCAQEAhBH7ug0IGQiU8y5PtV8f85a+XAz7JrhcFksTtg485btUmKEoNOJVP9zoFlHIvDb5eFkLJ55nrdXOHdyg4Di881hgvqjdk+38saQD6q8AkDwDWEqNfvtDim9AgWhm48tOqrAPexvoASN2isTr2stIyQSps1vEVEQQy4KU1H4+LWfDfyfVs+hjXRQjkw62QjlC6gDfWKxrkWFvqago+oxf60wnZM+y2F/4Cd1wr+Ff2iRGqidCFJhU1Z6nIQvO7nuIm6PInJa3apAu+IgGd1QvW2IUZTAtFDKzygNXTZ4idwDihoFwf68D9s9BJ0i5WisE0dVaReviErUrKXtDvkU+rQIDAQABAoIBAHeWCQdocWKpgKXJ02b5YWchofCb2HYxDUEqbgi1T7L9MxaZJlzsbCDNmGFNYKP8a1vr1MvlBSBErsQfWJRvC7iU19UL9sbSAbOgPeOs3qe7j5PMvd6zCW86WYBT1oaBOxQXI41nsWYGhHoW4TFWTOuoCzla6KUclNCRxs26Gfbl5epNlvqtPS/QTaKLygaQxxt579Xh1Nlyir81m+vxvyEDgnxFmFYD56rNZ++WJWyt35jgbK6YktBqIA1ipa15g0rSckN+V4ZHHzekFdty2duiTw2cBDlozZr5IhXFdP/eOhzttwGrwiGXwolRJxK/CY8whauoz0/Dsw4FrUfp4YkCgYEAx2o7Q2LLtR3+TnjRDljqjwEeTnbxWer087a4hfvy8iVC36kz/5412HZSnSXk6FxvpU3tKQjt6cc4gqAEa2b1KCjNqk+1PbdkRHADempNcRtSZJzYupJuTh419QuY+7H/vqkQhJibKR0825cQRKE/LswfIZtvsKhducl7TCckD2MCgYEAqYu95b1HnSrLZsXwiWssAtzuSSHqX3OSv5E7SlO09u//9tRYHV62JdQb+KBVDeGezOb9fzsLhQxKKzOQZ5whx7cRP+pCuaxpvwlWC2j9F2sE5hQiMAolEalkU0ae7JOwvrKAIgLdadFgMuDMXzRlOKxgq+ZuGXHIe5d5ddqEfq8CgYA5Fe8bLkgUdB6dxjZKfie/gllzqtcSn5E5x1/xcxusOAB52I07KsZNTin+NJ/f6L5JOxKeQaEh4FcMBdTeDh42PeAKVkETBtHcSZilTZMXwvOGO+RLHKoZEMrveD92JhGJOgqxeqJIVcdbMVaF3wcgVWzACSgjET+rdMMoHLhU8wKBgD1tI5/Ys9l9Z7QUgtFGwutGoA5e+0sZ1FETjSegrC/LRDFpPYNmjRengXrSm/4rgB08kxtFiSbrDPQZ+nePWa3B5b4CYapjjOxptYLsxsV1QJEbOketZUDA3lhNfca4u5Bbm5C2+QEdmnzUdTcJBKND0MJ2+ey+DKS6fIb2ZIqBAoGBAL05lHvcrXghx4irDR31LD7P0AkAOw8ve5EdSytu2ZafWiR354ejY54a+06EfBKmbnwGVfxKgsJIuornikX6fCtpt+0XlgwhpLD0URGlRAEQzXTbhhAr+50BWnCZy1lJs7HNbNXmMr46AIj67KXFGKAwwepZ61ZG48pF5iCrUp2h');
INSERT INTO public.component_config (id, component_id, name, value)
VALUES ('d65c1009-34a5-431c-9abb-d3a604a8d33d', '6ebb070e-c3a4-4a38-bbbc-f9572445797e', 'keyUse', 'ENC');
INSERT INTO public.component_config (id, component_id, name, value)
VALUES ('c336c52a-f4c9-40cd-b464-944b52ca9917', '6ebb070e-c3a4-4a38-bbbc-f9572445797e', 'priority', '100');
INSERT INTO public.component_config (id, component_id, name, value)
VALUES ('33303917-d246-45f7-8a99-01682b897428', '6ebb070e-c3a4-4a38-bbbc-f9572445797e', 'algorithm', 'RSA-OAEP');
INSERT INTO public.component_config (id, component_id, name, value)
VALUES ('66202c3c-70be-40ae-9c8f-3ecea48be08e', '71c70b82-c6e4-4a2d-bdb1-5691d5ff01a4', 'secret',
        'zw3JFRVOSZZzYvtSAAadUg');
INSERT INTO public.component_config (id, component_id, name, value)
VALUES ('95bc7721-e633-4479-9ea1-fba62c5c0d64', '71c70b82-c6e4-4a2d-bdb1-5691d5ff01a4', 'kid',
        '031c1c46-21a6-4d99-b342-58d70f5db8aa');
INSERT INTO public.component_config (id, component_id, name, value)
VALUES ('2cd0974a-45a3-4ab8-b0cd-501328ac1122', '71c70b82-c6e4-4a2d-bdb1-5691d5ff01a4', 'priority', '100');
INSERT INTO public.component_config (id, component_id, name, value)
VALUES ('cec819e7-6b73-43cf-8fdd-b55c56883e16', '98d9c182-50e0-4c3f-ba41-f68a3aaf5d7e', 'allowed-protocol-mapper-types',
        'saml-role-list-mapper');
INSERT INTO public.component_config (id, component_id, name, value)
VALUES ('9d003933-ee4f-49d6-bd99-0573b77255a7', '98d9c182-50e0-4c3f-ba41-f68a3aaf5d7e', 'allowed-protocol-mapper-types',
        'oidc-full-name-mapper');
INSERT INTO public.component_config (id, component_id, name, value)
VALUES ('65005f9b-6d33-4a5a-9c9f-9b88dac1d00d', '98d9c182-50e0-4c3f-ba41-f68a3aaf5d7e', 'allowed-protocol-mapper-types',
        'saml-user-property-mapper');
INSERT INTO public.component_config (id, component_id, name, value)
VALUES ('2e8347f3-2c28-49b8-ab6d-376ce03c47c1', '98d9c182-50e0-4c3f-ba41-f68a3aaf5d7e', 'allowed-protocol-mapper-types',
        'oidc-address-mapper');
INSERT INTO public.component_config (id, component_id, name, value)
VALUES ('5378606b-ce54-4f1f-b1f9-7fdc78e82a45', '98d9c182-50e0-4c3f-ba41-f68a3aaf5d7e', 'allowed-protocol-mapper-types',
        'saml-user-attribute-mapper');
INSERT INTO public.component_config (id, component_id, name, value)
VALUES ('52f2211b-1bd7-41df-9e09-c9f2246f72a5', '98d9c182-50e0-4c3f-ba41-f68a3aaf5d7e', 'allowed-protocol-mapper-types',
        'oidc-sha256-pairwise-sub-mapper');
INSERT INTO public.component_config (id, component_id, name, value)
VALUES ('4c0fa6f9-4014-4602-a18b-4ee56e295816', '98d9c182-50e0-4c3f-ba41-f68a3aaf5d7e', 'allowed-protocol-mapper-types',
        'oidc-usermodel-property-mapper');
INSERT INTO public.component_config (id, component_id, name, value)
VALUES ('7e2c8704-58ad-45f8-84d3-5413f58a158b', '98d9c182-50e0-4c3f-ba41-f68a3aaf5d7e', 'allowed-protocol-mapper-types',
        'oidc-usermodel-attribute-mapper');
INSERT INTO public.component_config (id, component_id, name, value)
VALUES ('e6875812-da12-4bf5-b7fc-5647e3c43905', 'b4f90149-0b31-4cdf-a8e2-d9d2690b9466', 'priority', '100');
INSERT INTO public.component_config (id, component_id, name, value)
VALUES ('213de760-73b2-4f2d-859d-b1fe6950f89d', 'b4f90149-0b31-4cdf-a8e2-d9d2690b9466', 'algorithm', 'RSA-OAEP');
INSERT INTO public.component_config (id, component_id, name, value)
VALUES ('fa963e17-1c84-46e4-b840-6d3b7b92f374', 'b4f90149-0b31-4cdf-a8e2-d9d2690b9466', 'certificate',
        'MIICoTCCAYkCBgGEd5CL6jANBgkqhkiG9w0BAQsFADAUMRIwEAYDVQQDDAlDb3JlUmVhbG0wHhcNMjIxMTE0MTkxMjUyWhcNMzIxMTE0MTkxNDMyWjAUMRIwEAYDVQQDDAlDb3JlUmVhbG0wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCCdeSY+Z7EyV+dD7ZiwNXvPu6bFLexjZ6k8Gzk6LBUqTLWTdK/gfT8kCFk/6vt6nuMkhWvMn0/YF8xPeyzVIbwNLOjWJQB1hRw/vxRTMWYpPf1TJCVUgDjr4xT0ng7HEq1G3++5gledAEa38/D+PR7S73XLveA8OWxhhZC2wC/NEL45twj4TyP0ebGbGz2caiX4rEQ9TyZREtxD4+DulCTqbPGZodR/ykYSEMu9VQUHIRcgOpzWgCkNhRrN0pNK6afsP8Svs3GzUw/ztQlhaJJUqJaueq79QcT9Q+DgRqRSp7iLmtxc+E2xgK6eYIYCpGMPdU+9zg2beXS7vJZ2CRfAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAFpHylprQw+eD6+6X9nS/nQGVGEEwq1qaUQHkZVoF/ojkAZtZQaXz/g6eLkJmWExk7edCrxNFjIypjZTA0Gks9wuwAPefn9m1YPaw0FyJDqGNmXzuqUoW/U4gAo2XKPMBVDG/8sT6JQ+vOoR8QSuSBR2GRYb6gwEuZhHT5p31a54ux809gcBCFeZUiwXfiLlanvNUek2hh96fkVIRVuYxGDLI38Pl7bkahcZQ6Auvkb1UMIsdeZirAjtsLUuROcOH5TJ9fYGIIaK4UpHoShZ3z/oARmCYsPI2JOe5X/cAAWwchNyt1loVSYw4ynHKbgIPXWFRyBXHwv9APjSDACr2kY=');
INSERT INTO public.component_config (id, component_id, name, value)
VALUES ('33869d51-ee27-49fa-b305-bb719894581e', 'b4f90149-0b31-4cdf-a8e2-d9d2690b9466', 'privateKey',
        'MIIEogIBAAKCAQEAgnXkmPmexMlfnQ+2YsDV7z7umxS3sY2epPBs5OiwVKky1k3Sv4H0/JAhZP+r7ep7jJIVrzJ9P2BfMT3ss1SG8DSzo1iUAdYUcP78UUzFmKT39UyQlVIA46+MU9J4OxxKtRt/vuYJXnQBGt/Pw/j0e0u91y73gPDlsYYWQtsAvzRC+ObcI+E8j9Hmxmxs9nGol+KxEPU8mURLcQ+Pg7pQk6mzxmaHUf8pGEhDLvVUFByEXIDqc1oApDYUazdKTSumn7D/Er7Nxs1MP87UJYWiSVKiWrnqu/UHE/UPg4EakUqe4i5rcXPhNsYCunmCGAqRjD3VPvc4Nm3l0u7yWdgkXwIDAQABAoIBAF+YL3eAgbxEqpEV8FkQYDK89G4iki/CTBskKUba0kpW6O9rex/lBDUFD9NIHR1qkjmA2e7Umj4USex1KbqGF5Jvq6nnwBxQWA4saYrRLIEbcK4H+nHP8uLjwXmyYXM+2ec3TTX+raLOcfjVQxKgm9S0vViuC6Ip4sVgMXOvsi5n7LFmHLNlzJJN4HzS5w7a33qXU7VudiMLD3JoYWwJhcnD1Te3niJSkcEtnsEx3JdT4LNfmWvZqLuEk6+Us4Ggfqbh+4u6l6fhBOsmfsPdT+uG44fkmou4ab+X5bffU9QStV94wlz924cUqJKSGOZKsc1MwHhxnybS+XvJFtIc8lECgYEA/e4GT+CDMEQgnSj4sXP84w/OUmN7uwG3vDC3GyLdFfqzGOXcPgp/wVwAB3MqMhapvTeGStL6jAX5MYaj7WWm1BlnUoSHRaXmDGpxbUJHPsENpb6OB2eyChm82zpoSB1VLy95nM4WiRSD+AmvWQvQri2xMsHH8xva9nVdXu0mOO0CgYEAg4YtJD/bY1k7CJXKHWWNa3wqg0PLTkIWqLQvyp6JnAdWCIkxxd+H6bQ0MIYQxBiXOvpfeBW4qNgJ/b/CKY40gXSpFYL6ifstp85lKgSEyih6z/x/+aHBzV9ep396JPe5jVOBrJXzcCOfJyam78gA6T53ETHOLN4A88k9KdAxJPsCgYAYCbxXO22v2AMuXX6Nbel2pTxm2DwSS+tUyVfMHdTIC9+Ab+IVjXDioQ7vpZtM+pA+9U6lLqvBLZ+VbKWAB6tvUKhTS3Byy22npzvtl+SesC/WjN9tHAfipOUX68OLcBtsSBY/HdNMTsDfbitHRrMOigzIPUfsX6quwhWAsvp3UQKBgDiA3UXUdTDyNa1ThJgqd530ouLvrhj5xXhGqL14bI/uiuRx5EMo69/X/g/WmL9V/SpmQ7t4QXOwFGLCDe0CXcY70yQdt/qtQQj1X3q0pEOhLlnKFUSuXG8ZiLWWy2e0US/I702wwfusIgSU02Tx3IpXvplRd0zJN0mEa9VZzrMfAoGAOoHLOMdZqusN4Mui+jDdIGwCA6wxML2F1ABzFpb6KHekoIQeIUveoL/f98t6yGRvBxK7AF77KFwXvEDnmFJaQXko3kfFcFYtyUgyCULTe+cmSjS8Wd3I4WXSfRm0sNLtC868Gv3UsPsxinaEEluDxMYpSYZw5jX3IZELAAREUU4=');
INSERT INTO public.component_config (id, component_id, name, value)
VALUES ('62f7b18e-edad-43d7-b755-55fad80fca52', '52dfda3f-7943-4524-94a7-cd620b9b51c5', 'max-clients', '200');
INSERT INTO public.component_config (id, component_id, name, value)
VALUES ('6b5a014e-b908-44d6-83fe-39f937cae3d3', '20fd35a6-ff5f-49a1-9c3c-8830743c5148', 'allow-default-scopes', 'true');
INSERT INTO public.component_config (id, component_id, name, value)
VALUES ('0c8fd251-fdeb-48b5-afdf-e3434a0d647f', 'c1194b6b-d34d-4936-8a93-d8050e116062', 'certificate',
        'MIICoTCCAYkCBgGEd5CNBDANBgkqhkiG9w0BAQsFADAUMRIwEAYDVQQDDAlDb3JlUmVhbG0wHhcNMjIxMTE0MTkxMjUyWhcNMzIxMTE0MTkxNDMyWjAUMRIwEAYDVQQDDAlDb3JlUmVhbG0wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCtxdhj8qgvimprgMKZKCESwcjA0RV9DHHJXiOjuE/IRiE17kHVNQVnGjGVe8JCuC/0H+XwGNREp7kGPZgVW4eZ7KYHCxO5U7cNRNMjU2yNgXaQskU5EP8EAVTT+6gYcdOlI1lxx45nYigRovUz7vjDceyysP7LLS7uHWBeTuw3FEK4VG6XvMZ/dnuhsXYy2RkcSMsogBYx/HT8+M3fTcwR5VkAPw9SCh3UTOy+HsNY6ASg6AQEIJXHohXGkvo+p40jQuYsqo7YnJHT5pcp3dtugxSxxIdHMV/rA0kDMO3RoMCmQ6EhEzALpIFe5WPgS6qhHwjQx+zcVUKUWHpX3o5HAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAKXqObEXU7TF0cBBUhnmHTmi8AbWBZhHhg5F/gDKqWuXil+x58yhcVupQNhJIajUnwqEyKTCV3aP1bKZTpiC4bJoi7VhKxQm5V6DW9aREMkcapLVXIk29y//lPA96fob5MC2Fbv5td03mIMFBONowqWOOE/HAS7UE+GQOPf+EGQc9yRz1DNTldmNrFrPhHBSVKx784ogjBvBQTzjB63SW7ggKpLbyw2hBb4vwBa0c9XvpPxBlK0U7pjHeu8RuKONI9gOMPoIdq+7pirdGIrKjjDqbUYcJlPKWwyWmpNMdjQ+MThBdtK23efMjevXsw0vUDboRLxZxawD0Z3fF8G4T3Q=');
INSERT INTO public.component_config (id, component_id, name, value)
VALUES ('dc5055f8-19b1-4b79-82ae-cdb6d5c8ee18', 'c1194b6b-d34d-4936-8a93-d8050e116062', 'privateKey',
        'MIIEpAIBAAKCAQEArcXYY/KoL4pqa4DCmSghEsHIwNEVfQxxyV4jo7hPyEYhNe5B1TUFZxoxlXvCQrgv9B/l8BjURKe5Bj2YFVuHmeymBwsTuVO3DUTTI1NsjYF2kLJFORD/BAFU0/uoGHHTpSNZcceOZ2IoEaL1M+74w3HssrD+yy0u7h1gXk7sNxRCuFRul7zGf3Z7obF2MtkZHEjLKIAWMfx0/PjN303MEeVZAD8PUgod1Ezsvh7DWOgEoOgEBCCVx6IVxpL6PqeNI0LmLKqO2JyR0+aXKd3bboMUscSHRzFf6wNJAzDt0aDApkOhIRMwC6SBXuVj4EuqoR8I0Mfs3FVClFh6V96ORwIDAQABAoIBAQCLk35byWyNwv/3mVS08CagikZVmZtI9dXviE3YExMCKlJCnz0Bo7TTO5bYGq/OJ2NdEsH+N/NHsfBLsu2VOg+Q8yPoRF1zXmqJnd55YWivwG0bjBVN4Pj0np0kJ968w7Db06jkWwVmxNCqWdnZ/PiTA867OK9vQruPRslA9uOE2M3zuedQXphlPSCqP/9mj97FQ5i1QfoPbmG0oIFa3LZwu1/fGvJIFltEaCaPPYzy3wXNK5U8i+arYNWOlSkRwE0uNXzswVK3Gd+Kg9GJ7F8wJX8B3MzmVT3MsioW3+1kXAwWe5N/01SaQDKb8mfP79fLx5gsxxyNlSyCi1dLMGEBAoGBAN5FuDeuZJoYgLWZWNemGITPLCKqoBiwkNLuW9UTgYIg0qtf8uN4uQnjIB64eIm3DxWKP2mP7ZAZ1PrISSYvYZFkH0Fhkjx7tCk45YflFmiiUver0pvbyiyvY+caW+9/uapB/u9kZN5tsGrn4X3cG6g3/fisgwhJM6EUmdLGOtd7AoGBAMgkI1HIyluxZhrPsjYYRZxyS1re2p/kMzbRcUpdeHq98SN1rpidXBxfBz8L2rBK85TEj4lLu1UWz29r81eu5ahq7yUED8PZWFjdwAdD2wM7l1+YGHE9e+C+RLLx9w3chFepy2pUEamiNbK6r9f/tw17LzSdMRVW+YJCUDEvj0SlAoGATRK15zDkl35pmw7afKSOmfbQohCyRP1sqoeWdlM2NC43fs9dhL0GxMPqDlz/Bxnf9CMlC/Cpeq9KZ89tdf02AtlJ8TzpHWnztduR08Z/N7cZt+HvvLXA7C/BH5DHUkvi0IPj55TTWUGFy/wt95uMR49q1IDVStk/OtrO4AR2wOMCgYAw1Ag96sPb7QLhJazv36oUChpyWA50leMcy6pdH0LGh1KueQaYu0N+tHx7GDRJcG/O6smuEGjq0H7ZSzf6O3RSS4x+tmf2Oy9/ttIjs51aQ46hxuSns/1mDmWKVtgUbKlpDcbP8STCAw4gxcUi6INLabNRncwczbRf4DfaWCUW9QKBgQDNs3dFZHA3Eb2GElfA0Q9R1Hg8I6ary0peHL9KaF0j6Qm+IdZE4rcJOSO1k5QI2K9ZNk76TiqziFS3dsddRoMPbPe+Eva5ogonrwPlxQ1umkYDA1AJvNnyJ0KfQtNy55xe8pPf/BpWCWMpXUKek9OBOe/gfqxmMBntL4MG7WR1Sg==');
INSERT INTO public.component_config (id, component_id, name, value)
VALUES ('9d6607c6-deb3-436c-baa2-e8c1b0206842', 'c1194b6b-d34d-4936-8a93-d8050e116062', 'priority', '100');
INSERT INTO public.component_config (id, component_id, name, value)
VALUES ('3f66ac9f-2b02-4c8f-9f82-d8c65af4e951', '13a80153-4e50-401b-8304-9b8a5d370c8e', 'allowed-protocol-mapper-types',
        'oidc-usermodel-property-mapper');
INSERT INTO public.component_config (id, component_id, name, value)
VALUES ('05fb9156-ffe5-424f-9b1e-3d8c1854c365', '13a80153-4e50-401b-8304-9b8a5d370c8e', 'allowed-protocol-mapper-types',
        'oidc-address-mapper');
INSERT INTO public.component_config (id, component_id, name, value)
VALUES ('291de1e0-5885-4266-9559-7de6de3846d7', '13a80153-4e50-401b-8304-9b8a5d370c8e', 'allowed-protocol-mapper-types',
        'saml-user-attribute-mapper');
INSERT INTO public.component_config (id, component_id, name, value)
VALUES ('fede7e21-b13f-415a-9c99-73ce62b681ed', '13a80153-4e50-401b-8304-9b8a5d370c8e', 'allowed-protocol-mapper-types',
        'saml-role-list-mapper');
INSERT INTO public.component_config (id, component_id, name, value)
VALUES ('008770fa-5ef2-4cb3-b03b-a518465608ca', '13a80153-4e50-401b-8304-9b8a5d370c8e', 'allowed-protocol-mapper-types',
        'saml-user-property-mapper');
INSERT INTO public.component_config (id, component_id, name, value)
VALUES ('701f60d4-9640-49fa-922c-2a49f4bf58cc', '13a80153-4e50-401b-8304-9b8a5d370c8e', 'allowed-protocol-mapper-types',
        'oidc-full-name-mapper');
INSERT INTO public.component_config (id, component_id, name, value)
VALUES ('cb19855d-ad96-4a32-91ef-d329864f0506', '13a80153-4e50-401b-8304-9b8a5d370c8e', 'allowed-protocol-mapper-types',
        'oidc-usermodel-attribute-mapper');
INSERT INTO public.component_config (id, component_id, name, value)
VALUES ('8f4833bf-a778-496a-bbb2-e0568d8469e4', '13a80153-4e50-401b-8304-9b8a5d370c8e', 'allowed-protocol-mapper-types',
        'oidc-sha256-pairwise-sub-mapper');
INSERT INTO public.component_config (id, component_id, name, value)
VALUES ('218efa91-2c51-4155-9b9c-12d9c6550f08', '4bc45ab8-7f09-4d78-ac7d-bed8efe001ef', 'priority', '100');
INSERT INTO public.component_config (id, component_id, name, value)
VALUES ('7518e5d8-8b07-4227-b9d6-4804d1d73a2c', '4bc45ab8-7f09-4d78-ac7d-bed8efe001ef', 'secret',
        'NiLKotQuFOcUzJpDrOsMZAldS5UKQOEQRjdfSMji_cFL99WWQFRKeUEaoXwYpDg0nkyd0yeY0n0U5XpdpKIyGg');
INSERT INTO public.component_config (id, component_id, name, value)
VALUES ('22b64385-dff3-4fdf-b7e3-b784b8d69786', '4bc45ab8-7f09-4d78-ac7d-bed8efe001ef', 'kid',
        '894abcc8-ff38-46fc-84ff-becc41a24340');
INSERT INTO public.component_config (id, component_id, name, value)
VALUES ('29dce226-efdc-44b5-8a9f-7021ec7c1e03', '4bc45ab8-7f09-4d78-ac7d-bed8efe001ef', 'algorithm', 'HS256');
INSERT INTO public.component_config (id, component_id, name, value)
VALUES ('e817f1f4-2523-498a-a0ca-468df68249cc', 'fbdb0d97-8de9-4122-b9ee-4f37b1ec4bfa', 'client-uris-must-match',
        'true');
INSERT INTO public.component_config (id, component_id, name, value)
VALUES ('18030da4-b00e-4c04-ae9e-31d15b0bbdbd', 'fbdb0d97-8de9-4122-b9ee-4f37b1ec4bfa',
        'host-sending-registration-request-must-match', 'true');
INSERT INTO public.component_config (id, component_id, name, value)
VALUES ('54a79cc8-654e-4dcc-8f90-6493e26070b6', 'c4214322-dfbe-4fa9-83b6-507c84c98bad', 'allow-default-scopes', 'true');
INSERT INTO public.component_config (id, component_id, name, value)
VALUES ('c5fa9455-1793-4903-b4e3-d70a6a1ab43d', '08f4f634-4b98-4756-8658-5d9a3952889f', 'priority', '100');
INSERT INTO public.component_config (id, component_id, name, value)
VALUES ('431fb642-7bdf-4854-b2cf-090c9a284dca', '08f4f634-4b98-4756-8658-5d9a3952889f', 'secret',
        'veEqLK8QNXBJNzYPi-LdrQ');
INSERT INTO public.component_config (id, component_id, name, value)
VALUES ('2e615321-3d3e-4093-8ea1-5661b0b41aae', '08f4f634-4b98-4756-8658-5d9a3952889f', 'kid',
        '04347db9-d064-4b4a-807c-779fcd74a17b');


--
-- TOC entry 4125 (class 0 OID 16417)
-- Dependencies: 214
-- Data for Name: composite_role; Type: TABLE DATA; Schema: public; Owner: magnittest
--

INSERT INTO public.composite_role (composite, child_role)
VALUES ('f1eb6095-6dc4-4444-a63b-c9928027039f', '6b31dd8a-d4e0-45b8-83f1-1a2aecb35af0');
INSERT INTO public.composite_role (composite, child_role)
VALUES ('f1eb6095-6dc4-4444-a63b-c9928027039f', '34d2b4f2-fc96-44c8-a222-f83a267c4408');
INSERT INTO public.composite_role (composite, child_role)
VALUES ('f1eb6095-6dc4-4444-a63b-c9928027039f', '954d7f64-f2ce-4071-b858-cf077db277f0');
INSERT INTO public.composite_role (composite, child_role)
VALUES ('f1eb6095-6dc4-4444-a63b-c9928027039f', '27ea7307-c3ed-471b-a463-7f47c8012dfc');
INSERT INTO public.composite_role (composite, child_role)
VALUES ('f1eb6095-6dc4-4444-a63b-c9928027039f', 'f2a7cb05-6bdf-459c-9138-4645d68cc1e1');
INSERT INTO public.composite_role (composite, child_role)
VALUES ('f1eb6095-6dc4-4444-a63b-c9928027039f', '43141a33-c0ca-4425-ac6d-ae597b1ff66c');
INSERT INTO public.composite_role (composite, child_role)
VALUES ('f1eb6095-6dc4-4444-a63b-c9928027039f', 'a2204c23-47db-49f1-873b-3d1f0a4f2aa2');
INSERT INTO public.composite_role (composite, child_role)
VALUES ('f1eb6095-6dc4-4444-a63b-c9928027039f', 'ef293e8a-11fd-4908-a9e0-672368084f5c');
INSERT INTO public.composite_role (composite, child_role)
VALUES ('f1eb6095-6dc4-4444-a63b-c9928027039f', '40d9dafd-22c7-4d2f-a708-7d874cdf8d21');
INSERT INTO public.composite_role (composite, child_role)
VALUES ('f1eb6095-6dc4-4444-a63b-c9928027039f', '81a7c1d6-495b-4799-96cb-f590a9a0a937');
INSERT INTO public.composite_role (composite, child_role)
VALUES ('f1eb6095-6dc4-4444-a63b-c9928027039f', '8e2a5553-4b90-41cc-b3bc-45cbc2bfe5be');
INSERT INTO public.composite_role (composite, child_role)
VALUES ('f1eb6095-6dc4-4444-a63b-c9928027039f', '0983d33e-8b91-47b5-bb7f-8e4d6e5eca6c');
INSERT INTO public.composite_role (composite, child_role)
VALUES ('f1eb6095-6dc4-4444-a63b-c9928027039f', 'a6923314-301b-466f-a1b4-6b83bff6e83c');
INSERT INTO public.composite_role (composite, child_role)
VALUES ('f1eb6095-6dc4-4444-a63b-c9928027039f', '0dc1da81-b749-41c8-97f2-0fb91d3c2556');
INSERT INTO public.composite_role (composite, child_role)
VALUES ('f1eb6095-6dc4-4444-a63b-c9928027039f', 'e8d8d57b-60b9-4ae0-a03b-f7c0a2306965');
INSERT INTO public.composite_role (composite, child_role)
VALUES ('f1eb6095-6dc4-4444-a63b-c9928027039f', '4b91d721-69b6-4c8c-a820-ea795ee4cf23');
INSERT INTO public.composite_role (composite, child_role)
VALUES ('f1eb6095-6dc4-4444-a63b-c9928027039f', '43c27842-9eab-46d0-bd95-f0426c5b132c');
INSERT INTO public.composite_role (composite, child_role)
VALUES ('f1eb6095-6dc4-4444-a63b-c9928027039f', '182c87a2-c36b-4444-bdf8-55868dc3a913');
INSERT INTO public.composite_role (composite, child_role)
VALUES ('f2a7cb05-6bdf-459c-9138-4645d68cc1e1', '4b91d721-69b6-4c8c-a820-ea795ee4cf23');
INSERT INTO public.composite_role (composite, child_role)
VALUES ('27ea7307-c3ed-471b-a463-7f47c8012dfc', 'e8d8d57b-60b9-4ae0-a03b-f7c0a2306965');
INSERT INTO public.composite_role (composite, child_role)
VALUES ('27ea7307-c3ed-471b-a463-7f47c8012dfc', '182c87a2-c36b-4444-bdf8-55868dc3a913');
INSERT INTO public.composite_role (composite, child_role)
VALUES ('ab1dabb5-455d-47b5-b81d-8d362e0b3b9e', 'ef2360f5-43bc-4cbd-ac1e-8c124c41e954');
INSERT INTO public.composite_role (composite, child_role)
VALUES ('ab1dabb5-455d-47b5-b81d-8d362e0b3b9e', '10c12e84-8747-48ea-9188-7d86b7a113d2');
INSERT INTO public.composite_role (composite, child_role)
VALUES ('10c12e84-8747-48ea-9188-7d86b7a113d2', 'd66bab76-c38c-4f61-bce9-d754710da4da');
INSERT INTO public.composite_role (composite, child_role)
VALUES ('18ffe376-5993-4e6d-9a7c-383370770a82', '01844eba-e58c-4ca2-ac72-a6b20ef375be');
INSERT INTO public.composite_role (composite, child_role)
VALUES ('f1eb6095-6dc4-4444-a63b-c9928027039f', '7ad13b38-29ae-40ed-820a-682b28c2ef13');
INSERT INTO public.composite_role (composite, child_role)
VALUES ('53553f66-f699-49c9-9cdc-a05e244b4ea3', 'ce1af2e4-d13f-444e-9799-032d5dded6a7');
INSERT INTO public.composite_role (composite, child_role)
VALUES ('53553f66-f699-49c9-9cdc-a05e244b4ea3', 'ef2360f5-43bc-4cbd-ac1e-8c124c41e954');
INSERT INTO public.composite_role (composite, child_role)
VALUES ('53553f66-f699-49c9-9cdc-a05e244b4ea3', 'c1f752c6-352e-4778-a241-fb9d5e587b3d');
INSERT INTO public.composite_role (composite, child_role)
VALUES ('53553f66-f699-49c9-9cdc-a05e244b4ea3', '10c12e84-8747-48ea-9188-7d86b7a113d2');
INSERT INTO public.composite_role (composite, child_role)
VALUES ('f1eb6095-6dc4-4444-a63b-c9928027039f', 'cceb50bf-7a95-4f62-a7b0-c1c9c8e5303d');
INSERT INTO public.composite_role (composite, child_role)
VALUES ('f1eb6095-6dc4-4444-a63b-c9928027039f', '43d6c6d3-4c8e-40a7-9303-5be1b6da71cf');
INSERT INTO public.composite_role (composite, child_role)
VALUES ('f1eb6095-6dc4-4444-a63b-c9928027039f', '6cdb4509-79bb-47f0-a346-787f1e548cd0');
INSERT INTO public.composite_role (composite, child_role)
VALUES ('f1eb6095-6dc4-4444-a63b-c9928027039f', '738d8084-2171-499e-b834-4cbce66848c7');
INSERT INTO public.composite_role (composite, child_role)
VALUES ('f1eb6095-6dc4-4444-a63b-c9928027039f', '56169877-aa6f-4654-9da1-40b661d81935');
INSERT INTO public.composite_role (composite, child_role)
VALUES ('f1eb6095-6dc4-4444-a63b-c9928027039f', '2a93d51f-b1ee-4e78-b0ef-4397d5bd4831');
INSERT INTO public.composite_role (composite, child_role)
VALUES ('f1eb6095-6dc4-4444-a63b-c9928027039f', 'f7cfe921-4d01-4524-aa12-f76d9d33d83b');
INSERT INTO public.composite_role (composite, child_role)
VALUES ('f1eb6095-6dc4-4444-a63b-c9928027039f', '48bb5c6e-53fc-4c05-8f55-a6cfb66a7af1');
INSERT INTO public.composite_role (composite, child_role)
VALUES ('f1eb6095-6dc4-4444-a63b-c9928027039f', 'eb0afb9d-d4f6-452a-aaaa-8445ac537577');
INSERT INTO public.composite_role (composite, child_role)
VALUES ('f1eb6095-6dc4-4444-a63b-c9928027039f', 'a41677e0-7d00-4194-afe2-5493899ea10e');
INSERT INTO public.composite_role (composite, child_role)
VALUES ('f1eb6095-6dc4-4444-a63b-c9928027039f', 'bb17a882-ed42-4bd5-af28-3555faeabf3f');
INSERT INTO public.composite_role (composite, child_role)
VALUES ('f1eb6095-6dc4-4444-a63b-c9928027039f', 'a35cf9ed-c5ca-491f-b67e-17a094395669');
INSERT INTO public.composite_role (composite, child_role)
VALUES ('f1eb6095-6dc4-4444-a63b-c9928027039f', 'e57de952-2d90-4964-8afd-0b9182d1093c');
INSERT INTO public.composite_role (composite, child_role)
VALUES ('f1eb6095-6dc4-4444-a63b-c9928027039f', 'd4c9a670-4f68-484b-8707-0178885e279c');
INSERT INTO public.composite_role (composite, child_role)
VALUES ('f1eb6095-6dc4-4444-a63b-c9928027039f', '12bc3d7e-8504-42b2-ae1d-361223755050');
INSERT INTO public.composite_role (composite, child_role)
VALUES ('f1eb6095-6dc4-4444-a63b-c9928027039f', '9171cdd1-4414-4c04-b961-b4bc4551a300');
INSERT INTO public.composite_role (composite, child_role)
VALUES ('f1eb6095-6dc4-4444-a63b-c9928027039f', 'e990e2bb-2a1e-406e-895b-9350ef0a53b0');
INSERT INTO public.composite_role (composite, child_role)
VALUES ('738d8084-2171-499e-b834-4cbce66848c7', '12bc3d7e-8504-42b2-ae1d-361223755050');
INSERT INTO public.composite_role (composite, child_role)
VALUES ('6cdb4509-79bb-47f0-a346-787f1e548cd0', 'e990e2bb-2a1e-406e-895b-9350ef0a53b0');
INSERT INTO public.composite_role (composite, child_role)
VALUES ('6cdb4509-79bb-47f0-a346-787f1e548cd0', 'd4c9a670-4f68-484b-8707-0178885e279c');
INSERT INTO public.composite_role (composite, child_role)
VALUES ('5e811292-e413-418b-afe2-e1cb5f138927', '5a8c0f4f-35db-4c9e-b4d0-584919a41a97');
INSERT INTO public.composite_role (composite, child_role)
VALUES ('5e811292-e413-418b-afe2-e1cb5f138927', '324d5776-0c26-43c1-9cc2-af5f2a649827');
INSERT INTO public.composite_role (composite, child_role)
VALUES ('5e811292-e413-418b-afe2-e1cb5f138927', '942b16d4-2bbe-4620-9b88-bedb7f7c3dd8');
INSERT INTO public.composite_role (composite, child_role)
VALUES ('5e811292-e413-418b-afe2-e1cb5f138927', '05127c90-e872-47fd-afeb-1b79e8a86072');
INSERT INTO public.composite_role (composite, child_role)
VALUES ('b9556269-f9c5-4080-afe9-18e3039062bd', '7f21fc89-702c-4c05-adbc-d807c92babd1');
INSERT INTO public.composite_role (composite, child_role)
VALUES ('b9556269-f9c5-4080-afe9-18e3039062bd', '791477ac-4220-4ede-8842-e73e081217a6');
INSERT INTO public.composite_role (composite, child_role)
VALUES ('b9556269-f9c5-4080-afe9-18e3039062bd', '9e08acc7-8693-429f-905a-89a4b11d3554');
INSERT INTO public.composite_role (composite, child_role)
VALUES ('b9556269-f9c5-4080-afe9-18e3039062bd', '54bbb7f2-14b8-41fd-b39e-7dc1e069b238');
INSERT INTO public.composite_role (composite, child_role)
VALUES ('b9556269-f9c5-4080-afe9-18e3039062bd', 'c6e9cd32-3009-43b2-b583-fdf3fd38f3f1');
INSERT INTO public.composite_role (composite, child_role)
VALUES ('b9556269-f9c5-4080-afe9-18e3039062bd', '7c1828e8-bb82-4b0e-9c51-2a3e71bd4343');
INSERT INTO public.composite_role (composite, child_role)
VALUES ('b9556269-f9c5-4080-afe9-18e3039062bd', 'ba079b01-69a2-4913-9d46-f90f4a764e57');
INSERT INTO public.composite_role (composite, child_role)
VALUES ('b9556269-f9c5-4080-afe9-18e3039062bd', 'd1cb519a-e104-482e-b9ac-e5fc26a7aa0d');
INSERT INTO public.composite_role (composite, child_role)
VALUES ('b9556269-f9c5-4080-afe9-18e3039062bd', '4a8d1d9a-63d5-4a81-b513-53830f1cbddf');
INSERT INTO public.composite_role (composite, child_role)
VALUES ('b9556269-f9c5-4080-afe9-18e3039062bd', 'ef098e23-87c3-4427-8d7d-c01628440726');
INSERT INTO public.composite_role (composite, child_role)
VALUES ('b9556269-f9c5-4080-afe9-18e3039062bd', '48b0a951-e63e-4030-a9be-f025e7a1e08d');
INSERT INTO public.composite_role (composite, child_role)
VALUES ('b9556269-f9c5-4080-afe9-18e3039062bd', '19782f6c-1893-4764-b32c-1eadd6a7e723');
INSERT INTO public.composite_role (composite, child_role)
VALUES ('b9556269-f9c5-4080-afe9-18e3039062bd', '69961c51-7353-40ef-88b7-7b5325f44ac0');
INSERT INTO public.composite_role (composite, child_role)
VALUES ('b9556269-f9c5-4080-afe9-18e3039062bd', 'd12a4e65-6c6c-434a-b977-827d69827b42');
INSERT INTO public.composite_role (composite, child_role)
VALUES ('b9556269-f9c5-4080-afe9-18e3039062bd', 'a2fdb01c-66bc-440a-a1a2-6b5cf2a5b251');
INSERT INTO public.composite_role (composite, child_role)
VALUES ('b9556269-f9c5-4080-afe9-18e3039062bd', 'fb7cff01-b049-4453-9329-da6e6bcdc526');
INSERT INTO public.composite_role (composite, child_role)
VALUES ('b9556269-f9c5-4080-afe9-18e3039062bd', 'fd0f6c3c-e7d1-4cc3-9e64-8726c2565a88');
INSERT INTO public.composite_role (composite, child_role)
VALUES ('b9556269-f9c5-4080-afe9-18e3039062bd', '55b493a1-e1ee-4c52-89ae-7ebb1ddd8466');
INSERT INTO public.composite_role (composite, child_role)
VALUES ('c6e9cd32-3009-43b2-b583-fdf3fd38f3f1', 'fd0f6c3c-e7d1-4cc3-9e64-8726c2565a88');
INSERT INTO public.composite_role (composite, child_role)
VALUES ('c6e9cd32-3009-43b2-b583-fdf3fd38f3f1', '55b493a1-e1ee-4c52-89ae-7ebb1ddd8466');
INSERT INTO public.composite_role (composite, child_role)
VALUES ('d12a4e65-6c6c-434a-b977-827d69827b42', '69961c51-7353-40ef-88b7-7b5325f44ac0');
INSERT INTO public.composite_role (composite, child_role)
VALUES ('942b16d4-2bbe-4620-9b88-bedb7f7c3dd8', '470e3aed-b591-4bfd-b5cd-77598c346f6c');
INSERT INTO public.composite_role (composite, child_role)
VALUES ('ea55e0b8-943e-46dc-861b-ee0ddc6c4691', '81fd92c6-7548-4d81-9da1-453adf06b660');
INSERT INTO public.composite_role (composite, child_role)
VALUES ('f1eb6095-6dc4-4444-a63b-c9928027039f', '14bca42e-c648-44b5-8101-8f643b629fa0');


--
-- TOC entry 4126 (class 0 OID 16420)
-- Dependencies: 215
-- Data for Name: credential; Type: TABLE DATA; Schema: public; Owner: magnittest
--

INSERT INTO public.credential (id, salt, type, user_id, created_date, user_label, secret_data, credential_data,
                               priority)
VALUES ('c6d95a41-08af-4210-980b-37ccf6c641b0', NULL, 'password', '7bd1d24f-747e-4455-802f-835a307856bd', 1668445669721,
        NULL,
        '{"value":"CPuzmNkbsWyhc7A352aMKr2lKc39NiECIS7VoZplAeeOrsEOyiAKGTpcXrhbFqEwukDklAaXmhvJWW4QX/pnjA==","salt":"jeSlWE0mx5DiQry1Zrly5Q==","additionalParameters":{}}',
        '{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}', 10);
INSERT INTO public.credential (id, salt, type, user_id, created_date, user_label, secret_data, credential_data,
                               priority)
VALUES ('da96f447-3b9f-4781-9008-6896ea474502', NULL, 'password', '4a18bf67-13bb-49c0-8c83-bd41845f199a', 1668452460892,
        NULL,
        '{"value":"Dc4hw7LQT/lIiJNcxA25niXX8sK2hTkUK95YL+I+D+VqrhwWI5SUdtpYtkHz9KxDik9DXurzPmIAsLYYmVBbfA==","salt":"jBk5GGlj6rHPDRf2/XzR+A==","additionalParameters":{}}',
        '{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}', 10);
INSERT INTO public.credential (id, salt, type, user_id, created_date, user_label, secret_data, credential_data,
                               priority)
VALUES ('780d2708-0317-4944-aa01-d7ff01f7460d', NULL, 'password', '077bb090-ad30-4dc5-b441-6c435225b749', 1668453448297,
        NULL,
        '{"value":"3Rl5O9AV5KIKN6x01tGpVPkZcb4fkHbsD2n6Ehv+hwRctS4QBEvh8dc93AVxc0J1obiTdHWLTxgfvzrRZ62pJg==","salt":"ZOJ3zKug1Ca+GjYD6+zjfw==","additionalParameters":{}}',
        '{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}', 10);


--
-- TOC entry 4121 (class 0 OID 16390)
-- Dependencies: 210
-- Data for Name: databasechangelog; Type: TABLE DATA; Schema: public; Owner: magnittest
--

INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description,
                                      comments, tag, liquibase, contexts, labels, deployment_id)
VALUES ('1.0.0.Final-KEYCLOAK-5461', 'sthorger@redhat.com', 'META-INF/jpa-changelog-1.0.0.Final.xml',
        '2022-11-14 17:07:35.861595', 1, 'EXECUTED', '7:4e70412f24a3f382c82183742ec79317',
        'createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...',
        '', NULL, '3.5.4', NULL, NULL, '8445655339');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description,
                                      comments, tag, liquibase, contexts, labels, deployment_id)
VALUES ('1.0.0.Final-KEYCLOAK-5461', 'sthorger@redhat.com', 'META-INF/db2-jpa-changelog-1.0.0.Final.xml',
        '2022-11-14 17:07:35.874201', 2, 'MARK_RAN', '7:cb16724583e9675711801c6875114f28',
        'createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...',
        '', NULL, '3.5.4', NULL, NULL, '8445655339');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description,
                                      comments, tag, liquibase, contexts, labels, deployment_id)
VALUES ('1.1.0.Beta1', 'sthorger@redhat.com', 'META-INF/jpa-changelog-1.1.0.Beta1.xml', '2022-11-14 17:07:35.921193', 3,
        'EXECUTED', '7:0310eb8ba07cec616460794d42ade0fa',
        'delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=CLIENT_ATTRIBUTES; createTable tableName=CLIENT_SESSION_NOTE; createTable tableName=APP_NODE_REGISTRATIONS; addColumn table...',
        '', NULL, '3.5.4', NULL, NULL, '8445655339');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description,
                                      comments, tag, liquibase, contexts, labels, deployment_id)
VALUES ('1.1.0.Final', 'sthorger@redhat.com', 'META-INF/jpa-changelog-1.1.0.Final.xml', '2022-11-14 17:07:35.925691', 4,
        'EXECUTED', '7:5d25857e708c3233ef4439df1f93f012',
        'renameColumn newColumnName=EVENT_TIME, oldColumnName=TIME, tableName=EVENT_ENTITY', '', NULL, '3.5.4', NULL,
        NULL, '8445655339');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description,
                                      comments, tag, liquibase, contexts, labels, deployment_id)
VALUES ('1.2.0.Beta1', 'psilva@redhat.com', 'META-INF/jpa-changelog-1.2.0.Beta1.xml', '2022-11-14 17:07:36.061852', 5,
        'EXECUTED', '7:c7a54a1041d58eb3817a4a883b4d4e84',
        'delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...',
        '', NULL, '3.5.4', NULL, NULL, '8445655339');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description,
                                      comments, tag, liquibase, contexts, labels, deployment_id)
VALUES ('1.2.0.Beta1', 'psilva@redhat.com', 'META-INF/db2-jpa-changelog-1.2.0.Beta1.xml', '2022-11-14 17:07:36.065669',
        6, 'MARK_RAN', '7:2e01012df20974c1c2a605ef8afe25b7',
        'delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...',
        '', NULL, '3.5.4', NULL, NULL, '8445655339');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description,
                                      comments, tag, liquibase, contexts, labels, deployment_id)
VALUES ('1.2.0.RC1', 'bburke@redhat.com', 'META-INF/jpa-changelog-1.2.0.CR1.xml', '2022-11-14 17:07:36.177099', 7,
        'EXECUTED', '7:0f08df48468428e0f30ee59a8ec01a41',
        'delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...',
        '', NULL, '3.5.4', NULL, NULL, '8445655339');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description,
                                      comments, tag, liquibase, contexts, labels, deployment_id)
VALUES ('1.2.0.RC1', 'bburke@redhat.com', 'META-INF/db2-jpa-changelog-1.2.0.CR1.xml', '2022-11-14 17:07:36.180986', 8,
        'MARK_RAN', '7:a77ea2ad226b345e7d689d366f185c8c',
        'delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...',
        '', NULL, '3.5.4', NULL, NULL, '8445655339');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description,
                                      comments, tag, liquibase, contexts, labels, deployment_id)
VALUES ('1.2.0.Final', 'keycloak', 'META-INF/jpa-changelog-1.2.0.Final.xml', '2022-11-14 17:07:36.18592', 9, 'EXECUTED',
        '7:a3377a2059aefbf3b90ebb4c4cc8e2ab',
        'update tableName=CLIENT; update tableName=CLIENT; update tableName=CLIENT', '', NULL, '3.5.4', NULL, NULL,
        '8445655339');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description,
                                      comments, tag, liquibase, contexts, labels, deployment_id)
VALUES ('1.3.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-1.3.0.xml', '2022-11-14 17:07:36.306319', 10, 'EXECUTED',
        '7:04c1dbedc2aa3e9756d1a1668e003451',
        'delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=ADMI...',
        '', NULL, '3.5.4', NULL, NULL, '8445655339');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description,
                                      comments, tag, liquibase, contexts, labels, deployment_id)
VALUES ('1.4.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-1.4.0.xml', '2022-11-14 17:07:36.373107', 11, 'EXECUTED',
        '7:36ef39ed560ad07062d956db861042ba',
        'delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...',
        '', NULL, '3.5.4', NULL, NULL, '8445655339');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description,
                                      comments, tag, liquibase, contexts, labels, deployment_id)
VALUES ('1.4.0', 'bburke@redhat.com', 'META-INF/db2-jpa-changelog-1.4.0.xml', '2022-11-14 17:07:36.376193', 12,
        'MARK_RAN', '7:d909180b2530479a716d3f9c9eaea3d7',
        'delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...',
        '', NULL, '3.5.4', NULL, NULL, '8445655339');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description,
                                      comments, tag, liquibase, contexts, labels, deployment_id)
VALUES ('1.5.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-1.5.0.xml', '2022-11-14 17:07:36.4012', 13, 'EXECUTED',
        '7:cf12b04b79bea5152f165eb41f3955f6',
        'delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...',
        '', NULL, '3.5.4', NULL, NULL, '8445655339');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description,
                                      comments, tag, liquibase, contexts, labels, deployment_id)
VALUES ('1.6.1_from15', 'mposolda@redhat.com', 'META-INF/jpa-changelog-1.6.1.xml', '2022-11-14 17:07:36.4253', 14,
        'EXECUTED', '7:7e32c8f05c755e8675764e7d5f514509',
        'addColumn tableName=REALM; addColumn tableName=KEYCLOAK_ROLE; addColumn tableName=CLIENT; createTable tableName=OFFLINE_USER_SESSION; createTable tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_US_SES_PK2, tableName=...',
        '', NULL, '3.5.4', NULL, NULL, '8445655339');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description,
                                      comments, tag, liquibase, contexts, labels, deployment_id)
VALUES ('1.6.1_from16-pre', 'mposolda@redhat.com', 'META-INF/jpa-changelog-1.6.1.xml', '2022-11-14 17:07:36.42774', 15,
        'MARK_RAN', '7:980ba23cc0ec39cab731ce903dd01291',
        'delete tableName=OFFLINE_CLIENT_SESSION; delete tableName=OFFLINE_USER_SESSION', '', NULL, '3.5.4', NULL, NULL,
        '8445655339');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description,
                                      comments, tag, liquibase, contexts, labels, deployment_id)
VALUES ('1.6.1_from16', 'mposolda@redhat.com', 'META-INF/jpa-changelog-1.6.1.xml', '2022-11-14 17:07:36.435427', 16,
        'MARK_RAN', '7:2fa220758991285312eb84f3b4ff5336',
        'dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_US_SES_PK, tableName=OFFLINE_USER_SESSION; dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_CL_SES_PK, tableName=OFFLINE_CLIENT_SESSION; addColumn tableName=OFFLINE_USER_SESSION; update tableName=OF...',
        '', NULL, '3.5.4', NULL, NULL, '8445655339');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description,
                                      comments, tag, liquibase, contexts, labels, deployment_id)
VALUES ('1.6.1', 'mposolda@redhat.com', 'META-INF/jpa-changelog-1.6.1.xml', '2022-11-14 17:07:36.437739', 17,
        'EXECUTED', '7:d41d8cd98f00b204e9800998ecf8427e', 'empty', '', NULL, '3.5.4', NULL, NULL, '8445655339');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description,
                                      comments, tag, liquibase, contexts, labels, deployment_id)
VALUES ('1.7.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-1.7.0.xml', '2022-11-14 17:07:36.50692', 18, 'EXECUTED',
        '7:91ace540896df890cc00a0490ee52bbc',
        'createTable tableName=KEYCLOAK_GROUP; createTable tableName=GROUP_ROLE_MAPPING; createTable tableName=GROUP_ATTRIBUTE; createTable tableName=USER_GROUP_MEMBERSHIP; createTable tableName=REALM_DEFAULT_GROUPS; addColumn tableName=IDENTITY_PROVIDER; ...',
        '', NULL, '3.5.4', NULL, NULL, '8445655339');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description,
                                      comments, tag, liquibase, contexts, labels, deployment_id)
VALUES ('1.8.0', 'mposolda@redhat.com', 'META-INF/jpa-changelog-1.8.0.xml', '2022-11-14 17:07:36.572279', 19,
        'EXECUTED', '7:c31d1646dfa2618a9335c00e07f89f24',
        'addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...',
        '', NULL, '3.5.4', NULL, NULL, '8445655339');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description,
                                      comments, tag, liquibase, contexts, labels, deployment_id)
VALUES ('1.8.0-2', 'keycloak', 'META-INF/jpa-changelog-1.8.0.xml', '2022-11-14 17:07:36.57825', 20, 'EXECUTED',
        '7:df8bc21027a4f7cbbb01f6344e89ce07',
        'dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL', '', NULL, '3.5.4',
        NULL, NULL, '8445655339');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description,
                                      comments, tag, liquibase, contexts, labels, deployment_id)
VALUES ('authz-3.4.0.CR1-resource-server-pk-change-part1', 'glavoie@gmail.com',
        'META-INF/jpa-changelog-authz-3.4.0.CR1.xml', '2022-11-14 17:07:38.298383', 45, 'EXECUTED',
        '7:6a48ce645a3525488a90fbf76adf3bb3',
        'addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_RESOURCE; addColumn tableName=RESOURCE_SERVER_SCOPE',
        '', NULL, '3.5.4', NULL, NULL, '8445655339');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description,
                                      comments, tag, liquibase, contexts, labels, deployment_id)
VALUES ('1.8.0', 'mposolda@redhat.com', 'META-INF/db2-jpa-changelog-1.8.0.xml', '2022-11-14 17:07:36.58143', 21,
        'MARK_RAN', '7:f987971fe6b37d963bc95fee2b27f8df',
        'addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...',
        '', NULL, '3.5.4', NULL, NULL, '8445655339');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description,
                                      comments, tag, liquibase, contexts, labels, deployment_id)
VALUES ('1.8.0-2', 'keycloak', 'META-INF/db2-jpa-changelog-1.8.0.xml', '2022-11-14 17:07:36.584102', 22, 'MARK_RAN',
        '7:df8bc21027a4f7cbbb01f6344e89ce07',
        'dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL', '', NULL, '3.5.4',
        NULL, NULL, '8445655339');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description,
                                      comments, tag, liquibase, contexts, labels, deployment_id)
VALUES ('1.9.0', 'mposolda@redhat.com', 'META-INF/jpa-changelog-1.9.0.xml', '2022-11-14 17:07:36.664259', 23,
        'EXECUTED', '7:ed2dc7f799d19ac452cbcda56c929e47',
        'update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=REALM; update tableName=REALM; customChange; dr...',
        '', NULL, '3.5.4', NULL, NULL, '8445655339');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description,
                                      comments, tag, liquibase, contexts, labels, deployment_id)
VALUES ('1.9.1', 'keycloak', 'META-INF/jpa-changelog-1.9.1.xml', '2022-11-14 17:07:36.670612', 24, 'EXECUTED',
        '7:80b5db88a5dda36ece5f235be8757615',
        'modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=PUBLIC_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM',
        '', NULL, '3.5.4', NULL, NULL, '8445655339');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description,
                                      comments, tag, liquibase, contexts, labels, deployment_id)
VALUES ('1.9.1', 'keycloak', 'META-INF/db2-jpa-changelog-1.9.1.xml', '2022-11-14 17:07:36.672676', 25, 'MARK_RAN',
        '7:1437310ed1305a9b93f8848f301726ce',
        'modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM',
        '', NULL, '3.5.4', NULL, NULL, '8445655339');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description,
                                      comments, tag, liquibase, contexts, labels, deployment_id)
VALUES ('1.9.2', 'keycloak', 'META-INF/jpa-changelog-1.9.2.xml', '2022-11-14 17:07:36.913008', 26, 'EXECUTED',
        '7:b82ffb34850fa0836be16deefc6a87c4',
        'createIndex indexName=IDX_USER_EMAIL, tableName=USER_ENTITY; createIndex indexName=IDX_USER_ROLE_MAPPING, tableName=USER_ROLE_MAPPING; createIndex indexName=IDX_USER_GROUP_MAPPING, tableName=USER_GROUP_MEMBERSHIP; createIndex indexName=IDX_USER_CO...',
        '', NULL, '3.5.4', NULL, NULL, '8445655339');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description,
                                      comments, tag, liquibase, contexts, labels, deployment_id)
VALUES ('authz-2.0.0', 'psilva@redhat.com', 'META-INF/jpa-changelog-authz-2.0.0.xml', '2022-11-14 17:07:37.017248', 27,
        'EXECUTED', '7:9cc98082921330d8d9266decdd4bd658',
        'createTable tableName=RESOURCE_SERVER; addPrimaryKey constraintName=CONSTRAINT_FARS, tableName=RESOURCE_SERVER; addUniqueConstraint constraintName=UK_AU8TT6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER; createTable tableName=RESOURCE_SERVER_RESOU...',
        '', NULL, '3.5.4', NULL, NULL, '8445655339');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description,
                                      comments, tag, liquibase, contexts, labels, deployment_id)
VALUES ('authz-2.5.1', 'psilva@redhat.com', 'META-INF/jpa-changelog-authz-2.5.1.xml', '2022-11-14 17:07:37.022267', 28,
        'EXECUTED', '7:03d64aeed9cb52b969bd30a7ac0db57e', 'update tableName=RESOURCE_SERVER_POLICY', '', NULL, '3.5.4',
        NULL, NULL, '8445655339');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description,
                                      comments, tag, liquibase, contexts, labels, deployment_id)
VALUES ('2.1.0-KEYCLOAK-5461', 'bburke@redhat.com', 'META-INF/jpa-changelog-2.1.0.xml', '2022-11-14 17:07:37.107723',
        29, 'EXECUTED', '7:f1f9fd8710399d725b780f463c6b21cd',
        'createTable tableName=BROKER_LINK; createTable tableName=FED_USER_ATTRIBUTE; createTable tableName=FED_USER_CONSENT; createTable tableName=FED_USER_CONSENT_ROLE; createTable tableName=FED_USER_CONSENT_PROT_MAPPER; createTable tableName=FED_USER_CR...',
        '', NULL, '3.5.4', NULL, NULL, '8445655339');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description,
                                      comments, tag, liquibase, contexts, labels, deployment_id)
VALUES ('2.2.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-2.2.0.xml', '2022-11-14 17:07:37.129764', 30, 'EXECUTED',
        '7:53188c3eb1107546e6f765835705b6c1',
        'addColumn tableName=ADMIN_EVENT_ENTITY; createTable tableName=CREDENTIAL_ATTRIBUTE; createTable tableName=FED_CREDENTIAL_ATTRIBUTE; modifyDataType columnName=VALUE, tableName=CREDENTIAL; addForeignKeyConstraint baseTableName=FED_CREDENTIAL_ATTRIBU...',
        '', NULL, '3.5.4', NULL, NULL, '8445655339');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description,
                                      comments, tag, liquibase, contexts, labels, deployment_id)
VALUES ('2.3.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-2.3.0.xml', '2022-11-14 17:07:37.155894', 31, 'EXECUTED',
        '7:d6e6f3bc57a0c5586737d1351725d4d4',
        'createTable tableName=FEDERATED_USER; addPrimaryKey constraintName=CONSTR_FEDERATED_USER, tableName=FEDERATED_USER; dropDefaultValue columnName=TOTP, tableName=USER_ENTITY; dropColumn columnName=TOTP, tableName=USER_ENTITY; addColumn tableName=IDE...',
        '', NULL, '3.5.4', NULL, NULL, '8445655339');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description,
                                      comments, tag, liquibase, contexts, labels, deployment_id)
VALUES ('2.4.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-2.4.0.xml', '2022-11-14 17:07:37.162699', 32, 'EXECUTED',
        '7:454d604fbd755d9df3fd9c6329043aa5', 'customChange', '', NULL, '3.5.4', NULL, NULL, '8445655339');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description,
                                      comments, tag, liquibase, contexts, labels, deployment_id)
VALUES ('2.5.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-2.5.0.xml', '2022-11-14 17:07:37.168559', 33, 'EXECUTED',
        '7:57e98a3077e29caf562f7dbf80c72600',
        'customChange; modifyDataType columnName=USER_ID, tableName=OFFLINE_USER_SESSION', '', NULL, '3.5.4', NULL,
        NULL, '8445655339');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description,
                                      comments, tag, liquibase, contexts, labels, deployment_id)
VALUES ('2.5.0-unicode-oracle', 'hmlnarik@redhat.com', 'META-INF/jpa-changelog-2.5.0.xml', '2022-11-14 17:07:37.171483',
        34, 'MARK_RAN', '7:e4c7e8f2256210aee71ddc42f538b57a',
        'modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...',
        '', NULL, '3.5.4', NULL, NULL, '8445655339');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description,
                                      comments, tag, liquibase, contexts, labels, deployment_id)
VALUES ('2.5.0-unicode-other-dbs', 'hmlnarik@redhat.com', 'META-INF/jpa-changelog-2.5.0.xml',
        '2022-11-14 17:07:37.20729', 35, 'EXECUTED', '7:09a43c97e49bc626460480aa1379b522',
        'modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...',
        '', NULL, '3.5.4', NULL, NULL, '8445655339');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description,
                                      comments, tag, liquibase, contexts, labels, deployment_id)
VALUES ('2.5.0-duplicate-email-support', 'slawomir@dabek.name', 'META-INF/jpa-changelog-2.5.0.xml',
        '2022-11-14 17:07:37.212833', 36, 'EXECUTED', '7:26bfc7c74fefa9126f2ce702fb775553', 'addColumn tableName=REALM',
        '', NULL, '3.5.4', NULL, NULL, '8445655339');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description,
                                      comments, tag, liquibase, contexts, labels, deployment_id)
VALUES ('2.5.0-unique-group-names', 'hmlnarik@redhat.com', 'META-INF/jpa-changelog-2.5.0.xml',
        '2022-11-14 17:07:37.219285', 37, 'EXECUTED', '7:a161e2ae671a9020fff61e996a207377',
        'addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP', '', NULL, '3.5.4', NULL, NULL,
        '8445655339');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description,
                                      comments, tag, liquibase, contexts, labels, deployment_id)
VALUES ('2.5.1', 'bburke@redhat.com', 'META-INF/jpa-changelog-2.5.1.xml', '2022-11-14 17:07:37.223251', 38, 'EXECUTED',
        '7:37fc1781855ac5388c494f1442b3f717', 'addColumn tableName=FED_USER_CONSENT', '', NULL, '3.5.4', NULL, NULL,
        '8445655339');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description,
                                      comments, tag, liquibase, contexts, labels, deployment_id)
VALUES ('3.0.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-3.0.0.xml', '2022-11-14 17:07:37.228491', 39, 'EXECUTED',
        '7:13a27db0dae6049541136adad7261d27', 'addColumn tableName=IDENTITY_PROVIDER', '', NULL, '3.5.4', NULL, NULL,
        '8445655339');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description,
                                      comments, tag, liquibase, contexts, labels, deployment_id)
VALUES ('3.2.0-fix', 'keycloak', 'META-INF/jpa-changelog-3.2.0.xml', '2022-11-14 17:07:37.230301', 40, 'MARK_RAN',
        '7:550300617e3b59e8af3a6294df8248a3',
        'addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS', '', NULL, '3.5.4', NULL, NULL,
        '8445655339');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description,
                                      comments, tag, liquibase, contexts, labels, deployment_id)
VALUES ('3.2.0-fix-with-keycloak-5416', 'keycloak', 'META-INF/jpa-changelog-3.2.0.xml', '2022-11-14 17:07:37.232342',
        41, 'MARK_RAN', '7:e3a9482b8931481dc2772a5c07c44f17',
        'dropIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS; addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS; createIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS',
        '', NULL, '3.5.4', NULL, NULL, '8445655339');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description,
                                      comments, tag, liquibase, contexts, labels, deployment_id)
VALUES ('3.2.0-fix-offline-sessions', 'hmlnarik', 'META-INF/jpa-changelog-3.2.0.xml', '2022-11-14 17:07:37.240303', 42,
        'EXECUTED', '7:72b07d85a2677cb257edb02b408f332d', 'customChange', '', NULL, '3.5.4', NULL, NULL, '8445655339');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description,
                                      comments, tag, liquibase, contexts, labels, deployment_id)
VALUES ('3.2.0-fixed', 'keycloak', 'META-INF/jpa-changelog-3.2.0.xml', '2022-11-14 17:07:38.288432', 43, 'EXECUTED',
        '7:a72a7858967bd414835d19e04d880312',
        'addColumn tableName=REALM; dropPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_PK2, tableName=OFFLINE_CLIENT_SESSION; dropColumn columnName=CLIENT_SESSION_ID, tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_P...',
        '', NULL, '3.5.4', NULL, NULL, '8445655339');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description,
                                      comments, tag, liquibase, contexts, labels, deployment_id)
VALUES ('3.3.0', 'keycloak', 'META-INF/jpa-changelog-3.3.0.xml', '2022-11-14 17:07:38.293826', 44, 'EXECUTED',
        '7:94edff7cf9ce179e7e85f0cd78a3cf2c', 'addColumn tableName=USER_ENTITY', '', NULL, '3.5.4', NULL, NULL,
        '8445655339');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description,
                                      comments, tag, liquibase, contexts, labels, deployment_id)
VALUES ('authz-3.4.0.CR1-resource-server-pk-change-part2-KEYCLOAK-6095', 'hmlnarik@redhat.com',
        'META-INF/jpa-changelog-authz-3.4.0.CR1.xml', '2022-11-14 17:07:38.30416', 46, 'EXECUTED',
        '7:e64b5dcea7db06077c6e57d3b9e5ca14', 'customChange', '', NULL, '3.5.4', NULL, NULL, '8445655339');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description,
                                      comments, tag, liquibase, contexts, labels, deployment_id)
VALUES ('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed', 'glavoie@gmail.com',
        'META-INF/jpa-changelog-authz-3.4.0.CR1.xml', '2022-11-14 17:07:38.306233', 47, 'MARK_RAN',
        '7:fd8cf02498f8b1e72496a20afc75178c',
        'dropIndex indexName=IDX_RES_SERV_POL_RES_SERV, tableName=RESOURCE_SERVER_POLICY; dropIndex indexName=IDX_RES_SRV_RES_RES_SRV, tableName=RESOURCE_SERVER_RESOURCE; dropIndex indexName=IDX_RES_SRV_SCOPE_RES_SRV, tableName=RESOURCE_SERVER_SCOPE',
        '', NULL, '3.5.4', NULL, NULL, '8445655339');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description,
                                      comments, tag, liquibase, contexts, labels, deployment_id)
VALUES ('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed-nodropindex', 'glavoie@gmail.com',
        'META-INF/jpa-changelog-authz-3.4.0.CR1.xml', '2022-11-14 17:07:38.412377', 48, 'EXECUTED',
        '7:542794f25aa2b1fbabb7e577d6646319',
        'addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_POLICY; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_RESOURCE; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, ...',
        '', NULL, '3.5.4', NULL, NULL, '8445655339');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description,
                                      comments, tag, liquibase, contexts, labels, deployment_id)
VALUES ('authn-3.4.0.CR1-refresh-token-max-reuse', 'glavoie@gmail.com', 'META-INF/jpa-changelog-authz-3.4.0.CR1.xml',
        '2022-11-14 17:07:38.416824', 49, 'EXECUTED', '7:edad604c882df12f74941dac3cc6d650', 'addColumn tableName=REALM',
        '', NULL, '3.5.4', NULL, NULL, '8445655339');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description,
                                      comments, tag, liquibase, contexts, labels, deployment_id)
VALUES ('3.4.0', 'keycloak', 'META-INF/jpa-changelog-3.4.0.xml', '2022-11-14 17:07:38.463896', 50, 'EXECUTED',
        '7:0f88b78b7b46480eb92690cbf5e44900',
        'addPrimaryKey constraintName=CONSTRAINT_REALM_DEFAULT_ROLES, tableName=REALM_DEFAULT_ROLES; addPrimaryKey constraintName=CONSTRAINT_COMPOSITE_ROLE, tableName=COMPOSITE_ROLE; addPrimaryKey constraintName=CONSTR_REALM_DEFAULT_GROUPS, tableName=REALM...',
        '', NULL, '3.5.4', NULL, NULL, '8445655339');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description,
                                      comments, tag, liquibase, contexts, labels, deployment_id)
VALUES ('3.4.0-KEYCLOAK-5230', 'hmlnarik@redhat.com', 'META-INF/jpa-changelog-3.4.0.xml', '2022-11-14 17:07:38.699584',
        51, 'EXECUTED', '7:d560e43982611d936457c327f872dd59',
        'createIndex indexName=IDX_FU_ATTRIBUTE, tableName=FED_USER_ATTRIBUTE; createIndex indexName=IDX_FU_CONSENT, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CONSENT_RU, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CREDENTIAL, t...',
        '', NULL, '3.5.4', NULL, NULL, '8445655339');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description,
                                      comments, tag, liquibase, contexts, labels, deployment_id)
VALUES ('3.4.1', 'psilva@redhat.com', 'META-INF/jpa-changelog-3.4.1.xml', '2022-11-14 17:07:38.703603', 52, 'EXECUTED',
        '7:c155566c42b4d14ef07059ec3b3bbd8e', 'modifyDataType columnName=VALUE, tableName=CLIENT_ATTRIBUTES', '', NULL,
        '3.5.4', NULL, NULL, '8445655339');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description,
                                      comments, tag, liquibase, contexts, labels, deployment_id)
VALUES ('3.4.2', 'keycloak', 'META-INF/jpa-changelog-3.4.2.xml', '2022-11-14 17:07:38.707988', 53, 'EXECUTED',
        '7:b40376581f12d70f3c89ba8ddf5b7dea', 'update tableName=REALM', '', NULL, '3.5.4', NULL, NULL, '8445655339');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description,
                                      comments, tag, liquibase, contexts, labels, deployment_id)
VALUES ('3.4.2-KEYCLOAK-5172', 'mkanis@redhat.com', 'META-INF/jpa-changelog-3.4.2.xml', '2022-11-14 17:07:38.710898',
        54, 'EXECUTED', '7:a1132cc395f7b95b3646146c2e38f168', 'update tableName=CLIENT', '', NULL, '3.5.4', NULL, NULL,
        '8445655339');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description,
                                      comments, tag, liquibase, contexts, labels, deployment_id)
VALUES ('4.0.0-KEYCLOAK-6335', 'bburke@redhat.com', 'META-INF/jpa-changelog-4.0.0.xml', '2022-11-14 17:07:38.718151',
        55, 'EXECUTED', '7:d8dc5d89c789105cfa7ca0e82cba60af',
        'createTable tableName=CLIENT_AUTH_FLOW_BINDINGS; addPrimaryKey constraintName=C_CLI_FLOW_BIND, tableName=CLIENT_AUTH_FLOW_BINDINGS',
        '', NULL, '3.5.4', NULL, NULL, '8445655339');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description,
                                      comments, tag, liquibase, contexts, labels, deployment_id)
VALUES ('4.0.0-CLEANUP-UNUSED-TABLE', 'bburke@redhat.com', 'META-INF/jpa-changelog-4.0.0.xml',
        '2022-11-14 17:07:38.729166', 56, 'EXECUTED', '7:7822e0165097182e8f653c35517656a3',
        'dropTable tableName=CLIENT_IDENTITY_PROV_MAPPING', '', NULL, '3.5.4', NULL, NULL, '8445655339');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description,
                                      comments, tag, liquibase, contexts, labels, deployment_id)
VALUES ('4.0.0-KEYCLOAK-6228', 'bburke@redhat.com', 'META-INF/jpa-changelog-4.0.0.xml', '2022-11-14 17:07:38.773657',
        57, 'EXECUTED', '7:c6538c29b9c9a08f9e9ea2de5c2b6375',
        'dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; dropNotNullConstraint columnName=CLIENT_ID, tableName=USER_CONSENT; addColumn tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHO...',
        '', NULL, '3.5.4', NULL, NULL, '8445655339');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description,
                                      comments, tag, liquibase, contexts, labels, deployment_id)
VALUES ('4.0.0-KEYCLOAK-5579-fixed', 'mposolda@redhat.com', 'META-INF/jpa-changelog-4.0.0.xml',
        '2022-11-14 17:07:39.171113', 58, 'EXECUTED', '7:6d4893e36de22369cf73bcb051ded875',
        'dropForeignKeyConstraint baseTableName=CLIENT_TEMPLATE_ATTRIBUTES, constraintName=FK_CL_TEMPL_ATTR_TEMPL; renameTable newTableName=CLIENT_SCOPE_ATTRIBUTES, oldTableName=CLIENT_TEMPLATE_ATTRIBUTES; renameColumn newColumnName=SCOPE_ID, oldColumnName...',
        '', NULL, '3.5.4', NULL, NULL, '8445655339');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description,
                                      comments, tag, liquibase, contexts, labels, deployment_id)
VALUES ('authz-4.0.0.CR1', 'psilva@redhat.com', 'META-INF/jpa-changelog-authz-4.0.0.CR1.xml',
        '2022-11-14 17:07:39.254312', 59, 'EXECUTED', '7:57960fc0b0f0dd0563ea6f8b2e4a1707',
        'createTable tableName=RESOURCE_SERVER_PERM_TICKET; addPrimaryKey constraintName=CONSTRAINT_FAPMT, tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRHO213XCX4WNKOG82SSPMT...',
        '', NULL, '3.5.4', NULL, NULL, '8445655339');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description,
                                      comments, tag, liquibase, contexts, labels, deployment_id)
VALUES ('authz-4.0.0.Beta3', 'psilva@redhat.com', 'META-INF/jpa-changelog-authz-4.0.0.Beta3.xml',
        '2022-11-14 17:07:39.262925', 60, 'EXECUTED', '7:2b4b8bff39944c7097977cc18dbceb3b',
        'addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRPO2128CX4WNKOG82SSRFY, referencedTableName=RESOURCE_SERVER_POLICY',
        '', NULL, '3.5.4', NULL, NULL, '8445655339');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description,
                                      comments, tag, liquibase, contexts, labels, deployment_id)
VALUES ('authz-4.2.0.Final', 'mhajas@redhat.com', 'META-INF/jpa-changelog-authz-4.2.0.Final.xml',
        '2022-11-14 17:07:39.276051', 61, 'EXECUTED', '7:2aa42a964c59cd5b8ca9822340ba33a8',
        'createTable tableName=RESOURCE_URIS; addForeignKeyConstraint baseTableName=RESOURCE_URIS, constraintName=FK_RESOURCE_SERVER_URIS, referencedTableName=RESOURCE_SERVER_RESOURCE; customChange; dropColumn columnName=URI, tableName=RESOURCE_SERVER_RESO...',
        '', NULL, '3.5.4', NULL, NULL, '8445655339');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description,
                                      comments, tag, liquibase, contexts, labels, deployment_id)
VALUES ('authz-4.2.0.Final-KEYCLOAK-9944', 'hmlnarik@redhat.com', 'META-INF/jpa-changelog-authz-4.2.0.Final.xml',
        '2022-11-14 17:07:39.283112', 62, 'EXECUTED', '7:9ac9e58545479929ba23f4a3087a0346',
        'addPrimaryKey constraintName=CONSTRAINT_RESOUR_URIS_PK, tableName=RESOURCE_URIS', '', NULL, '3.5.4', NULL,
        NULL, '8445655339');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description,
                                      comments, tag, liquibase, contexts, labels, deployment_id)
VALUES ('4.2.0-KEYCLOAK-6313', 'wadahiro@gmail.com', 'META-INF/jpa-changelog-4.2.0.xml', '2022-11-14 17:07:39.287205',
        63, 'EXECUTED', '7:14d407c35bc4fe1976867756bcea0c36', 'addColumn tableName=REQUIRED_ACTION_PROVIDER', '', NULL,
        '3.5.4', NULL, NULL, '8445655339');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description,
                                      comments, tag, liquibase, contexts, labels, deployment_id)
VALUES ('4.3.0-KEYCLOAK-7984', 'wadahiro@gmail.com', 'META-INF/jpa-changelog-4.3.0.xml', '2022-11-14 17:07:39.29093',
        64, 'EXECUTED', '7:241a8030c748c8548e346adee548fa93', 'update tableName=REQUIRED_ACTION_PROVIDER', '', NULL,
        '3.5.4', NULL, NULL, '8445655339');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description,
                                      comments, tag, liquibase, contexts, labels, deployment_id)
VALUES ('4.6.0-KEYCLOAK-7950', 'psilva@redhat.com', 'META-INF/jpa-changelog-4.6.0.xml', '2022-11-14 17:07:39.294098',
        65, 'EXECUTED', '7:7d3182f65a34fcc61e8d23def037dc3f', 'update tableName=RESOURCE_SERVER_RESOURCE', '', NULL,
        '3.5.4', NULL, NULL, '8445655339');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description,
                                      comments, tag, liquibase, contexts, labels, deployment_id)
VALUES ('4.6.0-KEYCLOAK-8377', 'keycloak', 'META-INF/jpa-changelog-4.6.0.xml', '2022-11-14 17:07:39.32622', 66,
        'EXECUTED', '7:b30039e00a0b9715d430d1b0636728fa',
        'createTable tableName=ROLE_ATTRIBUTE; addPrimaryKey constraintName=CONSTRAINT_ROLE_ATTRIBUTE_PK, tableName=ROLE_ATTRIBUTE; addForeignKeyConstraint baseTableName=ROLE_ATTRIBUTE, constraintName=FK_ROLE_ATTRIBUTE_ID, referencedTableName=KEYCLOAK_ROLE...',
        '', NULL, '3.5.4', NULL, NULL, '8445655339');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description,
                                      comments, tag, liquibase, contexts, labels, deployment_id)
VALUES ('4.6.0-KEYCLOAK-8555', 'gideonray@gmail.com', 'META-INF/jpa-changelog-4.6.0.xml', '2022-11-14 17:07:39.347929',
        67, 'EXECUTED', '7:3797315ca61d531780f8e6f82f258159',
        'createIndex indexName=IDX_COMPONENT_PROVIDER_TYPE, tableName=COMPONENT', '', NULL, '3.5.4', NULL, NULL,
        '8445655339');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description,
                                      comments, tag, liquibase, contexts, labels, deployment_id)
VALUES ('4.7.0-KEYCLOAK-1267', 'sguilhen@redhat.com', 'META-INF/jpa-changelog-4.7.0.xml', '2022-11-14 17:07:39.352957',
        68, 'EXECUTED', '7:c7aa4c8d9573500c2d347c1941ff0301', 'addColumn tableName=REALM', '', NULL, '3.5.4', NULL,
        NULL, '8445655339');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description,
                                      comments, tag, liquibase, contexts, labels, deployment_id)
VALUES ('4.7.0-KEYCLOAK-7275', 'keycloak', 'META-INF/jpa-changelog-4.7.0.xml', '2022-11-14 17:07:39.383886', 69,
        'EXECUTED', '7:b207faee394fc074a442ecd42185a5dd',
        'renameColumn newColumnName=CREATED_ON, oldColumnName=LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION; addNotNullConstraint columnName=CREATED_ON, tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_USER_SESSION; customChange; createIn...',
        '', NULL, '3.5.4', NULL, NULL, '8445655339');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description,
                                      comments, tag, liquibase, contexts, labels, deployment_id)
VALUES ('4.8.0-KEYCLOAK-8835', 'sguilhen@redhat.com', 'META-INF/jpa-changelog-4.8.0.xml', '2022-11-14 17:07:39.390104',
        70, 'EXECUTED', '7:ab9a9762faaba4ddfa35514b212c4922',
        'addNotNullConstraint columnName=SSO_MAX_LIFESPAN_REMEMBER_ME, tableName=REALM; addNotNullConstraint columnName=SSO_IDLE_TIMEOUT_REMEMBER_ME, tableName=REALM',
        '', NULL, '3.5.4', NULL, NULL, '8445655339');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description,
                                      comments, tag, liquibase, contexts, labels, deployment_id)
VALUES ('authz-7.0.0-KEYCLOAK-10443', 'psilva@redhat.com', 'META-INF/jpa-changelog-authz-7.0.0.xml',
        '2022-11-14 17:07:39.394601', 71, 'EXECUTED', '7:b9710f74515a6ccb51b72dc0d19df8c4',
        'addColumn tableName=RESOURCE_SERVER', '', NULL, '3.5.4', NULL, NULL, '8445655339');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description,
                                      comments, tag, liquibase, contexts, labels, deployment_id)
VALUES ('8.0.0-adding-credential-columns', 'keycloak', 'META-INF/jpa-changelog-8.0.0.xml', '2022-11-14 17:07:39.403493',
        72, 'EXECUTED', '7:ec9707ae4d4f0b7452fee20128083879',
        'addColumn tableName=CREDENTIAL; addColumn tableName=FED_USER_CREDENTIAL', '', NULL, '3.5.4', NULL, NULL,
        '8445655339');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description,
                                      comments, tag, liquibase, contexts, labels, deployment_id)
VALUES ('8.0.0-updating-credential-data-not-oracle-fixed', 'keycloak', 'META-INF/jpa-changelog-8.0.0.xml',
        '2022-11-14 17:07:39.411286', 73, 'EXECUTED', '7:3979a0ae07ac465e920ca696532fc736',
        'update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL',
        '', NULL, '3.5.4', NULL, NULL, '8445655339');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description,
                                      comments, tag, liquibase, contexts, labels, deployment_id)
VALUES ('8.0.0-updating-credential-data-oracle-fixed', 'keycloak', 'META-INF/jpa-changelog-8.0.0.xml',
        '2022-11-14 17:07:39.413258', 74, 'MARK_RAN', '7:5abfde4c259119d143bd2fbf49ac2bca',
        'update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL',
        '', NULL, '3.5.4', NULL, NULL, '8445655339');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description,
                                      comments, tag, liquibase, contexts, labels, deployment_id)
VALUES ('8.0.0-credential-cleanup-fixed', 'keycloak', 'META-INF/jpa-changelog-8.0.0.xml', '2022-11-14 17:07:39.443166',
        75, 'EXECUTED', '7:b48da8c11a3d83ddd6b7d0c8c2219345',
        'dropDefaultValue columnName=COUNTER, tableName=CREDENTIAL; dropDefaultValue columnName=DIGITS, tableName=CREDENTIAL; dropDefaultValue columnName=PERIOD, tableName=CREDENTIAL; dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; dropColumn ...',
        '', NULL, '3.5.4', NULL, NULL, '8445655339');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description,
                                      comments, tag, liquibase, contexts, labels, deployment_id)
VALUES ('8.0.0-resource-tag-support', 'keycloak', 'META-INF/jpa-changelog-8.0.0.xml', '2022-11-14 17:07:39.468019', 76,
        'EXECUTED', '7:a73379915c23bfad3e8f5c6d5c0aa4bd',
        'addColumn tableName=MIGRATION_MODEL; createIndex indexName=IDX_UPDATE_TIME, tableName=MIGRATION_MODEL', '',
        NULL, '3.5.4', NULL, NULL, '8445655339');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description,
                                      comments, tag, liquibase, contexts, labels, deployment_id)
VALUES ('9.0.0-always-display-client', 'keycloak', 'META-INF/jpa-changelog-9.0.0.xml', '2022-11-14 17:07:39.476103', 77,
        'EXECUTED', '7:39e0073779aba192646291aa2332493d', 'addColumn tableName=CLIENT', '', NULL, '3.5.4', NULL, NULL,
        '8445655339');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description,
                                      comments, tag, liquibase, contexts, labels, deployment_id)
VALUES ('9.0.0-drop-constraints-for-column-increase', 'keycloak', 'META-INF/jpa-changelog-9.0.0.xml',
        '2022-11-14 17:07:39.478111', 78, 'MARK_RAN', '7:81f87368f00450799b4bf42ea0b3ec34',
        'dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5PMT, tableName=RESOURCE_SERVER_PERM_TICKET; dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER_RESOURCE; dropPrimaryKey constraintName=CONSTRAINT_O...',
        '', NULL, '3.5.4', NULL, NULL, '8445655339');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description,
                                      comments, tag, liquibase, contexts, labels, deployment_id)
VALUES ('9.0.0-increase-column-size-federated-fk', 'keycloak', 'META-INF/jpa-changelog-9.0.0.xml',
        '2022-11-14 17:07:39.508276', 79, 'EXECUTED', '7:20b37422abb9fb6571c618148f013a15',
        'modifyDataType columnName=CLIENT_ID, tableName=FED_USER_CONSENT; modifyDataType columnName=CLIENT_REALM_CONSTRAINT, tableName=KEYCLOAK_ROLE; modifyDataType columnName=OWNER, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=CLIENT_ID, ta...',
        '', NULL, '3.5.4', NULL, NULL, '8445655339');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description,
                                      comments, tag, liquibase, contexts, labels, deployment_id)
VALUES ('9.0.0-recreate-constraints-after-column-increase', 'keycloak', 'META-INF/jpa-changelog-9.0.0.xml',
        '2022-11-14 17:07:39.510691', 80, 'MARK_RAN', '7:1970bb6cfb5ee800736b95ad3fb3c78a',
        'addNotNullConstraint columnName=CLIENT_ID, tableName=OFFLINE_CLIENT_SESSION; addNotNullConstraint columnName=OWNER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNullConstraint columnName=REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNull...',
        '', NULL, '3.5.4', NULL, NULL, '8445655339');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description,
                                      comments, tag, liquibase, contexts, labels, deployment_id)
VALUES ('9.0.1-add-index-to-client.client_id', 'keycloak', 'META-INF/jpa-changelog-9.0.1.xml',
        '2022-11-14 17:07:39.533348', 81, 'EXECUTED', '7:45d9b25fc3b455d522d8dcc10a0f4c80',
        'createIndex indexName=IDX_CLIENT_ID, tableName=CLIENT', '', NULL, '3.5.4', NULL, NULL, '8445655339');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description,
                                      comments, tag, liquibase, contexts, labels, deployment_id)
VALUES ('9.0.1-KEYCLOAK-12579-drop-constraints', 'keycloak', 'META-INF/jpa-changelog-9.0.1.xml',
        '2022-11-14 17:07:39.535799', 82, 'MARK_RAN', '7:890ae73712bc187a66c2813a724d037f',
        'dropUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP', '', NULL, '3.5.4', NULL, NULL,
        '8445655339');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description,
                                      comments, tag, liquibase, contexts, labels, deployment_id)
VALUES ('9.0.1-KEYCLOAK-12579-add-not-null-constraint', 'keycloak', 'META-INF/jpa-changelog-9.0.1.xml',
        '2022-11-14 17:07:39.543427', 83, 'EXECUTED', '7:0a211980d27fafe3ff50d19a3a29b538',
        'addNotNullConstraint columnName=PARENT_GROUP, tableName=KEYCLOAK_GROUP', '', NULL, '3.5.4', NULL, NULL,
        '8445655339');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description,
                                      comments, tag, liquibase, contexts, labels, deployment_id)
VALUES ('9.0.1-KEYCLOAK-12579-recreate-constraints', 'keycloak', 'META-INF/jpa-changelog-9.0.1.xml',
        '2022-11-14 17:07:39.545424', 84, 'MARK_RAN', '7:a161e2ae671a9020fff61e996a207377',
        'addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP', '', NULL, '3.5.4', NULL, NULL,
        '8445655339');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description,
                                      comments, tag, liquibase, contexts, labels, deployment_id)
VALUES ('9.0.1-add-index-to-events', 'keycloak', 'META-INF/jpa-changelog-9.0.1.xml', '2022-11-14 17:07:39.571422', 85,
        'EXECUTED', '7:01c49302201bdf815b0a18d1f98a55dc',
        'createIndex indexName=IDX_EVENT_TIME, tableName=EVENT_ENTITY', '', NULL, '3.5.4', NULL, NULL, '8445655339');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description,
                                      comments, tag, liquibase, contexts, labels, deployment_id)
VALUES ('map-remove-ri', 'keycloak', 'META-INF/jpa-changelog-11.0.0.xml', '2022-11-14 17:07:39.581951', 86, 'EXECUTED',
        '7:3dace6b144c11f53f1ad2c0361279b86',
        'dropForeignKeyConstraint baseTableName=REALM, constraintName=FK_TRAF444KK6QRKMS7N56AIWQ5Y; dropForeignKeyConstraint baseTableName=KEYCLOAK_ROLE, constraintName=FK_KJHO5LE2C0RAL09FL8CM9WFW9',
        '', NULL, '3.5.4', NULL, NULL, '8445655339');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description,
                                      comments, tag, liquibase, contexts, labels, deployment_id)
VALUES ('map-remove-ri', 'keycloak', 'META-INF/jpa-changelog-12.0.0.xml', '2022-11-14 17:07:39.600462', 87, 'EXECUTED',
        '7:578d0b92077eaf2ab95ad0ec087aa903',
        'dropForeignKeyConstraint baseTableName=REALM_DEFAULT_GROUPS, constraintName=FK_DEF_GROUPS_GROUP; dropForeignKeyConstraint baseTableName=REALM_DEFAULT_ROLES, constraintName=FK_H4WPD7W4HSOOLNI3H0SW7BTJE; dropForeignKeyConstraint baseTableName=CLIENT...',
        '', NULL, '3.5.4', NULL, NULL, '8445655339');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description,
                                      comments, tag, liquibase, contexts, labels, deployment_id)
VALUES ('12.1.0-add-realm-localization-table', 'keycloak', 'META-INF/jpa-changelog-12.0.0.xml',
        '2022-11-14 17:07:39.611282', 88, 'EXECUTED', '7:c95abe90d962c57a09ecaee57972835d',
        'createTable tableName=REALM_LOCALIZATIONS; addPrimaryKey tableName=REALM_LOCALIZATIONS', '', NULL, '3.5.4',
        NULL, NULL, '8445655339');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description,
                                      comments, tag, liquibase, contexts, labels, deployment_id)
VALUES ('default-roles', 'keycloak', 'META-INF/jpa-changelog-13.0.0.xml', '2022-11-14 17:07:39.617668', 89, 'EXECUTED',
        '7:f1313bcc2994a5c4dc1062ed6d8282d3', 'addColumn tableName=REALM; customChange', '', NULL, '3.5.4', NULL, NULL,
        '8445655339');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description,
                                      comments, tag, liquibase, contexts, labels, deployment_id)
VALUES ('default-roles-cleanup', 'keycloak', 'META-INF/jpa-changelog-13.0.0.xml', '2022-11-14 17:07:39.635149', 90,
        'EXECUTED', '7:90d763b52eaffebefbcbde55f269508b',
        'dropTable tableName=REALM_DEFAULT_ROLES; dropTable tableName=CLIENT_DEFAULT_ROLES', '', NULL, '3.5.4', NULL,
        NULL, '8445655339');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description,
                                      comments, tag, liquibase, contexts, labels, deployment_id)
VALUES ('13.0.0-KEYCLOAK-16844', 'keycloak', 'META-INF/jpa-changelog-13.0.0.xml', '2022-11-14 17:07:39.655581', 91,
        'EXECUTED', '7:d554f0cb92b764470dccfa5e0014a7dd',
        'createIndex indexName=IDX_OFFLINE_USS_PRELOAD, tableName=OFFLINE_USER_SESSION', '', NULL, '3.5.4', NULL, NULL,
        '8445655339');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description,
                                      comments, tag, liquibase, contexts, labels, deployment_id)
VALUES ('map-remove-ri-13.0.0', 'keycloak', 'META-INF/jpa-changelog-13.0.0.xml', '2022-11-14 17:07:39.657411', 92,
        'EXECUTED', '7:73193e3ab3c35cf0f37ccea3bf783764',
        'dropForeignKeyConstraint baseTableName=DEFAULT_CLIENT_SCOPE, constraintName=FK_R_DEF_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SCOPE_CLIENT, constraintName=FK_C_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SC...',
        '', NULL, '3.5.4', NULL, NULL, '8445655339');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description,
                                      comments, tag, liquibase, contexts, labels, deployment_id)
VALUES ('13.0.0-KEYCLOAK-17992-drop-constraints', 'keycloak', 'META-INF/jpa-changelog-13.0.0.xml',
        '2022-11-14 17:07:39.659379', 93, 'MARK_RAN', '7:90a1e74f92e9cbaa0c5eab80b8a037f3',
        'dropPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CLSCOPE_CL, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CL_CLSCOPE, tableName=CLIENT_SCOPE_CLIENT',
        '', NULL, '3.5.4', NULL, NULL, '8445655339');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description,
                                      comments, tag, liquibase, contexts, labels, deployment_id)
VALUES ('13.0.0-increase-column-size-federated', 'keycloak', 'META-INF/jpa-changelog-13.0.0.xml',
        '2022-11-14 17:07:39.674223', 94, 'EXECUTED', '7:5b9248f29cd047c200083cc6d8388b16',
        'modifyDataType columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; modifyDataType columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT',
        '', NULL, '3.5.4', NULL, NULL, '8445655339');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description,
                                      comments, tag, liquibase, contexts, labels, deployment_id)
VALUES ('13.0.0-KEYCLOAK-17992-recreate-constraints', 'keycloak', 'META-INF/jpa-changelog-13.0.0.xml',
        '2022-11-14 17:07:39.676287', 95, 'MARK_RAN', '7:64db59e44c374f13955489e8990d17a1',
        'addNotNullConstraint columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; addNotNullConstraint columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT; addPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; createIndex indexName=...',
        '', NULL, '3.5.4', NULL, NULL, '8445655339');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description,
                                      comments, tag, liquibase, contexts, labels, deployment_id)
VALUES ('json-string-accomodation-fixed', 'keycloak', 'META-INF/jpa-changelog-13.0.0.xml', '2022-11-14 17:07:39.681413',
        96, 'EXECUTED', '7:329a578cdb43262fff975f0a7f6cda60',
        'addColumn tableName=REALM_ATTRIBUTE; update tableName=REALM_ATTRIBUTE; dropColumn columnName=VALUE, tableName=REALM_ATTRIBUTE; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=REALM_ATTRIBUTE',
        '', NULL, '3.5.4', NULL, NULL, '8445655339');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description,
                                      comments, tag, liquibase, contexts, labels, deployment_id)
VALUES ('14.0.0-KEYCLOAK-11019', 'keycloak', 'META-INF/jpa-changelog-14.0.0.xml', '2022-11-14 17:07:39.736662', 97,
        'EXECUTED', '7:fae0de241ac0fd0bbc2b380b85e4f567',
        'createIndex indexName=IDX_OFFLINE_CSS_PRELOAD, tableName=OFFLINE_CLIENT_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USER, tableName=OFFLINE_USER_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USERSESS, tableName=OFFLINE_USER_SESSION',
        '', NULL, '3.5.4', NULL, NULL, '8445655339');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description,
                                      comments, tag, liquibase, contexts, labels, deployment_id)
VALUES ('14.0.0-KEYCLOAK-18286', 'keycloak', 'META-INF/jpa-changelog-14.0.0.xml', '2022-11-14 17:07:39.738956', 98,
        'MARK_RAN', '7:075d54e9180f49bb0c64ca4218936e81',
        'createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES', '', NULL, '3.5.4', NULL,
        NULL, '8445655339');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description,
                                      comments, tag, liquibase, contexts, labels, deployment_id)
VALUES ('14.0.0-KEYCLOAK-18286-revert', 'keycloak', 'META-INF/jpa-changelog-14.0.0.xml', '2022-11-14 17:07:39.759872',
        99, 'MARK_RAN', '7:06499836520f4f6b3d05e35a59324910',
        'dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES', '', NULL, '3.5.4', NULL, NULL,
        '8445655339');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description,
                                      comments, tag, liquibase, contexts, labels, deployment_id)
VALUES ('14.0.0-KEYCLOAK-18286-supported-dbs', 'keycloak', 'META-INF/jpa-changelog-14.0.0.xml',
        '2022-11-14 17:07:39.792971', 100, 'EXECUTED', '7:fad08e83c77d0171ec166bc9bc5d390a',
        'createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES', '', NULL, '3.5.4', NULL,
        NULL, '8445655339');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description,
                                      comments, tag, liquibase, contexts, labels, deployment_id)
VALUES ('14.0.0-KEYCLOAK-18286-unsupported-dbs', 'keycloak', 'META-INF/jpa-changelog-14.0.0.xml',
        '2022-11-14 17:07:39.795524', 101, 'MARK_RAN', '7:3d2b23076e59c6f70bae703aa01be35b',
        'createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES', '', NULL, '3.5.4', NULL,
        NULL, '8445655339');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description,
                                      comments, tag, liquibase, contexts, labels, deployment_id)
VALUES ('KEYCLOAK-17267-add-index-to-user-attributes', 'keycloak', 'META-INF/jpa-changelog-14.0.0.xml',
        '2022-11-14 17:07:39.81807', 102, 'EXECUTED', '7:1a7f28ff8d9e53aeb879d76ea3d9341a',
        'createIndex indexName=IDX_USER_ATTRIBUTE_NAME, tableName=USER_ATTRIBUTE', '', NULL, '3.5.4', NULL, NULL,
        '8445655339');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description,
                                      comments, tag, liquibase, contexts, labels, deployment_id)
VALUES ('KEYCLOAK-18146-add-saml-art-binding-identifier', 'keycloak', 'META-INF/jpa-changelog-14.0.0.xml',
        '2022-11-14 17:07:39.823322', 103, 'EXECUTED', '7:2fd554456fed4a82c698c555c5b751b6', 'customChange', '', NULL,
        '3.5.4', NULL, NULL, '8445655339');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description,
                                      comments, tag, liquibase, contexts, labels, deployment_id)
VALUES ('15.0.0-KEYCLOAK-18467', 'keycloak', 'META-INF/jpa-changelog-15.0.0.xml', '2022-11-14 17:07:39.829994', 104,
        'EXECUTED', '7:b06356d66c2790ecc2ae54ba0458397a',
        'addColumn tableName=REALM_LOCALIZATIONS; update tableName=REALM_LOCALIZATIONS; dropColumn columnName=TEXTS, tableName=REALM_LOCALIZATIONS; renameColumn newColumnName=TEXTS, oldColumnName=TEXTS_NEW, tableName=REALM_LOCALIZATIONS; addNotNullConstrai...',
        '', NULL, '3.5.4', NULL, NULL, '8445655339');


--
-- TOC entry 4120 (class 0 OID 16385)
-- Dependencies: 209
-- Data for Name: databasechangeloglock; Type: TABLE DATA; Schema: public; Owner: magnittest
--

INSERT INTO public.databasechangeloglock (id, locked, lockgranted, lockedby)
VALUES (1, false, NULL, NULL);
INSERT INTO public.databasechangeloglock (id, locked, lockgranted, lockedby)
VALUES (1000, false, NULL, NULL);
INSERT INTO public.databasechangeloglock (id, locked, lockgranted, lockedby)
VALUES (1001, false, NULL, NULL);


--
-- TOC entry 4204 (class 0 OID 17783)
-- Dependencies: 293
-- Data for Name: default_client_scope; Type: TABLE DATA; Schema: public; Owner: magnittest
--

INSERT INTO public.default_client_scope (realm_id, scope_id, default_scope)
VALUES ('master', '9b385db8-f556-4b35-9038-78724b8322d1', false);
INSERT INTO public.default_client_scope (realm_id, scope_id, default_scope)
VALUES ('master', '1fa570c4-f1de-4e65-bf32-d49596205e4a', true);
INSERT INTO public.default_client_scope (realm_id, scope_id, default_scope)
VALUES ('master', '08246169-7f99-4a9e-8afb-f90ef919e38a', true);
INSERT INTO public.default_client_scope (realm_id, scope_id, default_scope)
VALUES ('master', 'd283e024-290a-46eb-9b41-b89571e1b2c5', true);
INSERT INTO public.default_client_scope (realm_id, scope_id, default_scope)
VALUES ('master', '9c58a12c-0612-425b-9eb9-4a8d9128cd70', false);
INSERT INTO public.default_client_scope (realm_id, scope_id, default_scope)
VALUES ('master', 'dd115e44-65f9-4ecf-924a-365893e6cbe1', false);
INSERT INTO public.default_client_scope (realm_id, scope_id, default_scope)
VALUES ('master', 'caa60bb2-6e7b-4269-99e1-df55a6373056', true);
INSERT INTO public.default_client_scope (realm_id, scope_id, default_scope)
VALUES ('master', 'a9ecffd4-d0d9-4825-8677-9bdd22901fe1', true);
INSERT INTO public.default_client_scope (realm_id, scope_id, default_scope)
VALUES ('master', '844f4726-cd45-4e06-88ff-92a3b1d8a089', false);
INSERT INTO public.default_client_scope (realm_id, scope_id, default_scope)
VALUES ('CoreRealm', 'c61fabbf-a68b-49ef-a23f-29d674e422f4', true);
INSERT INTO public.default_client_scope (realm_id, scope_id, default_scope)
VALUES ('CoreRealm', '421c8df6-09e7-49b0-b3dd-8c8aece0c497', true);
INSERT INTO public.default_client_scope (realm_id, scope_id, default_scope)
VALUES ('CoreRealm', 'b0ab1a7f-8bfa-4c0b-bd55-6335b3826530', true);
INSERT INTO public.default_client_scope (realm_id, scope_id, default_scope)
VALUES ('CoreRealm', 'eb4adf8e-d668-4a1c-beba-2d6ce867a1a1', true);
INSERT INTO public.default_client_scope (realm_id, scope_id, default_scope)
VALUES ('CoreRealm', 'bcfd119a-b7be-4959-b4f5-636890cd051b', true);
INSERT INTO public.default_client_scope (realm_id, scope_id, default_scope)
VALUES ('CoreRealm', 'a31d7ccc-a026-4491-afd0-c9eee180b464', false);
INSERT INTO public.default_client_scope (realm_id, scope_id, default_scope)
VALUES ('CoreRealm', 'fed16ddf-f8c8-48dc-95ab-12200d026faf', false);
INSERT INTO public.default_client_scope (realm_id, scope_id, default_scope)
VALUES ('CoreRealm', '233807dd-cd6a-4dff-90ef-60594f541bc5', false);
INSERT INTO public.default_client_scope (realm_id, scope_id, default_scope)
VALUES ('CoreRealm', 'dad43592-70d2-4ebd-ae1a-1a2d7b21db12', false);


--
-- TOC entry 4127 (class 0 OID 16425)
-- Dependencies: 216
-- Data for Name: event_entity; Type: TABLE DATA; Schema: public; Owner: magnittest
--


--
-- TOC entry 4192 (class 0 OID 17482)
-- Dependencies: 281
-- Data for Name: fed_user_attribute; Type: TABLE DATA; Schema: public; Owner: magnittest
--


--
-- TOC entry 4193 (class 0 OID 17487)
-- Dependencies: 282
-- Data for Name: fed_user_consent; Type: TABLE DATA; Schema: public; Owner: magnittest
--


--
-- TOC entry 4206 (class 0 OID 17809)
-- Dependencies: 295
-- Data for Name: fed_user_consent_cl_scope; Type: TABLE DATA; Schema: public; Owner: magnittest
--


--
-- TOC entry 4194 (class 0 OID 17496)
-- Dependencies: 283
-- Data for Name: fed_user_credential; Type: TABLE DATA; Schema: public; Owner: magnittest
--


--
-- TOC entry 4195 (class 0 OID 17505)
-- Dependencies: 284
-- Data for Name: fed_user_group_membership; Type: TABLE DATA; Schema: public; Owner: magnittest
--


--
-- TOC entry 4196 (class 0 OID 17508)
-- Dependencies: 285
-- Data for Name: fed_user_required_action; Type: TABLE DATA; Schema: public; Owner: magnittest
--


--
-- TOC entry 4197 (class 0 OID 17514)
-- Dependencies: 286
-- Data for Name: fed_user_role_mapping; Type: TABLE DATA; Schema: public; Owner: magnittest
--


--
-- TOC entry 4150 (class 0 OID 16802)
-- Dependencies: 239
-- Data for Name: federated_identity; Type: TABLE DATA; Schema: public; Owner: magnittest
--


--
-- TOC entry 4200 (class 0 OID 17579)
-- Dependencies: 289
-- Data for Name: federated_user; Type: TABLE DATA; Schema: public; Owner: magnittest
--


--
-- TOC entry 4176 (class 0 OID 17204)
-- Dependencies: 265
-- Data for Name: group_attribute; Type: TABLE DATA; Schema: public; Owner: magnittest
--


--
-- TOC entry 4175 (class 0 OID 17201)
-- Dependencies: 264
-- Data for Name: group_role_mapping; Type: TABLE DATA; Schema: public; Owner: magnittest
--


--
-- TOC entry 4151 (class 0 OID 16807)
-- Dependencies: 240
-- Data for Name: identity_provider; Type: TABLE DATA; Schema: public; Owner: magnittest
--


--
-- TOC entry 4152 (class 0 OID 16816)
-- Dependencies: 241
-- Data for Name: identity_provider_config; Type: TABLE DATA; Schema: public; Owner: magnittest
--


--
-- TOC entry 4157 (class 0 OID 16920)
-- Dependencies: 246
-- Data for Name: identity_provider_mapper; Type: TABLE DATA; Schema: public; Owner: magnittest
--


--
-- TOC entry 4158 (class 0 OID 16925)
-- Dependencies: 247
-- Data for Name: idp_mapper_config; Type: TABLE DATA; Schema: public; Owner: magnittest
--


--
-- TOC entry 4174 (class 0 OID 17198)
-- Dependencies: 263
-- Data for Name: keycloak_group; Type: TABLE DATA; Schema: public; Owner: magnittest
--


--
-- TOC entry 4128 (class 0 OID 16433)
-- Dependencies: 217
-- Data for Name: keycloak_role; Type: TABLE DATA; Schema: public; Owner: magnittest
--

INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm)
VALUES ('ab1dabb5-455d-47b5-b81d-8d362e0b3b9e', 'master', false, '${role_default-roles}', 'default-roles-master',
        'master', NULL, NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm)
VALUES ('f1eb6095-6dc4-4444-a63b-c9928027039f', 'master', false, '${role_admin}', 'admin', 'master', NULL, NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm)
VALUES ('6b31dd8a-d4e0-45b8-83f1-1a2aecb35af0', 'master', false, '${role_create-realm}', 'create-realm', 'master', NULL,
        NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm)
VALUES ('34d2b4f2-fc96-44c8-a222-f83a267c4408', '3ee8f127-eb12-47e6-b244-12c2032aa970', true, '${role_create-client}',
        'create-client', 'master', '3ee8f127-eb12-47e6-b244-12c2032aa970', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm)
VALUES ('954d7f64-f2ce-4071-b858-cf077db277f0', '3ee8f127-eb12-47e6-b244-12c2032aa970', true, '${role_view-realm}',
        'view-realm', 'master', '3ee8f127-eb12-47e6-b244-12c2032aa970', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm)
VALUES ('27ea7307-c3ed-471b-a463-7f47c8012dfc', '3ee8f127-eb12-47e6-b244-12c2032aa970', true, '${role_view-users}',
        'view-users', 'master', '3ee8f127-eb12-47e6-b244-12c2032aa970', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm)
VALUES ('f2a7cb05-6bdf-459c-9138-4645d68cc1e1', '3ee8f127-eb12-47e6-b244-12c2032aa970', true, '${role_view-clients}',
        'view-clients', 'master', '3ee8f127-eb12-47e6-b244-12c2032aa970', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm)
VALUES ('43141a33-c0ca-4425-ac6d-ae597b1ff66c', '3ee8f127-eb12-47e6-b244-12c2032aa970', true, '${role_view-events}',
        'view-events', 'master', '3ee8f127-eb12-47e6-b244-12c2032aa970', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm)
VALUES ('a2204c23-47db-49f1-873b-3d1f0a4f2aa2', '3ee8f127-eb12-47e6-b244-12c2032aa970', true,
        '${role_view-identity-providers}', 'view-identity-providers', 'master', '3ee8f127-eb12-47e6-b244-12c2032aa970',
        NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm)
VALUES ('ef293e8a-11fd-4908-a9e0-672368084f5c', '3ee8f127-eb12-47e6-b244-12c2032aa970', true,
        '${role_view-authorization}', 'view-authorization', 'master', '3ee8f127-eb12-47e6-b244-12c2032aa970', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm)
VALUES ('40d9dafd-22c7-4d2f-a708-7d874cdf8d21', '3ee8f127-eb12-47e6-b244-12c2032aa970', true, '${role_manage-realm}',
        'manage-realm', 'master', '3ee8f127-eb12-47e6-b244-12c2032aa970', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm)
VALUES ('81a7c1d6-495b-4799-96cb-f590a9a0a937', '3ee8f127-eb12-47e6-b244-12c2032aa970', true, '${role_manage-users}',
        'manage-users', 'master', '3ee8f127-eb12-47e6-b244-12c2032aa970', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm)
VALUES ('8e2a5553-4b90-41cc-b3bc-45cbc2bfe5be', '3ee8f127-eb12-47e6-b244-12c2032aa970', true, '${role_manage-clients}',
        'manage-clients', 'master', '3ee8f127-eb12-47e6-b244-12c2032aa970', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm)
VALUES ('0983d33e-8b91-47b5-bb7f-8e4d6e5eca6c', '3ee8f127-eb12-47e6-b244-12c2032aa970', true, '${role_manage-events}',
        'manage-events', 'master', '3ee8f127-eb12-47e6-b244-12c2032aa970', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm)
VALUES ('a6923314-301b-466f-a1b4-6b83bff6e83c', '3ee8f127-eb12-47e6-b244-12c2032aa970', true,
        '${role_manage-identity-providers}', 'manage-identity-providers', 'master',
        '3ee8f127-eb12-47e6-b244-12c2032aa970', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm)
VALUES ('0dc1da81-b749-41c8-97f2-0fb91d3c2556', '3ee8f127-eb12-47e6-b244-12c2032aa970', true,
        '${role_manage-authorization}', 'manage-authorization', 'master', '3ee8f127-eb12-47e6-b244-12c2032aa970', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm)
VALUES ('e8d8d57b-60b9-4ae0-a03b-f7c0a2306965', '3ee8f127-eb12-47e6-b244-12c2032aa970', true, '${role_query-users}',
        'query-users', 'master', '3ee8f127-eb12-47e6-b244-12c2032aa970', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm)
VALUES ('4b91d721-69b6-4c8c-a820-ea795ee4cf23', '3ee8f127-eb12-47e6-b244-12c2032aa970', true, '${role_query-clients}',
        'query-clients', 'master', '3ee8f127-eb12-47e6-b244-12c2032aa970', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm)
VALUES ('43c27842-9eab-46d0-bd95-f0426c5b132c', '3ee8f127-eb12-47e6-b244-12c2032aa970', true, '${role_query-realms}',
        'query-realms', 'master', '3ee8f127-eb12-47e6-b244-12c2032aa970', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm)
VALUES ('182c87a2-c36b-4444-bdf8-55868dc3a913', '3ee8f127-eb12-47e6-b244-12c2032aa970', true, '${role_query-groups}',
        'query-groups', 'master', '3ee8f127-eb12-47e6-b244-12c2032aa970', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm)
VALUES ('ef2360f5-43bc-4cbd-ac1e-8c124c41e954', '84a8181d-8ab4-443c-b8d0-795a8ad439a3', true, '${role_view-profile}',
        'view-profile', 'master', '84a8181d-8ab4-443c-b8d0-795a8ad439a3', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm)
VALUES ('10c12e84-8747-48ea-9188-7d86b7a113d2', '84a8181d-8ab4-443c-b8d0-795a8ad439a3', true, '${role_manage-account}',
        'manage-account', 'master', '84a8181d-8ab4-443c-b8d0-795a8ad439a3', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm)
VALUES ('d66bab76-c38c-4f61-bce9-d754710da4da', '84a8181d-8ab4-443c-b8d0-795a8ad439a3', true,
        '${role_manage-account-links}', 'manage-account-links', 'master', '84a8181d-8ab4-443c-b8d0-795a8ad439a3', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm)
VALUES ('56169877-aa6f-4654-9da1-40b661d81935', 'e97410ff-be3b-4e9f-8e62-2b5f20f72c44', true, '${role_view-events}',
        'view-events', 'master', 'e97410ff-be3b-4e9f-8e62-2b5f20f72c44', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm)
VALUES ('ce1af2e4-d13f-444e-9799-032d5dded6a7', 'master', false, '${role_offline-access}', 'offline_access', 'master',
        NULL, NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm)
VALUES ('c1f752c6-352e-4778-a241-fb9d5e587b3d', 'master', false, '${role_uma_authorization}', 'uma_authorization',
        'master', NULL, NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm)
VALUES ('53553f66-f699-49c9-9cdc-a05e244b4ea3', 'master', false, '${role_default-roles}', 'default-roles-corerealm',
        'master', NULL, NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm)
VALUES ('5e811292-e413-418b-afe2-e1cb5f138927', 'CoreRealm', false, '${role_default-roles}', 'default-roles-corerealm',
        'CoreRealm', NULL, NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm)
VALUES ('cceb50bf-7a95-4f62-a7b0-c1c9c8e5303d', 'e97410ff-be3b-4e9f-8e62-2b5f20f72c44', true, '${role_create-client}',
        'create-client', 'master', 'e97410ff-be3b-4e9f-8e62-2b5f20f72c44', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm)
VALUES ('43d6c6d3-4c8e-40a7-9303-5be1b6da71cf', 'e97410ff-be3b-4e9f-8e62-2b5f20f72c44', true, '${role_view-realm}',
        'view-realm', 'master', 'e97410ff-be3b-4e9f-8e62-2b5f20f72c44', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm)
VALUES ('6cdb4509-79bb-47f0-a346-787f1e548cd0', 'e97410ff-be3b-4e9f-8e62-2b5f20f72c44', true, '${role_view-users}',
        'view-users', 'master', 'e97410ff-be3b-4e9f-8e62-2b5f20f72c44', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm)
VALUES ('738d8084-2171-499e-b834-4cbce66848c7', 'e97410ff-be3b-4e9f-8e62-2b5f20f72c44', true, '${role_view-clients}',
        'view-clients', 'master', 'e97410ff-be3b-4e9f-8e62-2b5f20f72c44', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm)
VALUES ('2a93d51f-b1ee-4e78-b0ef-4397d5bd4831', 'e97410ff-be3b-4e9f-8e62-2b5f20f72c44', true,
        '${role_view-identity-providers}', 'view-identity-providers', 'master', 'e97410ff-be3b-4e9f-8e62-2b5f20f72c44',
        NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm)
VALUES ('f7cfe921-4d01-4524-aa12-f76d9d33d83b', 'e97410ff-be3b-4e9f-8e62-2b5f20f72c44', true,
        '${role_view-authorization}', 'view-authorization', 'master', 'e97410ff-be3b-4e9f-8e62-2b5f20f72c44', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm)
VALUES ('48bb5c6e-53fc-4c05-8f55-a6cfb66a7af1', 'e97410ff-be3b-4e9f-8e62-2b5f20f72c44', true, '${role_manage-realm}',
        'manage-realm', 'master', 'e97410ff-be3b-4e9f-8e62-2b5f20f72c44', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm)
VALUES ('fa6c51c1-336f-4669-a8e8-18247e547666', '84a8181d-8ab4-443c-b8d0-795a8ad439a3', true,
        '${role_view-applications}', 'view-applications', 'master', '84a8181d-8ab4-443c-b8d0-795a8ad439a3', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm)
VALUES ('01844eba-e58c-4ca2-ac72-a6b20ef375be', '84a8181d-8ab4-443c-b8d0-795a8ad439a3', true, '${role_view-consent}',
        'view-consent', 'master', '84a8181d-8ab4-443c-b8d0-795a8ad439a3', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm)
VALUES ('18ffe376-5993-4e6d-9a7c-383370770a82', '84a8181d-8ab4-443c-b8d0-795a8ad439a3', true, '${role_manage-consent}',
        'manage-consent', 'master', '84a8181d-8ab4-443c-b8d0-795a8ad439a3', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm)
VALUES ('b0452315-22a8-4dc3-a280-453e3d8fcc4f', '84a8181d-8ab4-443c-b8d0-795a8ad439a3', true, '${role_delete-account}',
        'delete-account', 'master', '84a8181d-8ab4-443c-b8d0-795a8ad439a3', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm)
VALUES ('be2de146-7555-4460-af92-c1552c953979', '8504b483-2893-442f-be1c-cda746f649cb', true, '${role_read-token}',
        'read-token', 'master', '8504b483-2893-442f-be1c-cda746f649cb', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm)
VALUES ('7ad13b38-29ae-40ed-820a-682b28c2ef13', '3ee8f127-eb12-47e6-b244-12c2032aa970', true, '${role_impersonation}',
        'impersonation', 'master', '3ee8f127-eb12-47e6-b244-12c2032aa970', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm)
VALUES ('4baa610b-0454-4706-91ae-d7f5214b9728', 'f0c04cb9-541a-4192-ae8d-1c406fb61794', true, NULL, 'test', 'master',
        'f0c04cb9-541a-4192-ae8d-1c406fb61794', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm)
VALUES ('fa65bc50-7077-4a1b-8327-ff1120969885', 'f0c04cb9-541a-4192-ae8d-1c406fb61794', true, NULL, 'uma_protection',
        'master', 'f0c04cb9-541a-4192-ae8d-1c406fb61794', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm)
VALUES ('eb0afb9d-d4f6-452a-aaaa-8445ac537577', 'e97410ff-be3b-4e9f-8e62-2b5f20f72c44', true, '${role_manage-users}',
        'manage-users', 'master', 'e97410ff-be3b-4e9f-8e62-2b5f20f72c44', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm)
VALUES ('a41677e0-7d00-4194-afe2-5493899ea10e', 'e97410ff-be3b-4e9f-8e62-2b5f20f72c44', true, '${role_manage-clients}',
        'manage-clients', 'master', 'e97410ff-be3b-4e9f-8e62-2b5f20f72c44', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm)
VALUES ('bb17a882-ed42-4bd5-af28-3555faeabf3f', 'e97410ff-be3b-4e9f-8e62-2b5f20f72c44', true, '${role_manage-events}',
        'manage-events', 'master', 'e97410ff-be3b-4e9f-8e62-2b5f20f72c44', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm)
VALUES ('a35cf9ed-c5ca-491f-b67e-17a094395669', 'e97410ff-be3b-4e9f-8e62-2b5f20f72c44', true,
        '${role_manage-identity-providers}', 'manage-identity-providers', 'master',
        'e97410ff-be3b-4e9f-8e62-2b5f20f72c44', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm)
VALUES ('54bbb7f2-14b8-41fd-b39e-7dc1e069b238', '33c55894-c8a9-4ba4-8f91-64ed6c71eb26', true,
        '${role_view-identity-providers}', 'view-identity-providers', 'CoreRealm',
        '33c55894-c8a9-4ba4-8f91-64ed6c71eb26', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm)
VALUES ('c6e9cd32-3009-43b2-b583-fdf3fd38f3f1', '33c55894-c8a9-4ba4-8f91-64ed6c71eb26', true, '${role_view-users}',
        'view-users', 'CoreRealm', '33c55894-c8a9-4ba4-8f91-64ed6c71eb26', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm)
VALUES ('e57de952-2d90-4964-8afd-0b9182d1093c', 'e97410ff-be3b-4e9f-8e62-2b5f20f72c44', true,
        '${role_manage-authorization}', 'manage-authorization', 'master', 'e97410ff-be3b-4e9f-8e62-2b5f20f72c44', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm)
VALUES ('d4c9a670-4f68-484b-8707-0178885e279c', 'e97410ff-be3b-4e9f-8e62-2b5f20f72c44', true, '${role_query-users}',
        'query-users', 'master', 'e97410ff-be3b-4e9f-8e62-2b5f20f72c44', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm)
VALUES ('12bc3d7e-8504-42b2-ae1d-361223755050', 'e97410ff-be3b-4e9f-8e62-2b5f20f72c44', true, '${role_query-clients}',
        'query-clients', 'master', 'e97410ff-be3b-4e9f-8e62-2b5f20f72c44', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm)
VALUES ('9171cdd1-4414-4c04-b961-b4bc4551a300', 'e97410ff-be3b-4e9f-8e62-2b5f20f72c44', true, '${role_query-realms}',
        'query-realms', 'master', 'e97410ff-be3b-4e9f-8e62-2b5f20f72c44', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm)
VALUES ('e990e2bb-2a1e-406e-895b-9350ef0a53b0', 'e97410ff-be3b-4e9f-8e62-2b5f20f72c44', true, '${role_query-groups}',
        'query-groups', 'master', 'e97410ff-be3b-4e9f-8e62-2b5f20f72c44', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm)
VALUES ('5a8c0f4f-35db-4c9e-b4d0-584919a41a97', 'CoreRealm', false, '${role_offline-access}', 'offline_access',
        'CoreRealm', NULL, NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm)
VALUES ('324d5776-0c26-43c1-9cc2-af5f2a649827', 'CoreRealm', false, '${role_uma_authorization}', 'uma_authorization',
        'CoreRealm', NULL, NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm)
VALUES ('7f21fc89-702c-4c05-adbc-d807c92babd1', '33c55894-c8a9-4ba4-8f91-64ed6c71eb26', true,
        '${role_view-authorization}', 'view-authorization', 'CoreRealm', '33c55894-c8a9-4ba4-8f91-64ed6c71eb26', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm)
VALUES ('791477ac-4220-4ede-8842-e73e081217a6', '33c55894-c8a9-4ba4-8f91-64ed6c71eb26', true, '${role_manage-clients}',
        'manage-clients', 'CoreRealm', '33c55894-c8a9-4ba4-8f91-64ed6c71eb26', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm)
VALUES ('b9556269-f9c5-4080-afe9-18e3039062bd', '33c55894-c8a9-4ba4-8f91-64ed6c71eb26', true, '${role_realm-admin}',
        'realm-admin', 'CoreRealm', '33c55894-c8a9-4ba4-8f91-64ed6c71eb26', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm)
VALUES ('9e08acc7-8693-429f-905a-89a4b11d3554', '33c55894-c8a9-4ba4-8f91-64ed6c71eb26', true,
        '${role_manage-authorization}', 'manage-authorization', 'CoreRealm', '33c55894-c8a9-4ba4-8f91-64ed6c71eb26',
        NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm)
VALUES ('7c1828e8-bb82-4b0e-9c51-2a3e71bd4343', '33c55894-c8a9-4ba4-8f91-64ed6c71eb26', true, '${role_impersonation}',
        'impersonation', 'CoreRealm', '33c55894-c8a9-4ba4-8f91-64ed6c71eb26', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm)
VALUES ('ba079b01-69a2-4913-9d46-f90f4a764e57', '33c55894-c8a9-4ba4-8f91-64ed6c71eb26', true, '${role_create-client}',
        'create-client', 'CoreRealm', '33c55894-c8a9-4ba4-8f91-64ed6c71eb26', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm)
VALUES ('d1cb519a-e104-482e-b9ac-e5fc26a7aa0d', '33c55894-c8a9-4ba4-8f91-64ed6c71eb26', true, '${role_view-realm}',
        'view-realm', 'CoreRealm', '33c55894-c8a9-4ba4-8f91-64ed6c71eb26', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm)
VALUES ('4a8d1d9a-63d5-4a81-b513-53830f1cbddf', '33c55894-c8a9-4ba4-8f91-64ed6c71eb26', true, '${role_manage-users}',
        'manage-users', 'CoreRealm', '33c55894-c8a9-4ba4-8f91-64ed6c71eb26', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm)
VALUES ('ef098e23-87c3-4427-8d7d-c01628440726', '33c55894-c8a9-4ba4-8f91-64ed6c71eb26', true, '${role_query-realms}',
        'query-realms', 'CoreRealm', '33c55894-c8a9-4ba4-8f91-64ed6c71eb26', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm)
VALUES ('48b0a951-e63e-4030-a9be-f025e7a1e08d', '33c55894-c8a9-4ba4-8f91-64ed6c71eb26', true, '${role_view-events}',
        'view-events', 'CoreRealm', '33c55894-c8a9-4ba4-8f91-64ed6c71eb26', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm)
VALUES ('19782f6c-1893-4764-b32c-1eadd6a7e723', '33c55894-c8a9-4ba4-8f91-64ed6c71eb26', true,
        '${role_manage-identity-providers}', 'manage-identity-providers', 'CoreRealm',
        '33c55894-c8a9-4ba4-8f91-64ed6c71eb26', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm)
VALUES ('69961c51-7353-40ef-88b7-7b5325f44ac0', '33c55894-c8a9-4ba4-8f91-64ed6c71eb26', true, '${role_query-clients}',
        'query-clients', 'CoreRealm', '33c55894-c8a9-4ba4-8f91-64ed6c71eb26', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm)
VALUES ('d12a4e65-6c6c-434a-b977-827d69827b42', '33c55894-c8a9-4ba4-8f91-64ed6c71eb26', true, '${role_view-clients}',
        'view-clients', 'CoreRealm', '33c55894-c8a9-4ba4-8f91-64ed6c71eb26', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm)
VALUES ('a2fdb01c-66bc-440a-a1a2-6b5cf2a5b251', '33c55894-c8a9-4ba4-8f91-64ed6c71eb26', true, '${role_manage-realm}',
        'manage-realm', 'CoreRealm', '33c55894-c8a9-4ba4-8f91-64ed6c71eb26', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm)
VALUES ('fb7cff01-b049-4453-9329-da6e6bcdc526', '33c55894-c8a9-4ba4-8f91-64ed6c71eb26', true, '${role_manage-events}',
        'manage-events', 'CoreRealm', '33c55894-c8a9-4ba4-8f91-64ed6c71eb26', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm)
VALUES ('fd0f6c3c-e7d1-4cc3-9e64-8726c2565a88', '33c55894-c8a9-4ba4-8f91-64ed6c71eb26', true, '${role_query-users}',
        'query-users', 'CoreRealm', '33c55894-c8a9-4ba4-8f91-64ed6c71eb26', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm)
VALUES ('55b493a1-e1ee-4c52-89ae-7ebb1ddd8466', '33c55894-c8a9-4ba4-8f91-64ed6c71eb26', true, '${role_query-groups}',
        'query-groups', 'CoreRealm', '33c55894-c8a9-4ba4-8f91-64ed6c71eb26', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm)
VALUES ('92abe6f2-51b0-4250-b237-c1cabf1edff7', 'bb705eb6-2a29-4aa0-a7b6-8c4dc1579246', true, '${role_read-token}',
        'read-token', 'CoreRealm', 'bb705eb6-2a29-4aa0-a7b6-8c4dc1579246', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm)
VALUES ('942b16d4-2bbe-4620-9b88-bedb7f7c3dd8', 'a9b58495-213e-4c37-9d10-548a76bdf8dc', true, '${role_manage-account}',
        'manage-account', 'CoreRealm', 'a9b58495-213e-4c37-9d10-548a76bdf8dc', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm)
VALUES ('81fd92c6-7548-4d81-9da1-453adf06b660', 'a9b58495-213e-4c37-9d10-548a76bdf8dc', true, '${role_view-consent}',
        'view-consent', 'CoreRealm', 'a9b58495-213e-4c37-9d10-548a76bdf8dc', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm)
VALUES ('dfb82b5b-a335-47ff-b4ad-7fbc247da96d', 'a9b58495-213e-4c37-9d10-548a76bdf8dc', true,
        '${role_view-applications}', 'view-applications', 'CoreRealm', 'a9b58495-213e-4c37-9d10-548a76bdf8dc', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm)
VALUES ('470e3aed-b591-4bfd-b5cd-77598c346f6c', 'a9b58495-213e-4c37-9d10-548a76bdf8dc', true,
        '${role_manage-account-links}', 'manage-account-links', 'CoreRealm', 'a9b58495-213e-4c37-9d10-548a76bdf8dc',
        NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm)
VALUES ('05127c90-e872-47fd-afeb-1b79e8a86072', 'a9b58495-213e-4c37-9d10-548a76bdf8dc', true, '${role_view-profile}',
        'view-profile', 'CoreRealm', 'a9b58495-213e-4c37-9d10-548a76bdf8dc', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm)
VALUES ('9a1ac92d-1058-47dc-a531-ce42047a9a0c', 'a9b58495-213e-4c37-9d10-548a76bdf8dc', true, '${role_delete-account}',
        'delete-account', 'CoreRealm', 'a9b58495-213e-4c37-9d10-548a76bdf8dc', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm)
VALUES ('ea55e0b8-943e-46dc-861b-ee0ddc6c4691', 'a9b58495-213e-4c37-9d10-548a76bdf8dc', true, '${role_manage-consent}',
        'manage-consent', 'CoreRealm', 'a9b58495-213e-4c37-9d10-548a76bdf8dc', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm)
VALUES ('14bca42e-c648-44b5-8101-8f643b629fa0', 'e97410ff-be3b-4e9f-8e62-2b5f20f72c44', true, '${role_impersonation}',
        'impersonation', 'master', 'e97410ff-be3b-4e9f-8e62-2b5f20f72c44', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm)
VALUES ('bc0e16af-e48f-4ac0-b90c-d5f72e401de3', 'd521b2b1-b33e-4a55-a524-ab3d9fb5ef93', true, NULL, 'uma_protection',
        'CoreRealm', 'd521b2b1-b33e-4a55-a524-ab3d9fb5ef93', NULL);


--
-- TOC entry 4156 (class 0 OID 16917)
-- Dependencies: 245
-- Data for Name: migration_model; Type: TABLE DATA; Schema: public; Owner: magnittest
--

INSERT INTO public.migration_model (id, version, update_time)
VALUES ('67q3z', '16.1.1', 1668445664);


--
-- TOC entry 4173 (class 0 OID 17189)
-- Dependencies: 262
-- Data for Name: offline_client_session; Type: TABLE DATA; Schema: public; Owner: magnittest
--


--
-- TOC entry 4172 (class 0 OID 17184)
-- Dependencies: 261
-- Data for Name: offline_user_session; Type: TABLE DATA; Schema: public; Owner: magnittest
--


--
-- TOC entry 4186 (class 0 OID 17405)
-- Dependencies: 275
-- Data for Name: policy_config; Type: TABLE DATA; Schema: public; Owner: magnittest
--

INSERT INTO public.policy_config (policy_id, name, value)
VALUES ('954ebfde-9c97-4215-831d-64b240427051', 'code', '// by default, grants any permission associated with this policy
$evaluation.grant();
');
INSERT INTO public.policy_config (policy_id, name, value)
VALUES ('bc06c310-16e1-4b62-a728-462bfb94c5b1', 'defaultResourceType', 'urn:core:resources:default');
INSERT INTO public.policy_config (policy_id, name, value)
VALUES ('a2484a5c-c4ef-4493-b355-ef4182186009', 'code', '// by default, grants any permission associated with this policy
$evaluation.grant();
');
INSERT INTO public.policy_config (policy_id, name, value)
VALUES ('e33cc715-2781-42a0-8b8f-c603b71c8efc', 'defaultResourceType', 'urn:core:resources:default');


--
-- TOC entry 4148 (class 0 OID 16791)
-- Dependencies: 237
-- Data for Name: protocol_mapper; Type: TABLE DATA; Schema: public; Owner: magnittest
--

INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id)
VALUES ('e8c7f3d6-7914-45e7-8637-e254c3611bc9', 'locale', 'openid-connect', 'oidc-usermodel-attribute-mapper',
        '20bc77ee-a5b5-49fd-a844-4ca70936bf3c', NULL);
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id)
VALUES ('1ec0b439-41b6-4e7a-a4bc-b9c6f76cfb56', 'role list', 'saml', 'saml-role-list-mapper', NULL,
        '1fa570c4-f1de-4e65-bf32-d49596205e4a');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id)
VALUES ('b93a0951-c696-4fc0-82c1-e212f07332cb', 'full name', 'openid-connect', 'oidc-full-name-mapper', NULL,
        '08246169-7f99-4a9e-8afb-f90ef919e38a');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id)
VALUES ('869f80ea-9e97-44cf-bbd9-f6015b76de19', 'family name', 'openid-connect', 'oidc-usermodel-property-mapper', NULL,
        '08246169-7f99-4a9e-8afb-f90ef919e38a');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id)
VALUES ('499d1875-24d2-4d56-b035-8c5322e416aa', 'given name', 'openid-connect', 'oidc-usermodel-property-mapper', NULL,
        '08246169-7f99-4a9e-8afb-f90ef919e38a');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id)
VALUES ('115c37f0-8ddc-490d-871b-33cf6d25a798', 'middle name', 'openid-connect', 'oidc-usermodel-attribute-mapper',
        NULL, '08246169-7f99-4a9e-8afb-f90ef919e38a');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id)
VALUES ('f48312ec-37e5-4c22-ba3d-59bc8684b5a3', 'nickname', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL,
        '08246169-7f99-4a9e-8afb-f90ef919e38a');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id)
VALUES ('be0f4331-3a6b-4a5e-948d-1b3c78b40edb', 'username', 'openid-connect', 'oidc-usermodel-property-mapper', NULL,
        '08246169-7f99-4a9e-8afb-f90ef919e38a');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id)
VALUES ('6fa8689f-5f0d-4037-8cb8-66619a25a5c1', 'profile', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL,
        '08246169-7f99-4a9e-8afb-f90ef919e38a');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id)
VALUES ('8b5495c2-6080-4d70-8ed2-6c7610deff66', 'picture', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL,
        '08246169-7f99-4a9e-8afb-f90ef919e38a');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id)
VALUES ('94e05704-793e-496b-9898-39a6c914dae6', 'website', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL,
        '08246169-7f99-4a9e-8afb-f90ef919e38a');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id)
VALUES ('93defa8f-f76a-49ee-a327-93ee04e34c14', 'gender', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL,
        '08246169-7f99-4a9e-8afb-f90ef919e38a');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id)
VALUES ('15141cb2-1862-43d8-97a2-9b1c3d7d096a', 'birthdate', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL,
        '08246169-7f99-4a9e-8afb-f90ef919e38a');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id)
VALUES ('2e2e54b8-14a2-4961-8e74-5351c75d9fb4', 'zoneinfo', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL,
        '08246169-7f99-4a9e-8afb-f90ef919e38a');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id)
VALUES ('8b697820-edd2-406a-8e01-2ceb1615ad8f', 'locale', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL,
        '08246169-7f99-4a9e-8afb-f90ef919e38a');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id)
VALUES ('eedcf9c2-6730-4753-a343-29b389ebad0d', 'updated at', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL,
        '08246169-7f99-4a9e-8afb-f90ef919e38a');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id)
VALUES ('83d2bad8-8c40-4f05-93eb-e860219c19f4', 'email', 'openid-connect', 'oidc-usermodel-property-mapper', NULL,
        'd283e024-290a-46eb-9b41-b89571e1b2c5');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id)
VALUES ('7e49056a-7237-4ce3-86d2-f4f4e25fbe0c', 'email verified', 'openid-connect', 'oidc-usermodel-property-mapper',
        NULL, 'd283e024-290a-46eb-9b41-b89571e1b2c5');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id)
VALUES ('dbbe1fec-5e09-4038-8706-6e964f1601fd', 'address', 'openid-connect', 'oidc-address-mapper', NULL,
        '9c58a12c-0612-425b-9eb9-4a8d9128cd70');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id)
VALUES ('3201570d-7370-499a-bd93-4ea855448515', 'phone number', 'openid-connect', 'oidc-usermodel-attribute-mapper',
        NULL, 'dd115e44-65f9-4ecf-924a-365893e6cbe1');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id)
VALUES ('f7d34360-7085-4611-a76d-282655b55c68', 'phone number verified', 'openid-connect',
        'oidc-usermodel-attribute-mapper', NULL, 'dd115e44-65f9-4ecf-924a-365893e6cbe1');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id)
VALUES ('94969903-cb91-402a-bd92-ad05e104044f', 'realm roles', 'openid-connect', 'oidc-usermodel-realm-role-mapper',
        NULL, 'caa60bb2-6e7b-4269-99e1-df55a6373056');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id)
VALUES ('21ab95c8-3f1a-42c0-8303-5e28cf7a3c9a', 'client roles', 'openid-connect', 'oidc-usermodel-client-role-mapper',
        NULL, 'caa60bb2-6e7b-4269-99e1-df55a6373056');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id)
VALUES ('ebfdb65a-36f0-4724-91c8-007fb56f6277', 'audience resolve', 'openid-connect', 'oidc-audience-resolve-mapper',
        NULL, 'caa60bb2-6e7b-4269-99e1-df55a6373056');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id)
VALUES ('c9fdae6f-f8bd-4108-83e2-742ebe6a0861', 'allowed web origins', 'openid-connect', 'oidc-allowed-origins-mapper',
        NULL, 'a9ecffd4-d0d9-4825-8677-9bdd22901fe1');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id)
VALUES ('508bdaa1-79d4-4108-af63-02d5c48b6243', 'upn', 'openid-connect', 'oidc-usermodel-property-mapper', NULL,
        '844f4726-cd45-4e06-88ff-92a3b1d8a089');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id)
VALUES ('c480fb1d-e5dc-42e3-91ea-3fabd549c046', 'groups', 'openid-connect', 'oidc-usermodel-realm-role-mapper', NULL,
        '844f4726-cd45-4e06-88ff-92a3b1d8a089');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id)
VALUES ('65adf2c7-c0b4-4a63-9a9c-5a458539e2ae', 'audience resolve', 'openid-connect', 'oidc-audience-resolve-mapper',
        '75bf2e37-dcc7-42a4-bc94-79a2da14c029', NULL);
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id)
VALUES ('be2c2dd1-60e7-4afc-8f44-166a5a3b25c6', 'Client ID', 'openid-connect', 'oidc-usersessionmodel-note-mapper',
        'f0c04cb9-541a-4192-ae8d-1c406fb61794', NULL);
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id)
VALUES ('f60b808a-55e3-460b-b072-9c816bf8c02b', 'Client Host', 'openid-connect', 'oidc-usersessionmodel-note-mapper',
        'f0c04cb9-541a-4192-ae8d-1c406fb61794', NULL);
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id)
VALUES ('76a33b77-baa0-4966-8c62-489d2d2a949f', 'Client IP Address', 'openid-connect',
        'oidc-usersessionmodel-note-mapper', 'f0c04cb9-541a-4192-ae8d-1c406fb61794', NULL);
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id)
VALUES ('cf3ecae2-522d-482b-94f4-feece89928f9', 'phone number verified', 'openid-connect',
        'oidc-usermodel-attribute-mapper', NULL, '233807dd-cd6a-4dff-90ef-60594f541bc5');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id)
VALUES ('577aa1df-b842-43a1-817d-c80bc4488507', 'phone number', 'openid-connect', 'oidc-usermodel-attribute-mapper',
        NULL, '233807dd-cd6a-4dff-90ef-60594f541bc5');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id)
VALUES ('02903a74-9ab3-4aa7-9414-5f22c3ec4b2a', 'upn', 'openid-connect', 'oidc-usermodel-property-mapper', NULL,
        'dad43592-70d2-4ebd-ae1a-1a2d7b21db12');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id)
VALUES ('c0755ddc-f00e-4043-a1f0-e7f903c020f7', 'groups', 'openid-connect', 'oidc-usermodel-realm-role-mapper', NULL,
        'dad43592-70d2-4ebd-ae1a-1a2d7b21db12');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id)
VALUES ('704450db-0c4f-4432-b950-a91a49750d63', 'email', 'openid-connect', 'oidc-usermodel-property-mapper', NULL,
        'b0ab1a7f-8bfa-4c0b-bd55-6335b3826530');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id)
VALUES ('b8d674f2-bebc-47bc-ac0e-33c2893c4973', 'email verified', 'openid-connect', 'oidc-usermodel-property-mapper',
        NULL, 'b0ab1a7f-8bfa-4c0b-bd55-6335b3826530');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id)
VALUES ('5c48d5c0-44b4-4113-8bec-903b24494211', 'realm roles', 'openid-connect', 'oidc-usermodel-realm-role-mapper',
        NULL, 'eb4adf8e-d668-4a1c-beba-2d6ce867a1a1');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id)
VALUES ('7b48e6dd-6363-486b-b025-0c3ada9a1a79', 'client roles', 'openid-connect', 'oidc-usermodel-client-role-mapper',
        NULL, 'eb4adf8e-d668-4a1c-beba-2d6ce867a1a1');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id)
VALUES ('18a20bd1-3f98-4536-a902-ca8761ebea1b', 'audience resolve', 'openid-connect', 'oidc-audience-resolve-mapper',
        NULL, 'eb4adf8e-d668-4a1c-beba-2d6ce867a1a1');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id)
VALUES ('32966293-e79c-4a11-b7a8-8d4d50d09a1e', 'role list', 'saml', 'saml-role-list-mapper', NULL,
        'c61fabbf-a68b-49ef-a23f-29d674e422f4');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id)
VALUES ('8f8e30f2-9a8e-4928-8607-00ff360c53cd', 'nickname', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL,
        '421c8df6-09e7-49b0-b3dd-8c8aece0c497');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id)
VALUES ('7f25ac8a-1f04-43dd-a357-40843246a9f8', 'username', 'openid-connect', 'oidc-usermodel-property-mapper', NULL,
        '421c8df6-09e7-49b0-b3dd-8c8aece0c497');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id)
VALUES ('dba0efa6-a72c-46ed-85f2-e9da16632baa', 'family name', 'openid-connect', 'oidc-usermodel-property-mapper', NULL,
        '421c8df6-09e7-49b0-b3dd-8c8aece0c497');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id)
VALUES ('772ea20f-ace1-4460-96ad-72f47cb9ce78', 'picture', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL,
        '421c8df6-09e7-49b0-b3dd-8c8aece0c497');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id)
VALUES ('e8dcd05b-89c5-4e4c-8310-ce480e528bad', 'website', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL,
        '421c8df6-09e7-49b0-b3dd-8c8aece0c497');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id)
VALUES ('8bf1dbe6-bd18-4c4c-986b-6d2ef8aeb364', 'zoneinfo', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL,
        '421c8df6-09e7-49b0-b3dd-8c8aece0c497');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id)
VALUES ('bb6d3714-7567-4e43-aa6f-da4a7043418c', 'birthdate', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL,
        '421c8df6-09e7-49b0-b3dd-8c8aece0c497');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id)
VALUES ('47f9e215-b2d8-4d35-a5d7-3b9246217b12', 'profile', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL,
        '421c8df6-09e7-49b0-b3dd-8c8aece0c497');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id)
VALUES ('08a93f96-7b37-4d96-b8b9-eda72fcbce1f', 'full name', 'openid-connect', 'oidc-full-name-mapper', NULL,
        '421c8df6-09e7-49b0-b3dd-8c8aece0c497');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id)
VALUES ('b6a1da50-d6bf-4598-a818-4e2be03e411b', 'locale', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL,
        '421c8df6-09e7-49b0-b3dd-8c8aece0c497');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id)
VALUES ('528bf4c8-0942-4f3d-8b5a-987cbcc2993f', 'given name', 'openid-connect', 'oidc-usermodel-property-mapper', NULL,
        '421c8df6-09e7-49b0-b3dd-8c8aece0c497');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id)
VALUES ('46fac139-c588-4bb8-8b35-5c0abdd7ed30', 'middle name', 'openid-connect', 'oidc-usermodel-attribute-mapper',
        NULL, '421c8df6-09e7-49b0-b3dd-8c8aece0c497');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id)
VALUES ('51fd28c7-9f48-4f5b-b23c-76eb31f3664f', 'gender', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL,
        '421c8df6-09e7-49b0-b3dd-8c8aece0c497');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id)
VALUES ('65aab284-fc2f-4369-8e40-1f2c43ed1ac7', 'updated at', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL,
        '421c8df6-09e7-49b0-b3dd-8c8aece0c497');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id)
VALUES ('81401665-e87a-4073-b6da-b0a8d83854ee', 'address', 'openid-connect', 'oidc-address-mapper', NULL,
        'fed16ddf-f8c8-48dc-95ab-12200d026faf');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id)
VALUES ('78671aca-38e0-44d1-b42c-beca45d5fcce', 'allowed web origins', 'openid-connect', 'oidc-allowed-origins-mapper',
        NULL, 'bcfd119a-b7be-4959-b4f5-636890cd051b');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id)
VALUES ('7ff4add3-ff87-4540-9859-e009c70dfc50', 'audience resolve', 'openid-connect', 'oidc-audience-resolve-mapper',
        '02c23fb3-34df-4dbe-8045-ce1f85f03033', NULL);
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id)
VALUES ('7ce35878-06bb-4378-a3ed-c4c69d9701b5', 'locale', 'openid-connect', 'oidc-usermodel-attribute-mapper',
        '51a6b69c-8ad8-458d-94dd-c8919a688046', NULL);
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id)
VALUES ('134b5db3-f42c-4123-a5cb-562720fdff2a', 'Client ID', 'openid-connect', 'oidc-usersessionmodel-note-mapper',
        'd521b2b1-b33e-4a55-a524-ab3d9fb5ef93', NULL);
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id)
VALUES ('3aa5d10a-d30d-4520-98e4-c958bef6cc65', 'Client Host', 'openid-connect', 'oidc-usersessionmodel-note-mapper',
        'd521b2b1-b33e-4a55-a524-ab3d9fb5ef93', NULL);
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id)
VALUES ('67d31440-dd3f-45cb-9580-02533e9df163', 'Client IP Address', 'openid-connect',
        'oidc-usersessionmodel-note-mapper', 'd521b2b1-b33e-4a55-a524-ab3d9fb5ef93', NULL);


--
-- TOC entry 4149 (class 0 OID 16797)
-- Dependencies: 238
-- Data for Name: protocol_mapper_config; Type: TABLE DATA; Schema: public; Owner: magnittest
--

INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('e8c7f3d6-7914-45e7-8637-e254c3611bc9', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('e8c7f3d6-7914-45e7-8637-e254c3611bc9', 'locale', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('e8c7f3d6-7914-45e7-8637-e254c3611bc9', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('e8c7f3d6-7914-45e7-8637-e254c3611bc9', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('e8c7f3d6-7914-45e7-8637-e254c3611bc9', 'locale', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('e8c7f3d6-7914-45e7-8637-e254c3611bc9', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('1ec0b439-41b6-4e7a-a4bc-b9c6f76cfb56', 'false', 'single');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('1ec0b439-41b6-4e7a-a4bc-b9c6f76cfb56', 'Basic', 'attribute.nameformat');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('1ec0b439-41b6-4e7a-a4bc-b9c6f76cfb56', 'Role', 'attribute.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('b93a0951-c696-4fc0-82c1-e212f07332cb', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('b93a0951-c696-4fc0-82c1-e212f07332cb', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('b93a0951-c696-4fc0-82c1-e212f07332cb', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('869f80ea-9e97-44cf-bbd9-f6015b76de19', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('869f80ea-9e97-44cf-bbd9-f6015b76de19', 'lastName', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('869f80ea-9e97-44cf-bbd9-f6015b76de19', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('869f80ea-9e97-44cf-bbd9-f6015b76de19', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('869f80ea-9e97-44cf-bbd9-f6015b76de19', 'family_name', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('869f80ea-9e97-44cf-bbd9-f6015b76de19', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('499d1875-24d2-4d56-b035-8c5322e416aa', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('499d1875-24d2-4d56-b035-8c5322e416aa', 'firstName', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('499d1875-24d2-4d56-b035-8c5322e416aa', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('499d1875-24d2-4d56-b035-8c5322e416aa', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('499d1875-24d2-4d56-b035-8c5322e416aa', 'given_name', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('499d1875-24d2-4d56-b035-8c5322e416aa', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('115c37f0-8ddc-490d-871b-33cf6d25a798', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('115c37f0-8ddc-490d-871b-33cf6d25a798', 'middleName', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('115c37f0-8ddc-490d-871b-33cf6d25a798', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('115c37f0-8ddc-490d-871b-33cf6d25a798', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('115c37f0-8ddc-490d-871b-33cf6d25a798', 'middle_name', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('115c37f0-8ddc-490d-871b-33cf6d25a798', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('f48312ec-37e5-4c22-ba3d-59bc8684b5a3', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('f48312ec-37e5-4c22-ba3d-59bc8684b5a3', 'nickname', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('f48312ec-37e5-4c22-ba3d-59bc8684b5a3', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('f48312ec-37e5-4c22-ba3d-59bc8684b5a3', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('f48312ec-37e5-4c22-ba3d-59bc8684b5a3', 'nickname', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('f48312ec-37e5-4c22-ba3d-59bc8684b5a3', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('be0f4331-3a6b-4a5e-948d-1b3c78b40edb', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('be0f4331-3a6b-4a5e-948d-1b3c78b40edb', 'username', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('be0f4331-3a6b-4a5e-948d-1b3c78b40edb', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('be0f4331-3a6b-4a5e-948d-1b3c78b40edb', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('be0f4331-3a6b-4a5e-948d-1b3c78b40edb', 'preferred_username', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('be0f4331-3a6b-4a5e-948d-1b3c78b40edb', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('6fa8689f-5f0d-4037-8cb8-66619a25a5c1', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('6fa8689f-5f0d-4037-8cb8-66619a25a5c1', 'profile', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('6fa8689f-5f0d-4037-8cb8-66619a25a5c1', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('6fa8689f-5f0d-4037-8cb8-66619a25a5c1', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('6fa8689f-5f0d-4037-8cb8-66619a25a5c1', 'profile', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('6fa8689f-5f0d-4037-8cb8-66619a25a5c1', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('8b5495c2-6080-4d70-8ed2-6c7610deff66', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('8b5495c2-6080-4d70-8ed2-6c7610deff66', 'picture', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('8b5495c2-6080-4d70-8ed2-6c7610deff66', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('8b5495c2-6080-4d70-8ed2-6c7610deff66', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('8b5495c2-6080-4d70-8ed2-6c7610deff66', 'picture', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('8b5495c2-6080-4d70-8ed2-6c7610deff66', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('94e05704-793e-496b-9898-39a6c914dae6', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('94e05704-793e-496b-9898-39a6c914dae6', 'website', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('94e05704-793e-496b-9898-39a6c914dae6', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('94e05704-793e-496b-9898-39a6c914dae6', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('94e05704-793e-496b-9898-39a6c914dae6', 'website', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('94e05704-793e-496b-9898-39a6c914dae6', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('93defa8f-f76a-49ee-a327-93ee04e34c14', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('93defa8f-f76a-49ee-a327-93ee04e34c14', 'gender', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('93defa8f-f76a-49ee-a327-93ee04e34c14', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('93defa8f-f76a-49ee-a327-93ee04e34c14', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('93defa8f-f76a-49ee-a327-93ee04e34c14', 'gender', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('93defa8f-f76a-49ee-a327-93ee04e34c14', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('15141cb2-1862-43d8-97a2-9b1c3d7d096a', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('15141cb2-1862-43d8-97a2-9b1c3d7d096a', 'birthdate', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('15141cb2-1862-43d8-97a2-9b1c3d7d096a', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('15141cb2-1862-43d8-97a2-9b1c3d7d096a', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('15141cb2-1862-43d8-97a2-9b1c3d7d096a', 'birthdate', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('15141cb2-1862-43d8-97a2-9b1c3d7d096a', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('2e2e54b8-14a2-4961-8e74-5351c75d9fb4', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('2e2e54b8-14a2-4961-8e74-5351c75d9fb4', 'zoneinfo', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('2e2e54b8-14a2-4961-8e74-5351c75d9fb4', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('2e2e54b8-14a2-4961-8e74-5351c75d9fb4', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('2e2e54b8-14a2-4961-8e74-5351c75d9fb4', 'zoneinfo', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('2e2e54b8-14a2-4961-8e74-5351c75d9fb4', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('8b697820-edd2-406a-8e01-2ceb1615ad8f', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('8b697820-edd2-406a-8e01-2ceb1615ad8f', 'locale', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('8b697820-edd2-406a-8e01-2ceb1615ad8f', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('8b697820-edd2-406a-8e01-2ceb1615ad8f', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('8b697820-edd2-406a-8e01-2ceb1615ad8f', 'locale', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('8b697820-edd2-406a-8e01-2ceb1615ad8f', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('eedcf9c2-6730-4753-a343-29b389ebad0d', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('eedcf9c2-6730-4753-a343-29b389ebad0d', 'updatedAt', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('eedcf9c2-6730-4753-a343-29b389ebad0d', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('eedcf9c2-6730-4753-a343-29b389ebad0d', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('eedcf9c2-6730-4753-a343-29b389ebad0d', 'updated_at', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('eedcf9c2-6730-4753-a343-29b389ebad0d', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('83d2bad8-8c40-4f05-93eb-e860219c19f4', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('83d2bad8-8c40-4f05-93eb-e860219c19f4', 'email', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('83d2bad8-8c40-4f05-93eb-e860219c19f4', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('83d2bad8-8c40-4f05-93eb-e860219c19f4', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('83d2bad8-8c40-4f05-93eb-e860219c19f4', 'email', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('83d2bad8-8c40-4f05-93eb-e860219c19f4', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('7e49056a-7237-4ce3-86d2-f4f4e25fbe0c', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('7e49056a-7237-4ce3-86d2-f4f4e25fbe0c', 'emailVerified', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('7e49056a-7237-4ce3-86d2-f4f4e25fbe0c', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('7e49056a-7237-4ce3-86d2-f4f4e25fbe0c', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('7e49056a-7237-4ce3-86d2-f4f4e25fbe0c', 'email_verified', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('7e49056a-7237-4ce3-86d2-f4f4e25fbe0c', 'boolean', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('dbbe1fec-5e09-4038-8706-6e964f1601fd', 'formatted', 'user.attribute.formatted');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('dbbe1fec-5e09-4038-8706-6e964f1601fd', 'country', 'user.attribute.country');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('dbbe1fec-5e09-4038-8706-6e964f1601fd', 'postal_code', 'user.attribute.postal_code');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('dbbe1fec-5e09-4038-8706-6e964f1601fd', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('dbbe1fec-5e09-4038-8706-6e964f1601fd', 'street', 'user.attribute.street');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('dbbe1fec-5e09-4038-8706-6e964f1601fd', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('dbbe1fec-5e09-4038-8706-6e964f1601fd', 'region', 'user.attribute.region');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('dbbe1fec-5e09-4038-8706-6e964f1601fd', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('dbbe1fec-5e09-4038-8706-6e964f1601fd', 'locality', 'user.attribute.locality');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('3201570d-7370-499a-bd93-4ea855448515', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('3201570d-7370-499a-bd93-4ea855448515', 'phoneNumber', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('3201570d-7370-499a-bd93-4ea855448515', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('3201570d-7370-499a-bd93-4ea855448515', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('3201570d-7370-499a-bd93-4ea855448515', 'phone_number', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('3201570d-7370-499a-bd93-4ea855448515', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('f7d34360-7085-4611-a76d-282655b55c68', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('f7d34360-7085-4611-a76d-282655b55c68', 'phoneNumberVerified', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('f7d34360-7085-4611-a76d-282655b55c68', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('f7d34360-7085-4611-a76d-282655b55c68', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('f7d34360-7085-4611-a76d-282655b55c68', 'phone_number_verified', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('f7d34360-7085-4611-a76d-282655b55c68', 'boolean', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('94969903-cb91-402a-bd92-ad05e104044f', 'true', 'multivalued');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('94969903-cb91-402a-bd92-ad05e104044f', 'foo', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('94969903-cb91-402a-bd92-ad05e104044f', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('94969903-cb91-402a-bd92-ad05e104044f', 'realm_access.roles', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('94969903-cb91-402a-bd92-ad05e104044f', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('21ab95c8-3f1a-42c0-8303-5e28cf7a3c9a', 'true', 'multivalued');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('21ab95c8-3f1a-42c0-8303-5e28cf7a3c9a', 'foo', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('21ab95c8-3f1a-42c0-8303-5e28cf7a3c9a', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('21ab95c8-3f1a-42c0-8303-5e28cf7a3c9a', 'resource_access.${client_id}.roles', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('21ab95c8-3f1a-42c0-8303-5e28cf7a3c9a', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('508bdaa1-79d4-4108-af63-02d5c48b6243', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('508bdaa1-79d4-4108-af63-02d5c48b6243', 'username', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('508bdaa1-79d4-4108-af63-02d5c48b6243', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('508bdaa1-79d4-4108-af63-02d5c48b6243', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('508bdaa1-79d4-4108-af63-02d5c48b6243', 'upn', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('508bdaa1-79d4-4108-af63-02d5c48b6243', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('c480fb1d-e5dc-42e3-91ea-3fabd549c046', 'true', 'multivalued');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('c480fb1d-e5dc-42e3-91ea-3fabd549c046', 'foo', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('c480fb1d-e5dc-42e3-91ea-3fabd549c046', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('c480fb1d-e5dc-42e3-91ea-3fabd549c046', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('c480fb1d-e5dc-42e3-91ea-3fabd549c046', 'groups', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('c480fb1d-e5dc-42e3-91ea-3fabd549c046', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('be2c2dd1-60e7-4afc-8f44-166a5a3b25c6', 'clientId', 'user.session.note');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('be2c2dd1-60e7-4afc-8f44-166a5a3b25c6', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('be2c2dd1-60e7-4afc-8f44-166a5a3b25c6', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('be2c2dd1-60e7-4afc-8f44-166a5a3b25c6', 'clientId', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('be2c2dd1-60e7-4afc-8f44-166a5a3b25c6', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('f60b808a-55e3-460b-b072-9c816bf8c02b', 'clientHost', 'user.session.note');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('f60b808a-55e3-460b-b072-9c816bf8c02b', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('f60b808a-55e3-460b-b072-9c816bf8c02b', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('f60b808a-55e3-460b-b072-9c816bf8c02b', 'clientHost', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('f60b808a-55e3-460b-b072-9c816bf8c02b', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('76a33b77-baa0-4966-8c62-489d2d2a949f', 'clientAddress', 'user.session.note');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('76a33b77-baa0-4966-8c62-489d2d2a949f', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('76a33b77-baa0-4966-8c62-489d2d2a949f', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('76a33b77-baa0-4966-8c62-489d2d2a949f', 'clientAddress', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('76a33b77-baa0-4966-8c62-489d2d2a949f', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('cf3ecae2-522d-482b-94f4-feece89928f9', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('cf3ecae2-522d-482b-94f4-feece89928f9', 'phoneNumberVerified', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('cf3ecae2-522d-482b-94f4-feece89928f9', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('cf3ecae2-522d-482b-94f4-feece89928f9', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('cf3ecae2-522d-482b-94f4-feece89928f9', 'phone_number_verified', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('cf3ecae2-522d-482b-94f4-feece89928f9', 'boolean', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('577aa1df-b842-43a1-817d-c80bc4488507', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('577aa1df-b842-43a1-817d-c80bc4488507', 'phoneNumber', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('577aa1df-b842-43a1-817d-c80bc4488507', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('577aa1df-b842-43a1-817d-c80bc4488507', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('577aa1df-b842-43a1-817d-c80bc4488507', 'phone_number', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('577aa1df-b842-43a1-817d-c80bc4488507', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('02903a74-9ab3-4aa7-9414-5f22c3ec4b2a', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('02903a74-9ab3-4aa7-9414-5f22c3ec4b2a', 'username', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('02903a74-9ab3-4aa7-9414-5f22c3ec4b2a', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('02903a74-9ab3-4aa7-9414-5f22c3ec4b2a', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('02903a74-9ab3-4aa7-9414-5f22c3ec4b2a', 'upn', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('02903a74-9ab3-4aa7-9414-5f22c3ec4b2a', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('c0755ddc-f00e-4043-a1f0-e7f903c020f7', 'true', 'multivalued');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('c0755ddc-f00e-4043-a1f0-e7f903c020f7', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('c0755ddc-f00e-4043-a1f0-e7f903c020f7', 'foo', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('c0755ddc-f00e-4043-a1f0-e7f903c020f7', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('c0755ddc-f00e-4043-a1f0-e7f903c020f7', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('c0755ddc-f00e-4043-a1f0-e7f903c020f7', 'groups', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('c0755ddc-f00e-4043-a1f0-e7f903c020f7', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('704450db-0c4f-4432-b950-a91a49750d63', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('704450db-0c4f-4432-b950-a91a49750d63', 'email', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('704450db-0c4f-4432-b950-a91a49750d63', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('704450db-0c4f-4432-b950-a91a49750d63', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('704450db-0c4f-4432-b950-a91a49750d63', 'email', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('704450db-0c4f-4432-b950-a91a49750d63', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('b8d674f2-bebc-47bc-ac0e-33c2893c4973', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('b8d674f2-bebc-47bc-ac0e-33c2893c4973', 'emailVerified', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('b8d674f2-bebc-47bc-ac0e-33c2893c4973', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('b8d674f2-bebc-47bc-ac0e-33c2893c4973', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('b8d674f2-bebc-47bc-ac0e-33c2893c4973', 'email_verified', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('b8d674f2-bebc-47bc-ac0e-33c2893c4973', 'boolean', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('5c48d5c0-44b4-4113-8bec-903b24494211', 'foo', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('5c48d5c0-44b4-4113-8bec-903b24494211', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('5c48d5c0-44b4-4113-8bec-903b24494211', 'realm_access.roles', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('5c48d5c0-44b4-4113-8bec-903b24494211', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('5c48d5c0-44b4-4113-8bec-903b24494211', 'true', 'multivalued');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('7b48e6dd-6363-486b-b025-0c3ada9a1a79', 'foo', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('7b48e6dd-6363-486b-b025-0c3ada9a1a79', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('7b48e6dd-6363-486b-b025-0c3ada9a1a79', 'resource_access.${client_id}.roles', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('7b48e6dd-6363-486b-b025-0c3ada9a1a79', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('7b48e6dd-6363-486b-b025-0c3ada9a1a79', 'true', 'multivalued');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('32966293-e79c-4a11-b7a8-8d4d50d09a1e', 'false', 'single');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('32966293-e79c-4a11-b7a8-8d4d50d09a1e', 'Basic', 'attribute.nameformat');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('32966293-e79c-4a11-b7a8-8d4d50d09a1e', 'Role', 'attribute.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('8f8e30f2-9a8e-4928-8607-00ff360c53cd', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('8f8e30f2-9a8e-4928-8607-00ff360c53cd', 'nickname', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('8f8e30f2-9a8e-4928-8607-00ff360c53cd', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('8f8e30f2-9a8e-4928-8607-00ff360c53cd', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('8f8e30f2-9a8e-4928-8607-00ff360c53cd', 'nickname', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('8f8e30f2-9a8e-4928-8607-00ff360c53cd', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('7f25ac8a-1f04-43dd-a357-40843246a9f8', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('7f25ac8a-1f04-43dd-a357-40843246a9f8', 'username', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('7f25ac8a-1f04-43dd-a357-40843246a9f8', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('7f25ac8a-1f04-43dd-a357-40843246a9f8', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('7f25ac8a-1f04-43dd-a357-40843246a9f8', 'preferred_username', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('7f25ac8a-1f04-43dd-a357-40843246a9f8', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('dba0efa6-a72c-46ed-85f2-e9da16632baa', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('dba0efa6-a72c-46ed-85f2-e9da16632baa', 'lastName', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('dba0efa6-a72c-46ed-85f2-e9da16632baa', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('dba0efa6-a72c-46ed-85f2-e9da16632baa', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('dba0efa6-a72c-46ed-85f2-e9da16632baa', 'family_name', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('dba0efa6-a72c-46ed-85f2-e9da16632baa', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('772ea20f-ace1-4460-96ad-72f47cb9ce78', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('772ea20f-ace1-4460-96ad-72f47cb9ce78', 'picture', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('772ea20f-ace1-4460-96ad-72f47cb9ce78', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('772ea20f-ace1-4460-96ad-72f47cb9ce78', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('772ea20f-ace1-4460-96ad-72f47cb9ce78', 'picture', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('772ea20f-ace1-4460-96ad-72f47cb9ce78', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('e8dcd05b-89c5-4e4c-8310-ce480e528bad', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('e8dcd05b-89c5-4e4c-8310-ce480e528bad', 'website', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('e8dcd05b-89c5-4e4c-8310-ce480e528bad', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('e8dcd05b-89c5-4e4c-8310-ce480e528bad', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('e8dcd05b-89c5-4e4c-8310-ce480e528bad', 'website', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('e8dcd05b-89c5-4e4c-8310-ce480e528bad', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('8bf1dbe6-bd18-4c4c-986b-6d2ef8aeb364', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('8bf1dbe6-bd18-4c4c-986b-6d2ef8aeb364', 'zoneinfo', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('8bf1dbe6-bd18-4c4c-986b-6d2ef8aeb364', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('8bf1dbe6-bd18-4c4c-986b-6d2ef8aeb364', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('8bf1dbe6-bd18-4c4c-986b-6d2ef8aeb364', 'zoneinfo', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('8bf1dbe6-bd18-4c4c-986b-6d2ef8aeb364', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('bb6d3714-7567-4e43-aa6f-da4a7043418c', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('bb6d3714-7567-4e43-aa6f-da4a7043418c', 'birthdate', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('bb6d3714-7567-4e43-aa6f-da4a7043418c', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('bb6d3714-7567-4e43-aa6f-da4a7043418c', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('bb6d3714-7567-4e43-aa6f-da4a7043418c', 'birthdate', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('bb6d3714-7567-4e43-aa6f-da4a7043418c', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('47f9e215-b2d8-4d35-a5d7-3b9246217b12', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('47f9e215-b2d8-4d35-a5d7-3b9246217b12', 'profile', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('47f9e215-b2d8-4d35-a5d7-3b9246217b12', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('47f9e215-b2d8-4d35-a5d7-3b9246217b12', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('47f9e215-b2d8-4d35-a5d7-3b9246217b12', 'profile', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('47f9e215-b2d8-4d35-a5d7-3b9246217b12', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('08a93f96-7b37-4d96-b8b9-eda72fcbce1f', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('08a93f96-7b37-4d96-b8b9-eda72fcbce1f', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('08a93f96-7b37-4d96-b8b9-eda72fcbce1f', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('b6a1da50-d6bf-4598-a818-4e2be03e411b', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('b6a1da50-d6bf-4598-a818-4e2be03e411b', 'locale', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('b6a1da50-d6bf-4598-a818-4e2be03e411b', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('b6a1da50-d6bf-4598-a818-4e2be03e411b', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('b6a1da50-d6bf-4598-a818-4e2be03e411b', 'locale', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('b6a1da50-d6bf-4598-a818-4e2be03e411b', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('528bf4c8-0942-4f3d-8b5a-987cbcc2993f', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('528bf4c8-0942-4f3d-8b5a-987cbcc2993f', 'firstName', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('528bf4c8-0942-4f3d-8b5a-987cbcc2993f', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('528bf4c8-0942-4f3d-8b5a-987cbcc2993f', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('528bf4c8-0942-4f3d-8b5a-987cbcc2993f', 'given_name', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('528bf4c8-0942-4f3d-8b5a-987cbcc2993f', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('46fac139-c588-4bb8-8b35-5c0abdd7ed30', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('46fac139-c588-4bb8-8b35-5c0abdd7ed30', 'middleName', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('46fac139-c588-4bb8-8b35-5c0abdd7ed30', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('46fac139-c588-4bb8-8b35-5c0abdd7ed30', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('46fac139-c588-4bb8-8b35-5c0abdd7ed30', 'middle_name', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('46fac139-c588-4bb8-8b35-5c0abdd7ed30', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('51fd28c7-9f48-4f5b-b23c-76eb31f3664f', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('51fd28c7-9f48-4f5b-b23c-76eb31f3664f', 'gender', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('51fd28c7-9f48-4f5b-b23c-76eb31f3664f', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('51fd28c7-9f48-4f5b-b23c-76eb31f3664f', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('51fd28c7-9f48-4f5b-b23c-76eb31f3664f', 'gender', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('51fd28c7-9f48-4f5b-b23c-76eb31f3664f', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('65aab284-fc2f-4369-8e40-1f2c43ed1ac7', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('65aab284-fc2f-4369-8e40-1f2c43ed1ac7', 'updatedAt', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('65aab284-fc2f-4369-8e40-1f2c43ed1ac7', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('65aab284-fc2f-4369-8e40-1f2c43ed1ac7', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('65aab284-fc2f-4369-8e40-1f2c43ed1ac7', 'updated_at', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('65aab284-fc2f-4369-8e40-1f2c43ed1ac7', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('81401665-e87a-4073-b6da-b0a8d83854ee', 'formatted', 'user.attribute.formatted');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('81401665-e87a-4073-b6da-b0a8d83854ee', 'country', 'user.attribute.country');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('81401665-e87a-4073-b6da-b0a8d83854ee', 'postal_code', 'user.attribute.postal_code');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('81401665-e87a-4073-b6da-b0a8d83854ee', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('81401665-e87a-4073-b6da-b0a8d83854ee', 'street', 'user.attribute.street');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('81401665-e87a-4073-b6da-b0a8d83854ee', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('81401665-e87a-4073-b6da-b0a8d83854ee', 'region', 'user.attribute.region');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('81401665-e87a-4073-b6da-b0a8d83854ee', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('81401665-e87a-4073-b6da-b0a8d83854ee', 'locality', 'user.attribute.locality');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('7ce35878-06bb-4378-a3ed-c4c69d9701b5', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('7ce35878-06bb-4378-a3ed-c4c69d9701b5', 'locale', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('7ce35878-06bb-4378-a3ed-c4c69d9701b5', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('7ce35878-06bb-4378-a3ed-c4c69d9701b5', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('7ce35878-06bb-4378-a3ed-c4c69d9701b5', 'locale', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('7ce35878-06bb-4378-a3ed-c4c69d9701b5', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('134b5db3-f42c-4123-a5cb-562720fdff2a', 'clientId', 'user.session.note');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('134b5db3-f42c-4123-a5cb-562720fdff2a', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('134b5db3-f42c-4123-a5cb-562720fdff2a', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('134b5db3-f42c-4123-a5cb-562720fdff2a', 'clientId', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('134b5db3-f42c-4123-a5cb-562720fdff2a', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('3aa5d10a-d30d-4520-98e4-c958bef6cc65', 'clientHost', 'user.session.note');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('3aa5d10a-d30d-4520-98e4-c958bef6cc65', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('3aa5d10a-d30d-4520-98e4-c958bef6cc65', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('3aa5d10a-d30d-4520-98e4-c958bef6cc65', 'clientHost', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('3aa5d10a-d30d-4520-98e4-c958bef6cc65', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('67d31440-dd3f-45cb-9580-02533e9df163', 'clientAddress', 'user.session.note');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('67d31440-dd3f-45cb-9580-02533e9df163', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('67d31440-dd3f-45cb-9580-02533e9df163', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('67d31440-dd3f-45cb-9580-02533e9df163', 'clientAddress', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name)
VALUES ('67d31440-dd3f-45cb-9580-02533e9df163', 'String', 'jsonType.label');


--
-- TOC entry 4129 (class 0 OID 16439)
-- Dependencies: 218
-- Data for Name: realm; Type: TABLE DATA; Schema: public; Owner: magnittest
--

INSERT INTO public.realm (id, access_code_lifespan, user_action_lifespan, access_token_lifespan, account_theme,
                          admin_theme, email_theme, enabled, events_enabled, events_expiration, login_theme, name,
                          not_before, password_policy, registration_allowed, remember_me, reset_password_allowed,
                          social, ssl_required, sso_idle_timeout, sso_max_lifespan, update_profile_on_soc_login,
                          verify_email, master_admin_client, login_lifespan, internationalization_enabled,
                          default_locale, reg_email_as_username, admin_events_enabled, admin_events_details_enabled,
                          edit_username_allowed, otp_policy_counter, otp_policy_window, otp_policy_period,
                          otp_policy_digits, otp_policy_alg, otp_policy_type, browser_flow, registration_flow,
                          direct_grant_flow, reset_credentials_flow, client_auth_flow, offline_session_idle_timeout,
                          revoke_refresh_token, access_token_life_implicit, login_with_email_allowed,
                          duplicate_emails_allowed, docker_auth_flow, refresh_token_max_reuse,
                          allow_user_managed_access, sso_max_lifespan_remember_me, sso_idle_timeout_remember_me,
                          default_role)
VALUES ('master', 60, 300, 60, NULL, NULL, NULL, true, false, 0, NULL, 'master', 0, NULL, false, false, false, false,
        'EXTERNAL', 1800, 36000, false, false, '3ee8f127-eb12-47e6-b244-12c2032aa970', 1800, false, NULL, false, false,
        false, false, 0, 1, 30, 6, 'HmacSHA1', 'totp', '9f3c2c6f-ab64-4f3d-baa6-42f40dc27e67',
        'da98a785-d0dc-4e03-8c53-46a22070b8f0', 'cb1c42d2-3794-4f51-8dce-ff687da4705d',
        '5ad7d74e-2358-4c84-8870-4ba82b8b4ee3', '2369b4a8-8686-4056-bac4-f588de4ff093', 2592000, false, 900, true,
        false, '33ab4bad-2cac-45fe-b4db-57bae7e00001', 0, false, 0, 0, 'ab1dabb5-455d-47b5-b81d-8d362e0b3b9e');
INSERT INTO public.realm (id, access_code_lifespan, user_action_lifespan, access_token_lifespan, account_theme,
                          admin_theme, email_theme, enabled, events_enabled, events_expiration, login_theme, name,
                          not_before, password_policy, registration_allowed, remember_me, reset_password_allowed,
                          social, ssl_required, sso_idle_timeout, sso_max_lifespan, update_profile_on_soc_login,
                          verify_email, master_admin_client, login_lifespan, internationalization_enabled,
                          default_locale, reg_email_as_username, admin_events_enabled, admin_events_details_enabled,
                          edit_username_allowed, otp_policy_counter, otp_policy_window, otp_policy_period,
                          otp_policy_digits, otp_policy_alg, otp_policy_type, browser_flow, registration_flow,
                          direct_grant_flow, reset_credentials_flow, client_auth_flow, offline_session_idle_timeout,
                          revoke_refresh_token, access_token_life_implicit, login_with_email_allowed,
                          duplicate_emails_allowed, docker_auth_flow, refresh_token_max_reuse,
                          allow_user_managed_access, sso_max_lifespan_remember_me, sso_idle_timeout_remember_me,
                          default_role)
VALUES ('CoreRealm', 60, 300, 300, NULL, NULL, NULL, true, false, 0, NULL, 'CoreRealm', 0, NULL, false, false, false,
        false, 'EXTERNAL', 1800, 36000, false, false, 'e97410ff-be3b-4e9f-8e62-2b5f20f72c44', 1800, false, NULL, false,
        false, false, false, 0, 1, 30, 6, 'HmacSHA1', 'totp', 'c8874279-ecc7-43ab-b13f-93a1e16faaf9',
        '0c305325-05cd-4640-bf37-ef9627e8127d', '9e6be99a-a235-4ca0-a59a-90d9fa364ad0',
        '5482562b-942d-4f53-9e47-ff6d8c0aefdf', '621c99b3-dea7-45b5-b723-350480747bb1', 2592000, false, 900, true,
        false, 'e041d4b7-3bbe-4c8c-9234-f31f4446e953', 0, false, 0, 0, '5e811292-e413-418b-afe2-e1cb5f138927');


--
-- TOC entry 4130 (class 0 OID 16456)
-- Dependencies: 219
-- Data for Name: realm_attribute; Type: TABLE DATA; Schema: public; Owner: magnittest
--

INSERT INTO public.realm_attribute (name, realm_id, value)
VALUES ('_browser_header.contentSecurityPolicyReportOnly', 'master', '');
INSERT INTO public.realm_attribute (name, realm_id, value)
VALUES ('_browser_header.xContentTypeOptions', 'master', 'nosniff');
INSERT INTO public.realm_attribute (name, realm_id, value)
VALUES ('_browser_header.xRobotsTag', 'master', 'none');
INSERT INTO public.realm_attribute (name, realm_id, value)
VALUES ('_browser_header.xFrameOptions', 'master', 'SAMEORIGIN');
INSERT INTO public.realm_attribute (name, realm_id, value)
VALUES ('_browser_header.contentSecurityPolicy', 'master',
        'frame-src ''self''; frame-ancestors ''self''; object-src ''none'';');
INSERT INTO public.realm_attribute (name, realm_id, value)
VALUES ('_browser_header.xXSSProtection', 'master', '1; mode=block');
INSERT INTO public.realm_attribute (name, realm_id, value)
VALUES ('_browser_header.strictTransportSecurity', 'master', 'max-age=31536000; includeSubDomains');
INSERT INTO public.realm_attribute (name, realm_id, value)
VALUES ('bruteForceProtected', 'master', 'false');
INSERT INTO public.realm_attribute (name, realm_id, value)
VALUES ('permanentLockout', 'master', 'false');
INSERT INTO public.realm_attribute (name, realm_id, value)
VALUES ('maxFailureWaitSeconds', 'master', '900');
INSERT INTO public.realm_attribute (name, realm_id, value)
VALUES ('minimumQuickLoginWaitSeconds', 'master', '60');
INSERT INTO public.realm_attribute (name, realm_id, value)
VALUES ('waitIncrementSeconds', 'master', '60');
INSERT INTO public.realm_attribute (name, realm_id, value)
VALUES ('quickLoginCheckMilliSeconds', 'master', '1000');
INSERT INTO public.realm_attribute (name, realm_id, value)
VALUES ('maxDeltaTimeSeconds', 'master', '43200');
INSERT INTO public.realm_attribute (name, realm_id, value)
VALUES ('failureFactor', 'master', '30');
INSERT INTO public.realm_attribute (name, realm_id, value)
VALUES ('displayName', 'master', 'Keycloak');
INSERT INTO public.realm_attribute (name, realm_id, value)
VALUES ('displayNameHtml', 'master', '<div class="kc-logo-text"><span>Keycloak</span></div>');
INSERT INTO public.realm_attribute (name, realm_id, value)
VALUES ('defaultSignatureAlgorithm', 'master', 'RS256');
INSERT INTO public.realm_attribute (name, realm_id, value)
VALUES ('offlineSessionMaxLifespanEnabled', 'master', 'false');
INSERT INTO public.realm_attribute (name, realm_id, value)
VALUES ('offlineSessionMaxLifespan', 'master', '5184000');
INSERT INTO public.realm_attribute (name, realm_id, value)
VALUES ('_browser_header.contentSecurityPolicyReportOnly', 'CoreRealm', '');
INSERT INTO public.realm_attribute (name, realm_id, value)
VALUES ('_browser_header.xContentTypeOptions', 'CoreRealm', 'nosniff');
INSERT INTO public.realm_attribute (name, realm_id, value)
VALUES ('_browser_header.xRobotsTag', 'CoreRealm', 'none');
INSERT INTO public.realm_attribute (name, realm_id, value)
VALUES ('_browser_header.xFrameOptions', 'CoreRealm', 'SAMEORIGIN');
INSERT INTO public.realm_attribute (name, realm_id, value)
VALUES ('_browser_header.contentSecurityPolicy', 'CoreRealm',
        'frame-src ''self''; frame-ancestors ''self''; object-src ''none'';');
INSERT INTO public.realm_attribute (name, realm_id, value)
VALUES ('_browser_header.xXSSProtection', 'CoreRealm', '1; mode=block');
INSERT INTO public.realm_attribute (name, realm_id, value)
VALUES ('_browser_header.strictTransportSecurity', 'CoreRealm', 'max-age=31536000; includeSubDomains');
INSERT INTO public.realm_attribute (name, realm_id, value)
VALUES ('bruteForceProtected', 'CoreRealm', 'false');
INSERT INTO public.realm_attribute (name, realm_id, value)
VALUES ('permanentLockout', 'CoreRealm', 'false');
INSERT INTO public.realm_attribute (name, realm_id, value)
VALUES ('maxFailureWaitSeconds', 'CoreRealm', '900');
INSERT INTO public.realm_attribute (name, realm_id, value)
VALUES ('minimumQuickLoginWaitSeconds', 'CoreRealm', '60');
INSERT INTO public.realm_attribute (name, realm_id, value)
VALUES ('waitIncrementSeconds', 'CoreRealm', '60');
INSERT INTO public.realm_attribute (name, realm_id, value)
VALUES ('quickLoginCheckMilliSeconds', 'CoreRealm', '1000');
INSERT INTO public.realm_attribute (name, realm_id, value)
VALUES ('maxDeltaTimeSeconds', 'CoreRealm', '43200');
INSERT INTO public.realm_attribute (name, realm_id, value)
VALUES ('failureFactor', 'CoreRealm', '30');
INSERT INTO public.realm_attribute (name, realm_id, value)
VALUES ('displayName', 'CoreRealm', 'MagnIT');
INSERT INTO public.realm_attribute (name, realm_id, value)
VALUES ('displayNameHtml', 'CoreRealm', '<h2>MagnIT</h2><p>test task by vmoshikov</p>');
INSERT INTO public.realm_attribute (name, realm_id, value)
VALUES ('defaultSignatureAlgorithm', 'CoreRealm', 'RS256');
INSERT INTO public.realm_attribute (name, realm_id, value)
VALUES ('offlineSessionMaxLifespanEnabled', 'CoreRealm', 'false');
INSERT INTO public.realm_attribute (name, realm_id, value)
VALUES ('offlineSessionMaxLifespan', 'CoreRealm', '5184000');
INSERT INTO public.realm_attribute (name, realm_id, value)
VALUES ('clientSessionIdleTimeout', 'CoreRealm', '0');
INSERT INTO public.realm_attribute (name, realm_id, value)
VALUES ('clientSessionMaxLifespan', 'CoreRealm', '0');
INSERT INTO public.realm_attribute (name, realm_id, value)
VALUES ('clientOfflineSessionIdleTimeout', 'CoreRealm', '0');
INSERT INTO public.realm_attribute (name, realm_id, value)
VALUES ('clientOfflineSessionMaxLifespan', 'CoreRealm', '0');
INSERT INTO public.realm_attribute (name, realm_id, value)
VALUES ('actionTokenGeneratedByAdminLifespan', 'CoreRealm', '43200');
INSERT INTO public.realm_attribute (name, realm_id, value)
VALUES ('actionTokenGeneratedByUserLifespan', 'CoreRealm', '300');
INSERT INTO public.realm_attribute (name, realm_id, value)
VALUES ('oauth2DeviceCodeLifespan', 'CoreRealm', '600');
INSERT INTO public.realm_attribute (name, realm_id, value)
VALUES ('oauth2DevicePollingInterval', 'CoreRealm', '5');
INSERT INTO public.realm_attribute (name, realm_id, value)
VALUES ('webAuthnPolicyRpEntityName', 'CoreRealm', 'keycloak');
INSERT INTO public.realm_attribute (name, realm_id, value)
VALUES ('webAuthnPolicySignatureAlgorithms', 'CoreRealm', 'ES256');
INSERT INTO public.realm_attribute (name, realm_id, value)
VALUES ('webAuthnPolicyRpId', 'CoreRealm', '');
INSERT INTO public.realm_attribute (name, realm_id, value)
VALUES ('webAuthnPolicyAttestationConveyancePreference', 'CoreRealm', 'not specified');
INSERT INTO public.realm_attribute (name, realm_id, value)
VALUES ('webAuthnPolicyAuthenticatorAttachment', 'CoreRealm', 'not specified');
INSERT INTO public.realm_attribute (name, realm_id, value)
VALUES ('webAuthnPolicyRequireResidentKey', 'CoreRealm', 'not specified');
INSERT INTO public.realm_attribute (name, realm_id, value)
VALUES ('webAuthnPolicyUserVerificationRequirement', 'CoreRealm', 'not specified');
INSERT INTO public.realm_attribute (name, realm_id, value)
VALUES ('webAuthnPolicyCreateTimeout', 'CoreRealm', '0');
INSERT INTO public.realm_attribute (name, realm_id, value)
VALUES ('webAuthnPolicyAvoidSameAuthenticatorRegister', 'CoreRealm', 'false');
INSERT INTO public.realm_attribute (name, realm_id, value)
VALUES ('webAuthnPolicyRpEntityNamePasswordless', 'CoreRealm', 'keycloak');
INSERT INTO public.realm_attribute (name, realm_id, value)
VALUES ('webAuthnPolicySignatureAlgorithmsPasswordless', 'CoreRealm', 'ES256');
INSERT INTO public.realm_attribute (name, realm_id, value)
VALUES ('webAuthnPolicyRpIdPasswordless', 'CoreRealm', '');
INSERT INTO public.realm_attribute (name, realm_id, value)
VALUES ('webAuthnPolicyAttestationConveyancePreferencePasswordless', 'CoreRealm', 'not specified');
INSERT INTO public.realm_attribute (name, realm_id, value)
VALUES ('webAuthnPolicyAuthenticatorAttachmentPasswordless', 'CoreRealm', 'not specified');
INSERT INTO public.realm_attribute (name, realm_id, value)
VALUES ('webAuthnPolicyRequireResidentKeyPasswordless', 'CoreRealm', 'not specified');
INSERT INTO public.realm_attribute (name, realm_id, value)
VALUES ('webAuthnPolicyUserVerificationRequirementPasswordless', 'CoreRealm', 'not specified');
INSERT INTO public.realm_attribute (name, realm_id, value)
VALUES ('webAuthnPolicyCreateTimeoutPasswordless', 'CoreRealm', '0');
INSERT INTO public.realm_attribute (name, realm_id, value)
VALUES ('webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless', 'CoreRealm', 'false');
INSERT INTO public.realm_attribute (name, realm_id, value)
VALUES ('cibaBackchannelTokenDeliveryMode', 'CoreRealm', 'poll');
INSERT INTO public.realm_attribute (name, realm_id, value)
VALUES ('cibaExpiresIn', 'CoreRealm', '120');
INSERT INTO public.realm_attribute (name, realm_id, value)
VALUES ('cibaInterval', 'CoreRealm', '5');
INSERT INTO public.realm_attribute (name, realm_id, value)
VALUES ('cibaAuthRequestedUserHint', 'CoreRealm', 'login_hint');
INSERT INTO public.realm_attribute (name, realm_id, value)
VALUES ('parRequestUriLifespan', 'CoreRealm', '60');
INSERT INTO public.realm_attribute (name, realm_id, value)
VALUES ('userProfileEnabled', 'CoreRealm', 'false');
INSERT INTO public.realm_attribute (name, realm_id, value)
VALUES ('client-policies.profiles', 'CoreRealm', '{"profiles":[]}');
INSERT INTO public.realm_attribute (name, realm_id, value)
VALUES ('client-policies.policies', 'CoreRealm', '{"policies":[]}');


--
-- TOC entry 4178 (class 0 OID 17213)
-- Dependencies: 267
-- Data for Name: realm_default_groups; Type: TABLE DATA; Schema: public; Owner: magnittest
--


--
-- TOC entry 4155 (class 0 OID 16909)
-- Dependencies: 244
-- Data for Name: realm_enabled_event_types; Type: TABLE DATA; Schema: public; Owner: magnittest
--


--
-- TOC entry 4131 (class 0 OID 16464)
-- Dependencies: 220
-- Data for Name: realm_events_listeners; Type: TABLE DATA; Schema: public; Owner: magnittest
--

INSERT INTO public.realm_events_listeners (realm_id, value)
VALUES ('master', 'jboss-logging');
INSERT INTO public.realm_events_listeners (realm_id, value)
VALUES ('CoreRealm', 'jboss-logging');


--
-- TOC entry 4211 (class 0 OID 17919)
-- Dependencies: 300
-- Data for Name: realm_localizations; Type: TABLE DATA; Schema: public; Owner: magnittest
--


--
-- TOC entry 4132 (class 0 OID 16467)
-- Dependencies: 221
-- Data for Name: realm_required_credential; Type: TABLE DATA; Schema: public; Owner: magnittest
--

INSERT INTO public.realm_required_credential (type, form_label, input, secret, realm_id)
VALUES ('password', 'password', true, true, 'master');
INSERT INTO public.realm_required_credential (type, form_label, input, secret, realm_id)
VALUES ('password', 'password', true, true, 'CoreRealm');


--
-- TOC entry 4133 (class 0 OID 16474)
-- Dependencies: 222
-- Data for Name: realm_smtp_config; Type: TABLE DATA; Schema: public; Owner: magnittest
--


--
-- TOC entry 4153 (class 0 OID 16825)
-- Dependencies: 242
-- Data for Name: realm_supported_locales; Type: TABLE DATA; Schema: public; Owner: magnittest
--


--
-- TOC entry 4134 (class 0 OID 16484)
-- Dependencies: 223
-- Data for Name: redirect_uris; Type: TABLE DATA; Schema: public; Owner: magnittest
--

INSERT INTO public.redirect_uris (client_id, value)
VALUES ('84a8181d-8ab4-443c-b8d0-795a8ad439a3', '/realms/master/account/*');
INSERT INTO public.redirect_uris (client_id, value)
VALUES ('20bc77ee-a5b5-49fd-a844-4ca70936bf3c', '/admin/master/console/*');
INSERT INTO public.redirect_uris (client_id, value)
VALUES ('f0c04cb9-541a-4192-ae8d-1c406fb61794', '/*');
INSERT INTO public.redirect_uris (client_id, value)
VALUES ('a9b58495-213e-4c37-9d10-548a76bdf8dc', '/realms/CoreRealm/account/*');
INSERT INTO public.redirect_uris (client_id, value)
VALUES ('02c23fb3-34df-4dbe-8045-ce1f85f03033', '/realms/CoreRealm/account/*');
INSERT INTO public.redirect_uris (client_id, value)
VALUES ('51a6b69c-8ad8-458d-94dd-c8919a688046', '/admin/CoreRealm/console/*');
INSERT INTO public.redirect_uris (client_id, value)
VALUES ('d521b2b1-b33e-4a55-a524-ab3d9fb5ef93', 'http://localhost/*');
INSERT INTO public.redirect_uris (client_id, value)
VALUES ('75bf2e37-dcc7-42a4-bc94-79a2da14c029', '/realms/CoreRealm/account/*');


--
-- TOC entry 4171 (class 0 OID 17148)
-- Dependencies: 260
-- Data for Name: required_action_config; Type: TABLE DATA; Schema: public; Owner: magnittest
--


--
-- TOC entry 4170 (class 0 OID 17141)
-- Dependencies: 259
-- Data for Name: required_action_provider; Type: TABLE DATA; Schema: public; Owner: magnittest
--

INSERT INTO public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority)
VALUES ('354065cd-598b-4dd4-ad9b-f40e879fae30', 'VERIFY_EMAIL', 'Verify Email', 'master', true, false, 'VERIFY_EMAIL',
        50);
INSERT INTO public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority)
VALUES ('27b4ea2b-221f-43ba-ba12-4fb9d1f8a2ff', 'UPDATE_PROFILE', 'Update Profile', 'master', true, false,
        'UPDATE_PROFILE', 40);
INSERT INTO public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority)
VALUES ('9f16ba87-cc6d-4dd6-a25c-eb038366cfcf', 'CONFIGURE_TOTP', 'Configure OTP', 'master', true, false,
        'CONFIGURE_TOTP', 10);
INSERT INTO public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority)
VALUES ('e1b5c580-bc16-401c-a1e0-e9f02de0b910', 'UPDATE_PASSWORD', 'Update Password', 'master', true, false,
        'UPDATE_PASSWORD', 30);
INSERT INTO public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority)
VALUES ('69e4b398-c90b-4376-b053-20e05d91fd29', 'terms_and_conditions', 'Terms and Conditions', 'master', false, false,
        'terms_and_conditions', 20);
INSERT INTO public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority)
VALUES ('9a49052f-49f0-466a-8a22-345515a30f5f', 'update_user_locale', 'Update User Locale', 'master', true, false,
        'update_user_locale', 1000);
INSERT INTO public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority)
VALUES ('cedac468-9b56-4811-be7c-3f3de178d734', 'delete_account', 'Delete Account', 'master', false, false,
        'delete_account', 60);
INSERT INTO public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority)
VALUES ('053113ad-7060-47f7-96a6-aac5122094e6', 'CONFIGURE_TOTP', 'Configure OTP', 'CoreRealm', true, false,
        'CONFIGURE_TOTP', 10);
INSERT INTO public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority)
VALUES ('4c50bcd3-c9ce-4a96-bb4f-04e62470cd27', 'terms_and_conditions', 'Terms and Conditions', 'CoreRealm', false,
        false, 'terms_and_conditions', 20);
INSERT INTO public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority)
VALUES ('6457f06c-821f-4195-8b8e-48413a08e811', 'UPDATE_PASSWORD', 'Update Password', 'CoreRealm', true, false,
        'UPDATE_PASSWORD', 30);
INSERT INTO public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority)
VALUES ('85a5c9c6-a0ac-4f86-b933-954ba78b49e0', 'UPDATE_PROFILE', 'Update Profile', 'CoreRealm', true, false,
        'UPDATE_PROFILE', 40);
INSERT INTO public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority)
VALUES ('18d7c4c6-e9df-49fc-adc5-7d20e041f456', 'VERIFY_EMAIL', 'Verify Email', 'CoreRealm', true, false,
        'VERIFY_EMAIL', 50);
INSERT INTO public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority)
VALUES ('efcf8b3c-0c65-4481-a78f-9674452d4f65', 'delete_account', 'Delete Account', 'CoreRealm', false, false,
        'delete_account', 60);
INSERT INTO public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority)
VALUES ('63b504f0-7609-4508-9568-e767f7438130', 'update_user_locale', 'Update User Locale', 'CoreRealm', true, false,
        'update_user_locale', 1000);


--
-- TOC entry 4208 (class 0 OID 17848)
-- Dependencies: 297
-- Data for Name: resource_attribute; Type: TABLE DATA; Schema: public; Owner: magnittest
--


--
-- TOC entry 4188 (class 0 OID 17432)
-- Dependencies: 277
-- Data for Name: resource_policy; Type: TABLE DATA; Schema: public; Owner: magnittest
--


--
-- TOC entry 4187 (class 0 OID 17417)
-- Dependencies: 276
-- Data for Name: resource_scope; Type: TABLE DATA; Schema: public; Owner: magnittest
--


--
-- TOC entry 4182 (class 0 OID 17355)
-- Dependencies: 271
-- Data for Name: resource_server; Type: TABLE DATA; Schema: public; Owner: magnittest
--

INSERT INTO public.resource_server (id, allow_rs_remote_mgmt, policy_enforce_mode, decision_strategy)
VALUES ('f0c04cb9-541a-4192-ae8d-1c406fb61794', true, '0', 1);
INSERT INTO public.resource_server (id, allow_rs_remote_mgmt, policy_enforce_mode, decision_strategy)
VALUES ('d521b2b1-b33e-4a55-a524-ab3d9fb5ef93', true, '0', 1);


--
-- TOC entry 4207 (class 0 OID 17824)
-- Dependencies: 296
-- Data for Name: resource_server_perm_ticket; Type: TABLE DATA; Schema: public; Owner: magnittest
--


--
-- TOC entry 4185 (class 0 OID 17391)
-- Dependencies: 274
-- Data for Name: resource_server_policy; Type: TABLE DATA; Schema: public; Owner: magnittest
--

INSERT INTO public.resource_server_policy (id, name, description, type, decision_strategy, logic, resource_server_id,
                                           owner)
VALUES ('954ebfde-9c97-4215-831d-64b240427051', 'Default Policy',
        'A policy that grants access only for users within this realm', 'js', '0', '0',
        'f0c04cb9-541a-4192-ae8d-1c406fb61794', NULL);
INSERT INTO public.resource_server_policy (id, name, description, type, decision_strategy, logic, resource_server_id,
                                           owner)
VALUES ('bc06c310-16e1-4b62-a728-462bfb94c5b1', 'Default Permission',
        'A permission that applies to the default resource type', 'resource', '1', '0',
        'f0c04cb9-541a-4192-ae8d-1c406fb61794', NULL);
INSERT INTO public.resource_server_policy (id, name, description, type, decision_strategy, logic, resource_server_id,
                                           owner)
VALUES ('a2484a5c-c4ef-4493-b355-ef4182186009', 'Default Policy',
        'A policy that grants access only for users within this realm', 'js', '0', '0',
        'd521b2b1-b33e-4a55-a524-ab3d9fb5ef93', NULL);
INSERT INTO public.resource_server_policy (id, name, description, type, decision_strategy, logic, resource_server_id,
                                           owner)
VALUES ('e33cc715-2781-42a0-8b8f-c603b71c8efc', 'Default Permission',
        'A permission that applies to the default resource type', 'resource', '1', '0',
        'd521b2b1-b33e-4a55-a524-ab3d9fb5ef93', NULL);


--
-- TOC entry 4183 (class 0 OID 17363)
-- Dependencies: 272
-- Data for Name: resource_server_resource; Type: TABLE DATA; Schema: public; Owner: magnittest
--

INSERT INTO public.resource_server_resource (id, name, type, icon_uri, owner, resource_server_id, owner_managed_access,
                                             display_name)
VALUES ('f2987d2e-285a-4832-8924-c129acbb184c', 'Default Resource', 'urn:core:resources:default', NULL,
        'f0c04cb9-541a-4192-ae8d-1c406fb61794', 'f0c04cb9-541a-4192-ae8d-1c406fb61794', false, NULL);
INSERT INTO public.resource_server_resource (id, name, type, icon_uri, owner, resource_server_id, owner_managed_access,
                                             display_name)
VALUES ('e4179952-f0be-41d2-adc3-362244af9d24', 'Default Resource', 'urn:core:resources:default', NULL,
        'd521b2b1-b33e-4a55-a524-ab3d9fb5ef93', 'd521b2b1-b33e-4a55-a524-ab3d9fb5ef93', false, NULL);


--
-- TOC entry 4184 (class 0 OID 17377)
-- Dependencies: 273
-- Data for Name: resource_server_scope; Type: TABLE DATA; Schema: public; Owner: magnittest
--


--
-- TOC entry 4209 (class 0 OID 17866)
-- Dependencies: 298
-- Data for Name: resource_uris; Type: TABLE DATA; Schema: public; Owner: magnittest
--

INSERT INTO public.resource_uris (resource_id, value)
VALUES ('f2987d2e-285a-4832-8924-c129acbb184c', '/*');
INSERT INTO public.resource_uris (resource_id, value)
VALUES ('e4179952-f0be-41d2-adc3-362244af9d24', '/*');


--
-- TOC entry 4210 (class 0 OID 17876)
-- Dependencies: 299
-- Data for Name: role_attribute; Type: TABLE DATA; Schema: public; Owner: magnittest
--

INSERT INTO public.role_attribute (id, role_id, name, value)
VALUES ('6b65acf2-8d35-44e7-b808-98349841bc9e', '4baa610b-0454-4706-91ae-d7f5214b9728', 'test_key', 'test_value');


--
-- TOC entry 4135 (class 0 OID 16487)
-- Dependencies: 224
-- Data for Name: scope_mapping; Type: TABLE DATA; Schema: public; Owner: magnittest
--

INSERT INTO public.scope_mapping (client_id, role_id)
VALUES ('02c23fb3-34df-4dbe-8045-ce1f85f03033', '942b16d4-2bbe-4620-9b88-bedb7f7c3dd8');


--
-- TOC entry 4189 (class 0 OID 17447)
-- Dependencies: 278
-- Data for Name: scope_policy; Type: TABLE DATA; Schema: public; Owner: magnittest
--


--
-- TOC entry 4137 (class 0 OID 16493)
-- Dependencies: 226
-- Data for Name: user_attribute; Type: TABLE DATA; Schema: public; Owner: magnittest
--


--
-- TOC entry 4159 (class 0 OID 16930)
-- Dependencies: 248
-- Data for Name: user_consent; Type: TABLE DATA; Schema: public; Owner: magnittest
--


--
-- TOC entry 4205 (class 0 OID 17799)
-- Dependencies: 294
-- Data for Name: user_consent_client_scope; Type: TABLE DATA; Schema: public; Owner: magnittest
--


--
-- TOC entry 4138 (class 0 OID 16498)
-- Dependencies: 227
-- Data for Name: user_entity; Type: TABLE DATA; Schema: public; Owner: magnittest
--

INSERT INTO public.user_entity (id, email, email_constraint, email_verified, enabled, federation_link, first_name,
                                last_name, realm_id, username, created_timestamp, service_account_client_link,
                                not_before)
VALUES ('7bd1d24f-747e-4455-802f-835a307856bd', NULL, 'fc5c15fc-ac7e-40b4-8b0d-d1df0dc19397', false, true, NULL, NULL,
        NULL, 'master', 'admin', 1668445669703, NULL, 0);
INSERT INTO public.user_entity (id, email, email_constraint, email_verified, enabled, federation_link, first_name,
                                last_name, realm_id, username, created_timestamp, service_account_client_link,
                                not_before)
VALUES ('4a18bf67-13bb-49c0-8c83-bd41845f199a', NULL, 'fbcb1784-a3cc-42ce-a73c-474eab5817d4', false, true, NULL, 'test',
        'test', 'master', 'test', 1668452449597, NULL, 1668452513);
INSERT INTO public.user_entity (id, email, email_constraint, email_verified, enabled, federation_link, first_name,
                                last_name, realm_id, username, created_timestamp, service_account_client_link,
                                not_before)
VALUES ('a08e4e54-d7ad-4641-9c96-70700cf72deb', NULL, '26ee29fb-1aba-432a-96fa-ccdba3b9b1ce', false, true, NULL, NULL,
        NULL, 'master', 'service-account-core', 1668452740584, 'f0c04cb9-541a-4192-ae8d-1c406fb61794', 0);
INSERT INTO public.user_entity (id, email, email_constraint, email_verified, enabled, federation_link, first_name,
                                last_name, realm_id, username, created_timestamp, service_account_client_link,
                                not_before)
VALUES ('077bb090-ad30-4dc5-b441-6c435225b749', NULL, '96156639-b2f2-4c0d-b729-214557048861', false, true, NULL, 'test',
        NULL, 'CoreRealm', 'test', 1668453436754, NULL, 0);
INSERT INTO public.user_entity (id, email, email_constraint, email_verified, enabled, federation_link, first_name,
                                last_name, realm_id, username, created_timestamp, service_account_client_link,
                                not_before)
VALUES ('b7424c9f-e076-4bd5-935c-54f1285877f7', NULL, '98029607-a059-4e53-ac6c-dd4d21801d7e', false, true, NULL, NULL,
        NULL, 'CoreRealm', 'service-account-core', 1668454125453, 'd521b2b1-b33e-4a55-a524-ab3d9fb5ef93', 0);


--
-- TOC entry 4139 (class 0 OID 16506)
-- Dependencies: 228
-- Data for Name: user_federation_config; Type: TABLE DATA; Schema: public; Owner: magnittest
--


--
-- TOC entry 4166 (class 0 OID 17042)
-- Dependencies: 255
-- Data for Name: user_federation_mapper; Type: TABLE DATA; Schema: public; Owner: magnittest
--


--
-- TOC entry 4167 (class 0 OID 17047)
-- Dependencies: 256
-- Data for Name: user_federation_mapper_config; Type: TABLE DATA; Schema: public; Owner: magnittest
--


--
-- TOC entry 4140 (class 0 OID 16511)
-- Dependencies: 229
-- Data for Name: user_federation_provider; Type: TABLE DATA; Schema: public; Owner: magnittest
--


--
-- TOC entry 4177 (class 0 OID 17210)
-- Dependencies: 266
-- Data for Name: user_group_membership; Type: TABLE DATA; Schema: public; Owner: magnittest
--


--
-- TOC entry 4141 (class 0 OID 16516)
-- Dependencies: 230
-- Data for Name: user_required_action; Type: TABLE DATA; Schema: public; Owner: magnittest
--


--
-- TOC entry 4142 (class 0 OID 16519)
-- Dependencies: 231
-- Data for Name: user_role_mapping; Type: TABLE DATA; Schema: public; Owner: magnittest
--

INSERT INTO public.user_role_mapping (role_id, user_id)
VALUES ('ab1dabb5-455d-47b5-b81d-8d362e0b3b9e', '7bd1d24f-747e-4455-802f-835a307856bd');
INSERT INTO public.user_role_mapping (role_id, user_id)
VALUES ('f1eb6095-6dc4-4444-a63b-c9928027039f', '7bd1d24f-747e-4455-802f-835a307856bd');
INSERT INTO public.user_role_mapping (role_id, user_id)
VALUES ('ab1dabb5-455d-47b5-b81d-8d362e0b3b9e', '4a18bf67-13bb-49c0-8c83-bd41845f199a');
INSERT INTO public.user_role_mapping (role_id, user_id)
VALUES ('ab1dabb5-455d-47b5-b81d-8d362e0b3b9e', 'a08e4e54-d7ad-4641-9c96-70700cf72deb');
INSERT INTO public.user_role_mapping (role_id, user_id)
VALUES ('fa65bc50-7077-4a1b-8327-ff1120969885', 'a08e4e54-d7ad-4641-9c96-70700cf72deb');
INSERT INTO public.user_role_mapping (role_id, user_id)
VALUES ('5e811292-e413-418b-afe2-e1cb5f138927', '077bb090-ad30-4dc5-b441-6c435225b749');
INSERT INTO public.user_role_mapping (role_id, user_id)
VALUES ('324d5776-0c26-43c1-9cc2-af5f2a649827', '077bb090-ad30-4dc5-b441-6c435225b749');
INSERT INTO public.user_role_mapping (role_id, user_id)
VALUES ('5e811292-e413-418b-afe2-e1cb5f138927', 'b7424c9f-e076-4bd5-935c-54f1285877f7');
INSERT INTO public.user_role_mapping (role_id, user_id)
VALUES ('bc0e16af-e48f-4ac0-b90c-d5f72e401de3', 'b7424c9f-e076-4bd5-935c-54f1285877f7');


--
-- TOC entry 4143 (class 0 OID 16522)
-- Dependencies: 232
-- Data for Name: user_session; Type: TABLE DATA; Schema: public; Owner: magnittest
--


--
-- TOC entry 4154 (class 0 OID 16828)
-- Dependencies: 243
-- Data for Name: user_session_note; Type: TABLE DATA; Schema: public; Owner: magnittest
--


--
-- TOC entry 4136 (class 0 OID 16490)
-- Dependencies: 225
-- Data for Name: username_login_failure; Type: TABLE DATA; Schema: public; Owner: magnittest
--


--
-- TOC entry 4144 (class 0 OID 16533)
-- Dependencies: 233
-- Data for Name: web_origins; Type: TABLE DATA; Schema: public; Owner: magnittest
--

INSERT INTO public.web_origins (client_id, value)
VALUES ('20bc77ee-a5b5-49fd-a844-4ca70936bf3c', '+');
INSERT INTO public.web_origins (client_id, value)
VALUES ('51a6b69c-8ad8-458d-94dd-c8919a688046', '+');
INSERT INTO public.web_origins (client_id, value)
VALUES ('d521b2b1-b33e-4a55-a524-ab3d9fb5ef93', 'http://localhost');


--
-- TOC entry 3666 (class 2606 OID 17591)
-- Name: username_login_failure CONSTRAINT_17-2; Type: CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.username_login_failure
    ADD CONSTRAINT "CONSTRAINT_17-2" PRIMARY KEY (realm_id, username);


--
-- TOC entry 3639 (class 2606 OID 17902)
-- Name: keycloak_role UK_J3RWUVD56ONTGSUHOGM184WW2-2; Type: CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT "UK_J3RWUVD56ONTGSUHOGM184WW2-2" UNIQUE (name, client_realm_constraint);


--
-- TOC entry 3880 (class 2606 OID 17730)
-- Name: client_auth_flow_bindings c_cli_flow_bind; Type: CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.client_auth_flow_bindings
    ADD CONSTRAINT c_cli_flow_bind PRIMARY KEY (client_id, binding_name);


--
-- TOC entry 3882 (class 2606 OID 17931)
-- Name: client_scope_client c_cli_scope_bind; Type: CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.client_scope_client
    ADD CONSTRAINT c_cli_scope_bind PRIMARY KEY (client_id, scope_id);


--
-- TOC entry 3877 (class 2606 OID 17605)
-- Name: client_initial_access cnstr_client_init_acc_pk; Type: CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.client_initial_access
    ADD CONSTRAINT cnstr_client_init_acc_pk PRIMARY KEY (id);


--
-- TOC entry 3794 (class 2606 OID 17252)
-- Name: realm_default_groups con_group_id_def_groups; Type: CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT con_group_id_def_groups UNIQUE (group_id);


--
-- TOC entry 3842 (class 2606 OID 17528)
-- Name: broker_link constr_broker_link_pk; Type: CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.broker_link
    ADD CONSTRAINT constr_broker_link_pk PRIMARY KEY (identity_provider, user_id);


--
-- TOC entry 3764 (class 2606 OID 17160)
-- Name: client_user_session_note constr_cl_usr_ses_note; Type: CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.client_user_session_note
    ADD CONSTRAINT constr_cl_usr_ses_note PRIMARY KEY (client_session, name);


--
-- TOC entry 3868 (class 2606 OID 17548)
-- Name: component_config constr_component_config_pk; Type: CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.component_config
    ADD CONSTRAINT constr_component_config_pk PRIMARY KEY (id);


--
-- TOC entry 3871 (class 2606 OID 17546)
-- Name: component constr_component_pk; Type: CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.component
    ADD CONSTRAINT constr_component_pk PRIMARY KEY (id);


--
-- TOC entry 3860 (class 2606 OID 17544)
-- Name: fed_user_required_action constr_fed_required_action; Type: CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.fed_user_required_action
    ADD CONSTRAINT constr_fed_required_action PRIMARY KEY (required_action, user_id);


--
-- TOC entry 3844 (class 2606 OID 17530)
-- Name: fed_user_attribute constr_fed_user_attr_pk; Type: CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.fed_user_attribute
    ADD CONSTRAINT constr_fed_user_attr_pk PRIMARY KEY (id);


--
-- TOC entry 3847 (class 2606 OID 17532)
-- Name: fed_user_consent constr_fed_user_consent_pk; Type: CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.fed_user_consent
    ADD CONSTRAINT constr_fed_user_consent_pk PRIMARY KEY (id);


--
-- TOC entry 3852 (class 2606 OID 17538)
-- Name: fed_user_credential constr_fed_user_cred_pk; Type: CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.fed_user_credential
    ADD CONSTRAINT constr_fed_user_cred_pk PRIMARY KEY (id);


--
-- TOC entry 3856 (class 2606 OID 17540)
-- Name: fed_user_group_membership constr_fed_user_group; Type: CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.fed_user_group_membership
    ADD CONSTRAINT constr_fed_user_group PRIMARY KEY (group_id, user_id);


--
-- TOC entry 3864 (class 2606 OID 17542)
-- Name: fed_user_role_mapping constr_fed_user_role; Type: CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.fed_user_role_mapping
    ADD CONSTRAINT constr_fed_user_role PRIMARY KEY (role_id, user_id);


--
-- TOC entry 3875 (class 2606 OID 17585)
-- Name: federated_user constr_federated_user; Type: CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.federated_user
    ADD CONSTRAINT constr_federated_user PRIMARY KEY (id);


--
-- TOC entry 3796 (class 2606 OID 17689)
-- Name: realm_default_groups constr_realm_default_groups; Type: CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT constr_realm_default_groups PRIMARY KEY (realm_id, group_id);


--
-- TOC entry 3724 (class 2606 OID 17706)
-- Name: realm_enabled_event_types constr_realm_enabl_event_types; Type: CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.realm_enabled_event_types
    ADD CONSTRAINT constr_realm_enabl_event_types PRIMARY KEY (realm_id, value);


--
-- TOC entry 3653 (class 2606 OID 17708)
-- Name: realm_events_listeners constr_realm_events_listeners; Type: CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.realm_events_listeners
    ADD CONSTRAINT constr_realm_events_listeners PRIMARY KEY (realm_id, value);


--
-- TOC entry 3719 (class 2606 OID 17710)
-- Name: realm_supported_locales constr_realm_supported_locales; Type: CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.realm_supported_locales
    ADD CONSTRAINT constr_realm_supported_locales PRIMARY KEY (realm_id, value);


--
-- TOC entry 3712 (class 2606 OID 16837)
-- Name: identity_provider constraint_2b; Type: CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT constraint_2b PRIMARY KEY (internal_id);


--
-- TOC entry 3695 (class 2606 OID 16771)
-- Name: client_attributes constraint_3c; Type: CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.client_attributes
    ADD CONSTRAINT constraint_3c PRIMARY KEY (client_id, name);


--
-- TOC entry 3636 (class 2606 OID 16545)
-- Name: event_entity constraint_4; Type: CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.event_entity
    ADD CONSTRAINT constraint_4 PRIMARY KEY (id);


--
-- TOC entry 3708 (class 2606 OID 16839)
-- Name: federated_identity constraint_40; Type: CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.federated_identity
    ADD CONSTRAINT constraint_40 PRIMARY KEY (identity_provider, user_id);


--
-- TOC entry 3645 (class 2606 OID 16547)
-- Name: realm constraint_4a; Type: CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.realm
    ADD CONSTRAINT constraint_4a PRIMARY KEY (id);


--
-- TOC entry 3627 (class 2606 OID 16549)
-- Name: client_session_role constraint_5; Type: CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.client_session_role
    ADD CONSTRAINT constraint_5 PRIMARY KEY (client_session, role_id);


--
-- TOC entry 3690 (class 2606 OID 16551)
-- Name: user_session constraint_57; Type: CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.user_session
    ADD CONSTRAINT constraint_57 PRIMARY KEY (id);


--
-- TOC entry 3681 (class 2606 OID 16553)
-- Name: user_federation_provider constraint_5c; Type: CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.user_federation_provider
    ADD CONSTRAINT constraint_5c PRIMARY KEY (id);


--
-- TOC entry 3698 (class 2606 OID 16773)
-- Name: client_session_note constraint_5e; Type: CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.client_session_note
    ADD CONSTRAINT constraint_5e PRIMARY KEY (client_session, name);


--
-- TOC entry 3619 (class 2606 OID 16557)
-- Name: client constraint_7; Type: CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT constraint_7 PRIMARY KEY (id);


--
-- TOC entry 3624 (class 2606 OID 16559)
-- Name: client_session constraint_8; Type: CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.client_session
    ADD CONSTRAINT constraint_8 PRIMARY KEY (id);


--
-- TOC entry 3663 (class 2606 OID 16561)
-- Name: scope_mapping constraint_81; Type: CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.scope_mapping
    ADD CONSTRAINT constraint_81 PRIMARY KEY (client_id, role_id);


--
-- TOC entry 3700 (class 2606 OID 16775)
-- Name: client_node_registrations constraint_84; Type: CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.client_node_registrations
    ADD CONSTRAINT constraint_84 PRIMARY KEY (client_id, name);


--
-- TOC entry 3650 (class 2606 OID 16563)
-- Name: realm_attribute constraint_9; Type: CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.realm_attribute
    ADD CONSTRAINT constraint_9 PRIMARY KEY (name, realm_id);


--
-- TOC entry 3656 (class 2606 OID 16565)
-- Name: realm_required_credential constraint_92; Type: CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.realm_required_credential
    ADD CONSTRAINT constraint_92 PRIMARY KEY (realm_id, type);


--
-- TOC entry 3641 (class 2606 OID 16567)
-- Name: keycloak_role constraint_a; Type: CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT constraint_a PRIMARY KEY (id);


--
-- TOC entry 3742 (class 2606 OID 17693)
-- Name: admin_event_entity constraint_admin_event_entity; Type: CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.admin_event_entity
    ADD CONSTRAINT constraint_admin_event_entity PRIMARY KEY (id);


--
-- TOC entry 3754 (class 2606 OID 17068)
-- Name: authenticator_config_entry constraint_auth_cfg_pk; Type: CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.authenticator_config_entry
    ADD CONSTRAINT constraint_auth_cfg_pk PRIMARY KEY (authenticator_id, name);


--
-- TOC entry 3750 (class 2606 OID 17066)
-- Name: authentication_execution constraint_auth_exec_pk; Type: CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT constraint_auth_exec_pk PRIMARY KEY (id);


--
-- TOC entry 3747 (class 2606 OID 17064)
-- Name: authentication_flow constraint_auth_flow_pk; Type: CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.authentication_flow
    ADD CONSTRAINT constraint_auth_flow_pk PRIMARY KEY (id);


--
-- TOC entry 3744 (class 2606 OID 17062)
-- Name: authenticator_config constraint_auth_pk; Type: CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.authenticator_config
    ADD CONSTRAINT constraint_auth_pk PRIMARY KEY (id);


--
-- TOC entry 3762 (class 2606 OID 17072)
-- Name: client_session_auth_status constraint_auth_status_pk; Type: CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.client_session_auth_status
    ADD CONSTRAINT constraint_auth_status_pk PRIMARY KEY (client_session, authenticator);


--
-- TOC entry 3687 (class 2606 OID 16569)
-- Name: user_role_mapping constraint_c; Type: CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.user_role_mapping
    ADD CONSTRAINT constraint_c PRIMARY KEY (role_id, user_id);


--
-- TOC entry 3629 (class 2606 OID 17687)
-- Name: composite_role constraint_composite_role; Type: CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT constraint_composite_role PRIMARY KEY (composite, child_role);


--
-- TOC entry 3740 (class 2606 OID 16955)
-- Name: client_session_prot_mapper constraint_cs_pmp_pk; Type: CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.client_session_prot_mapper
    ADD CONSTRAINT constraint_cs_pmp_pk PRIMARY KEY (client_session, protocol_mapper_id);


--
-- TOC entry 3717 (class 2606 OID 16841)
-- Name: identity_provider_config constraint_d; Type: CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.identity_provider_config
    ADD CONSTRAINT constraint_d PRIMARY KEY (identity_provider_id, name);


--
-- TOC entry 3828 (class 2606 OID 17411)
-- Name: policy_config constraint_dpc; Type: CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.policy_config
    ADD CONSTRAINT constraint_dpc PRIMARY KEY (policy_id, name);


--
-- TOC entry 3658 (class 2606 OID 16571)
-- Name: realm_smtp_config constraint_e; Type: CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.realm_smtp_config
    ADD CONSTRAINT constraint_e PRIMARY KEY (realm_id, name);


--
-- TOC entry 3633 (class 2606 OID 16573)
-- Name: credential constraint_f; Type: CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.credential
    ADD CONSTRAINT constraint_f PRIMARY KEY (id);


--
-- TOC entry 3679 (class 2606 OID 16575)
-- Name: user_federation_config constraint_f9; Type: CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.user_federation_config
    ADD CONSTRAINT constraint_f9 PRIMARY KEY (user_federation_provider_id, name);


--
-- TOC entry 3895 (class 2606 OID 17828)
-- Name: resource_server_perm_ticket constraint_fapmt; Type: CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT constraint_fapmt PRIMARY KEY (id);


--
-- TOC entry 3813 (class 2606 OID 17369)
-- Name: resource_server_resource constraint_farsr; Type: CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT constraint_farsr PRIMARY KEY (id);


--
-- TOC entry 3823 (class 2606 OID 17397)
-- Name: resource_server_policy constraint_farsrp; Type: CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT constraint_farsrp PRIMARY KEY (id);


--
-- TOC entry 3839 (class 2606 OID 17466)
-- Name: associated_policy constraint_farsrpap; Type: CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT constraint_farsrpap PRIMARY KEY (policy_id, associated_policy_id);


--
-- TOC entry 3833 (class 2606 OID 17436)
-- Name: resource_policy constraint_farsrpp; Type: CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT constraint_farsrpp PRIMARY KEY (resource_id, policy_id);


--
-- TOC entry 3818 (class 2606 OID 17383)
-- Name: resource_server_scope constraint_farsrs; Type: CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT constraint_farsrs PRIMARY KEY (id);


--
-- TOC entry 3830 (class 2606 OID 17421)
-- Name: resource_scope constraint_farsrsp; Type: CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT constraint_farsrsp PRIMARY KEY (resource_id, scope_id);


--
-- TOC entry 3836 (class 2606 OID 17451)
-- Name: scope_policy constraint_farsrsps; Type: CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT constraint_farsrsps PRIMARY KEY (scope_id, policy_id);


--
-- TOC entry 3672 (class 2606 OID 16577)
-- Name: user_entity constraint_fb; Type: CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT constraint_fb PRIMARY KEY (id);


--
-- TOC entry 3760 (class 2606 OID 17076)
-- Name: user_federation_mapper_config constraint_fedmapper_cfg_pm; Type: CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.user_federation_mapper_config
    ADD CONSTRAINT constraint_fedmapper_cfg_pm PRIMARY KEY (user_federation_mapper_id, name);


--
-- TOC entry 3756 (class 2606 OID 17074)
-- Name: user_federation_mapper constraint_fedmapperpm; Type: CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT constraint_fedmapperpm PRIMARY KEY (id);


--
-- TOC entry 3893 (class 2606 OID 17813)
-- Name: fed_user_consent_cl_scope constraint_fgrntcsnt_clsc_pm; Type: CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.fed_user_consent_cl_scope
    ADD CONSTRAINT constraint_fgrntcsnt_clsc_pm PRIMARY KEY (user_consent_id, scope_id);


--
-- TOC entry 3890 (class 2606 OID 17803)
-- Name: user_consent_client_scope constraint_grntcsnt_clsc_pm; Type: CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.user_consent_client_scope
    ADD CONSTRAINT constraint_grntcsnt_clsc_pm PRIMARY KEY (user_consent_id, scope_id);


--
-- TOC entry 3735 (class 2606 OID 16949)
-- Name: user_consent constraint_grntcsnt_pm; Type: CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT constraint_grntcsnt_pm PRIMARY KEY (id);


--
-- TOC entry 3781 (class 2606 OID 17219)
-- Name: keycloak_group constraint_group; Type: CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.keycloak_group
    ADD CONSTRAINT constraint_group PRIMARY KEY (id);


--
-- TOC entry 3788 (class 2606 OID 17226)
-- Name: group_attribute constraint_group_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.group_attribute
    ADD CONSTRAINT constraint_group_attribute_pk PRIMARY KEY (id);


--
-- TOC entry 3785 (class 2606 OID 17240)
-- Name: group_role_mapping constraint_group_role; Type: CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.group_role_mapping
    ADD CONSTRAINT constraint_group_role PRIMARY KEY (role_id, group_id);


--
-- TOC entry 3730 (class 2606 OID 16945)
-- Name: identity_provider_mapper constraint_idpm; Type: CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.identity_provider_mapper
    ADD CONSTRAINT constraint_idpm PRIMARY KEY (id);


--
-- TOC entry 3733 (class 2606 OID 17125)
-- Name: idp_mapper_config constraint_idpmconfig; Type: CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.idp_mapper_config
    ADD CONSTRAINT constraint_idpmconfig PRIMARY KEY (idp_mapper_id, name);


--
-- TOC entry 3727 (class 2606 OID 16943)
-- Name: migration_model constraint_migmod; Type: CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.migration_model
    ADD CONSTRAINT constraint_migmod PRIMARY KEY (id);


--
-- TOC entry 3777 (class 2606 OID 17908)
-- Name: offline_client_session constraint_offl_cl_ses_pk3; Type: CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.offline_client_session
    ADD CONSTRAINT constraint_offl_cl_ses_pk3 PRIMARY KEY (user_session_id, client_id, client_storage_provider,
                                                           external_client_id, offline_flag);


--
-- TOC entry 3771 (class 2606 OID 17195)
-- Name: offline_user_session constraint_offl_us_ses_pk2; Type: CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.offline_user_session
    ADD CONSTRAINT constraint_offl_us_ses_pk2 PRIMARY KEY (user_session_id, offline_flag);


--
-- TOC entry 3702 (class 2606 OID 16835)
-- Name: protocol_mapper constraint_pcm; Type: CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT constraint_pcm PRIMARY KEY (id);


--
-- TOC entry 3706 (class 2606 OID 17118)
-- Name: protocol_mapper_config constraint_pmconfig; Type: CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.protocol_mapper_config
    ADD CONSTRAINT constraint_pmconfig PRIMARY KEY (protocol_mapper_id, name);


--
-- TOC entry 3660 (class 2606 OID 17712)
-- Name: redirect_uris constraint_redirect_uris; Type: CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.redirect_uris
    ADD CONSTRAINT constraint_redirect_uris PRIMARY KEY (client_id, value);


--
-- TOC entry 3769 (class 2606 OID 17158)
-- Name: required_action_config constraint_req_act_cfg_pk; Type: CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.required_action_config
    ADD CONSTRAINT constraint_req_act_cfg_pk PRIMARY KEY (required_action_id, name);


--
-- TOC entry 3766 (class 2606 OID 17156)
-- Name: required_action_provider constraint_req_act_prv_pk; Type: CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.required_action_provider
    ADD CONSTRAINT constraint_req_act_prv_pk PRIMARY KEY (id);


--
-- TOC entry 3684 (class 2606 OID 17070)
-- Name: user_required_action constraint_required_action; Type: CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.user_required_action
    ADD CONSTRAINT constraint_required_action PRIMARY KEY (required_action, user_id);


--
-- TOC entry 3901 (class 2606 OID 17875)
-- Name: resource_uris constraint_resour_uris_pk; Type: CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.resource_uris
    ADD CONSTRAINT constraint_resour_uris_pk PRIMARY KEY (resource_id, value);


--
-- TOC entry 3903 (class 2606 OID 17882)
-- Name: role_attribute constraint_role_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.role_attribute
    ADD CONSTRAINT constraint_role_attribute_pk PRIMARY KEY (id);


--
-- TOC entry 3668 (class 2606 OID 17154)
-- Name: user_attribute constraint_user_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT constraint_user_attribute_pk PRIMARY KEY (id);


--
-- TOC entry 3791 (class 2606 OID 17233)
-- Name: user_group_membership constraint_user_group; Type: CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.user_group_membership
    ADD CONSTRAINT constraint_user_group PRIMARY KEY (group_id, user_id);


--
-- TOC entry 3722 (class 2606 OID 16845)
-- Name: user_session_note constraint_usn_pk; Type: CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.user_session_note
    ADD CONSTRAINT constraint_usn_pk PRIMARY KEY (user_session, name);


--
-- TOC entry 3692 (class 2606 OID 17714)
-- Name: web_origins constraint_web_origins; Type: CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.web_origins
    ADD CONSTRAINT constraint_web_origins PRIMARY KEY (client_id, value);


--
-- TOC entry 3805 (class 2606 OID 17336)
-- Name: client_scope_attributes pk_cl_tmpl_attr; Type: CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.client_scope_attributes
    ADD CONSTRAINT pk_cl_tmpl_attr PRIMARY KEY (scope_id, name);


--
-- TOC entry 3800 (class 2606 OID 17295)
-- Name: client_scope pk_cli_template; Type: CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.client_scope
    ADD CONSTRAINT pk_cli_template PRIMARY KEY (id);


--
-- TOC entry 3617 (class 2606 OID 16389)
-- Name: databasechangeloglock pk_databasechangeloglock; Type: CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.databasechangeloglock
    ADD CONSTRAINT pk_databasechangeloglock PRIMARY KEY (id);


--
-- TOC entry 3811 (class 2606 OID 17667)
-- Name: resource_server pk_resource_server; Type: CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.resource_server
    ADD CONSTRAINT pk_resource_server PRIMARY KEY (id);


--
-- TOC entry 3809 (class 2606 OID 17324)
-- Name: client_scope_role_mapping pk_template_scope; Type: CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.client_scope_role_mapping
    ADD CONSTRAINT pk_template_scope PRIMARY KEY (scope_id, role_id);


--
-- TOC entry 3888 (class 2606 OID 17788)
-- Name: default_client_scope r_def_cli_scope_bind; Type: CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.default_client_scope
    ADD CONSTRAINT r_def_cli_scope_bind PRIMARY KEY (realm_id, scope_id);


--
-- TOC entry 3906 (class 2606 OID 17925)
-- Name: realm_localizations realm_localizations_pkey; Type: CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.realm_localizations
    ADD CONSTRAINT realm_localizations_pkey PRIMARY KEY (realm_id, locale);


--
-- TOC entry 3899 (class 2606 OID 17855)
-- Name: resource_attribute res_attr_pk; Type: CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.resource_attribute
    ADD CONSTRAINT res_attr_pk PRIMARY KEY (id);


--
-- TOC entry 3783 (class 2606 OID 17597)
-- Name: keycloak_group sibling_names; Type: CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.keycloak_group
    ADD CONSTRAINT sibling_names UNIQUE (realm_id, parent_group, name);


--
-- TOC entry 3715 (class 2606 OID 16892)
-- Name: identity_provider uk_2daelwnibji49avxsrtuf6xj33; Type: CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT uk_2daelwnibji49avxsrtuf6xj33 UNIQUE (provider_alias, realm_id);


--
-- TOC entry 3622 (class 2606 OID 16581)
-- Name: client uk_b71cjlbenv945rb6gcon438at; Type: CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT uk_b71cjlbenv945rb6gcon438at UNIQUE (realm_id, client_id);


--
-- TOC entry 3802 (class 2606 OID 17741)
-- Name: client_scope uk_cli_scope; Type: CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.client_scope
    ADD CONSTRAINT uk_cli_scope UNIQUE (realm_id, name);


--
-- TOC entry 3675 (class 2606 OID 16585)
-- Name: user_entity uk_dykn684sl8up1crfei6eckhd7; Type: CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT uk_dykn684sl8up1crfei6eckhd7 UNIQUE (realm_id, email_constraint);


--
-- TOC entry 3816 (class 2606 OID 17916)
-- Name: resource_server_resource uk_frsr6t700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT uk_frsr6t700s9v50bu18ws5ha6 UNIQUE (name, owner, resource_server_id);


--
-- TOC entry 3897 (class 2606 OID 17912)
-- Name: resource_server_perm_ticket uk_frsr6t700s9v50bu18ws5pmt; Type: CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT uk_frsr6t700s9v50bu18ws5pmt UNIQUE (owner, requester, resource_server_id, resource_id, scope_id);


--
-- TOC entry 3826 (class 2606 OID 17658)
-- Name: resource_server_policy uk_frsrpt700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT uk_frsrpt700s9v50bu18ws5ha6 UNIQUE (name, resource_server_id);


--
-- TOC entry 3821 (class 2606 OID 17662)
-- Name: resource_server_scope uk_frsrst700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT uk_frsrst700s9v50bu18ws5ha6 UNIQUE (name, resource_server_id);


--
-- TOC entry 3738 (class 2606 OID 17904)
-- Name: user_consent uk_jkuwuvd56ontgsuhogm8uewrt; Type: CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT uk_jkuwuvd56ontgsuhogm8uewrt UNIQUE (client_id, client_storage_provider, external_client_id, user_id);


--
-- TOC entry 3648 (class 2606 OID 16593)
-- Name: realm uk_orvsdmla56612eaefiq6wl5oi; Type: CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.realm
    ADD CONSTRAINT uk_orvsdmla56612eaefiq6wl5oi UNIQUE (name);


--
-- TOC entry 3677 (class 2606 OID 17587)
-- Name: user_entity uk_ru8tt6t700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT uk_ru8tt6t700s9v50bu18ws5ha6 UNIQUE (realm_id, username);


--
-- TOC entry 3840 (class 1259 OID 17611)
-- Name: idx_assoc_pol_assoc_pol_id; Type: INDEX; Schema: public; Owner: magnittest
--

CREATE INDEX idx_assoc_pol_assoc_pol_id ON public.associated_policy USING btree (associated_policy_id);


--
-- TOC entry 3745 (class 1259 OID 17615)
-- Name: idx_auth_config_realm; Type: INDEX; Schema: public; Owner: magnittest
--

CREATE INDEX idx_auth_config_realm ON public.authenticator_config USING btree (realm_id);


--
-- TOC entry 3751 (class 1259 OID 17613)
-- Name: idx_auth_exec_flow; Type: INDEX; Schema: public; Owner: magnittest
--

CREATE INDEX idx_auth_exec_flow ON public.authentication_execution USING btree (flow_id);


--
-- TOC entry 3752 (class 1259 OID 17612)
-- Name: idx_auth_exec_realm_flow; Type: INDEX; Schema: public; Owner: magnittest
--

CREATE INDEX idx_auth_exec_realm_flow ON public.authentication_execution USING btree (realm_id, flow_id);


--
-- TOC entry 3748 (class 1259 OID 17614)
-- Name: idx_auth_flow_realm; Type: INDEX; Schema: public; Owner: magnittest
--

CREATE INDEX idx_auth_flow_realm ON public.authentication_flow USING btree (realm_id);


--
-- TOC entry 3883 (class 1259 OID 17932)
-- Name: idx_cl_clscope; Type: INDEX; Schema: public; Owner: magnittest
--

CREATE INDEX idx_cl_clscope ON public.client_scope_client USING btree (scope_id);


--
-- TOC entry 3696 (class 1259 OID 17938)
-- Name: idx_client_att_by_name_value; Type: INDEX; Schema: public; Owner: magnittest
--

CREATE INDEX idx_client_att_by_name_value ON public.client_attributes USING btree (name, ((value)::character varying(250)));


--
-- TOC entry 3620 (class 1259 OID 17917)
-- Name: idx_client_id; Type: INDEX; Schema: public; Owner: magnittest
--

CREATE INDEX idx_client_id ON public.client USING btree (client_id);


--
-- TOC entry 3878 (class 1259 OID 17655)
-- Name: idx_client_init_acc_realm; Type: INDEX; Schema: public; Owner: magnittest
--

CREATE INDEX idx_client_init_acc_realm ON public.client_initial_access USING btree (realm_id);


--
-- TOC entry 3625 (class 1259 OID 17619)
-- Name: idx_client_session_session; Type: INDEX; Schema: public; Owner: magnittest
--

CREATE INDEX idx_client_session_session ON public.client_session USING btree (session_id);


--
-- TOC entry 3803 (class 1259 OID 17818)
-- Name: idx_clscope_attrs; Type: INDEX; Schema: public; Owner: magnittest
--

CREATE INDEX idx_clscope_attrs ON public.client_scope_attributes USING btree (scope_id);


--
-- TOC entry 3884 (class 1259 OID 17929)
-- Name: idx_clscope_cl; Type: INDEX; Schema: public; Owner: magnittest
--

CREATE INDEX idx_clscope_cl ON public.client_scope_client USING btree (client_id);


--
-- TOC entry 3703 (class 1259 OID 17815)
-- Name: idx_clscope_protmap; Type: INDEX; Schema: public; Owner: magnittest
--

CREATE INDEX idx_clscope_protmap ON public.protocol_mapper USING btree (client_scope_id);


--
-- TOC entry 3806 (class 1259 OID 17816)
-- Name: idx_clscope_role; Type: INDEX; Schema: public; Owner: magnittest
--

CREATE INDEX idx_clscope_role ON public.client_scope_role_mapping USING btree (scope_id);


--
-- TOC entry 3869 (class 1259 OID 17621)
-- Name: idx_compo_config_compo; Type: INDEX; Schema: public; Owner: magnittest
--

CREATE INDEX idx_compo_config_compo ON public.component_config USING btree (component_id);


--
-- TOC entry 3872 (class 1259 OID 17889)
-- Name: idx_component_provider_type; Type: INDEX; Schema: public; Owner: magnittest
--

CREATE INDEX idx_component_provider_type ON public.component USING btree (provider_type);


--
-- TOC entry 3873 (class 1259 OID 17620)
-- Name: idx_component_realm; Type: INDEX; Schema: public; Owner: magnittest
--

CREATE INDEX idx_component_realm ON public.component USING btree (realm_id);


--
-- TOC entry 3630 (class 1259 OID 17622)
-- Name: idx_composite; Type: INDEX; Schema: public; Owner: magnittest
--

CREATE INDEX idx_composite ON public.composite_role USING btree (composite);


--
-- TOC entry 3631 (class 1259 OID 17623)
-- Name: idx_composite_child; Type: INDEX; Schema: public; Owner: magnittest
--

CREATE INDEX idx_composite_child ON public.composite_role USING btree (child_role);


--
-- TOC entry 3885 (class 1259 OID 17821)
-- Name: idx_defcls_realm; Type: INDEX; Schema: public; Owner: magnittest
--

CREATE INDEX idx_defcls_realm ON public.default_client_scope USING btree (realm_id);


--
-- TOC entry 3886 (class 1259 OID 17822)
-- Name: idx_defcls_scope; Type: INDEX; Schema: public; Owner: magnittest
--

CREATE INDEX idx_defcls_scope ON public.default_client_scope USING btree (scope_id);


--
-- TOC entry 3637 (class 1259 OID 17918)
-- Name: idx_event_time; Type: INDEX; Schema: public; Owner: magnittest
--

CREATE INDEX idx_event_time ON public.event_entity USING btree (realm_id, event_time);


--
-- TOC entry 3709 (class 1259 OID 17354)
-- Name: idx_fedidentity_feduser; Type: INDEX; Schema: public; Owner: magnittest
--

CREATE INDEX idx_fedidentity_feduser ON public.federated_identity USING btree (federated_user_id);


--
-- TOC entry 3710 (class 1259 OID 17353)
-- Name: idx_fedidentity_user; Type: INDEX; Schema: public; Owner: magnittest
--

CREATE INDEX idx_fedidentity_user ON public.federated_identity USING btree (user_id);


--
-- TOC entry 3845 (class 1259 OID 17715)
-- Name: idx_fu_attribute; Type: INDEX; Schema: public; Owner: magnittest
--

CREATE INDEX idx_fu_attribute ON public.fed_user_attribute USING btree (user_id, realm_id, name);


--
-- TOC entry 3848 (class 1259 OID 17735)
-- Name: idx_fu_cnsnt_ext; Type: INDEX; Schema: public; Owner: magnittest
--

CREATE INDEX idx_fu_cnsnt_ext ON public.fed_user_consent USING btree (user_id, client_storage_provider, external_client_id);


--
-- TOC entry 3849 (class 1259 OID 17900)
-- Name: idx_fu_consent; Type: INDEX; Schema: public; Owner: magnittest
--

CREATE INDEX idx_fu_consent ON public.fed_user_consent USING btree (user_id, client_id);


--
-- TOC entry 3850 (class 1259 OID 17717)
-- Name: idx_fu_consent_ru; Type: INDEX; Schema: public; Owner: magnittest
--

CREATE INDEX idx_fu_consent_ru ON public.fed_user_consent USING btree (realm_id, user_id);


--
-- TOC entry 3853 (class 1259 OID 17718)
-- Name: idx_fu_credential; Type: INDEX; Schema: public; Owner: magnittest
--

CREATE INDEX idx_fu_credential ON public.fed_user_credential USING btree (user_id, type);


--
-- TOC entry 3854 (class 1259 OID 17719)
-- Name: idx_fu_credential_ru; Type: INDEX; Schema: public; Owner: magnittest
--

CREATE INDEX idx_fu_credential_ru ON public.fed_user_credential USING btree (realm_id, user_id);


--
-- TOC entry 3857 (class 1259 OID 17720)
-- Name: idx_fu_group_membership; Type: INDEX; Schema: public; Owner: magnittest
--

CREATE INDEX idx_fu_group_membership ON public.fed_user_group_membership USING btree (user_id, group_id);


--
-- TOC entry 3858 (class 1259 OID 17721)
-- Name: idx_fu_group_membership_ru; Type: INDEX; Schema: public; Owner: magnittest
--

CREATE INDEX idx_fu_group_membership_ru ON public.fed_user_group_membership USING btree (realm_id, user_id);


--
-- TOC entry 3861 (class 1259 OID 17722)
-- Name: idx_fu_required_action; Type: INDEX; Schema: public; Owner: magnittest
--

CREATE INDEX idx_fu_required_action ON public.fed_user_required_action USING btree (user_id, required_action);


--
-- TOC entry 3862 (class 1259 OID 17723)
-- Name: idx_fu_required_action_ru; Type: INDEX; Schema: public; Owner: magnittest
--

CREATE INDEX idx_fu_required_action_ru ON public.fed_user_required_action USING btree (realm_id, user_id);


--
-- TOC entry 3865 (class 1259 OID 17724)
-- Name: idx_fu_role_mapping; Type: INDEX; Schema: public; Owner: magnittest
--

CREATE INDEX idx_fu_role_mapping ON public.fed_user_role_mapping USING btree (user_id, role_id);


--
-- TOC entry 3866 (class 1259 OID 17725)
-- Name: idx_fu_role_mapping_ru; Type: INDEX; Schema: public; Owner: magnittest
--

CREATE INDEX idx_fu_role_mapping_ru ON public.fed_user_role_mapping USING btree (realm_id, user_id);


--
-- TOC entry 3789 (class 1259 OID 17626)
-- Name: idx_group_attr_group; Type: INDEX; Schema: public; Owner: magnittest
--

CREATE INDEX idx_group_attr_group ON public.group_attribute USING btree (group_id);


--
-- TOC entry 3786 (class 1259 OID 17627)
-- Name: idx_group_role_mapp_group; Type: INDEX; Schema: public; Owner: magnittest
--

CREATE INDEX idx_group_role_mapp_group ON public.group_role_mapping USING btree (group_id);


--
-- TOC entry 3731 (class 1259 OID 17629)
-- Name: idx_id_prov_mapp_realm; Type: INDEX; Schema: public; Owner: magnittest
--

CREATE INDEX idx_id_prov_mapp_realm ON public.identity_provider_mapper USING btree (realm_id);


--
-- TOC entry 3713 (class 1259 OID 17628)
-- Name: idx_ident_prov_realm; Type: INDEX; Schema: public; Owner: magnittest
--

CREATE INDEX idx_ident_prov_realm ON public.identity_provider USING btree (realm_id);


--
-- TOC entry 3642 (class 1259 OID 17630)
-- Name: idx_keycloak_role_client; Type: INDEX; Schema: public; Owner: magnittest
--

CREATE INDEX idx_keycloak_role_client ON public.keycloak_role USING btree (client);


--
-- TOC entry 3643 (class 1259 OID 17631)
-- Name: idx_keycloak_role_realm; Type: INDEX; Schema: public; Owner: magnittest
--

CREATE INDEX idx_keycloak_role_realm ON public.keycloak_role USING btree (realm);


--
-- TOC entry 3778 (class 1259 OID 17935)
-- Name: idx_offline_css_preload; Type: INDEX; Schema: public; Owner: magnittest
--

CREATE INDEX idx_offline_css_preload ON public.offline_client_session USING btree (client_id, offline_flag);


--
-- TOC entry 3772 (class 1259 OID 17936)
-- Name: idx_offline_uss_by_user; Type: INDEX; Schema: public; Owner: magnittest
--

CREATE INDEX idx_offline_uss_by_user ON public.offline_user_session USING btree (user_id, realm_id, offline_flag);


--
-- TOC entry 3773 (class 1259 OID 17937)
-- Name: idx_offline_uss_by_usersess; Type: INDEX; Schema: public; Owner: magnittest
--

CREATE INDEX idx_offline_uss_by_usersess ON public.offline_user_session USING btree (realm_id, offline_flag, user_session_id);


--
-- TOC entry 3774 (class 1259 OID 17893)
-- Name: idx_offline_uss_createdon; Type: INDEX; Schema: public; Owner: magnittest
--

CREATE INDEX idx_offline_uss_createdon ON public.offline_user_session USING btree (created_on);


--
-- TOC entry 3775 (class 1259 OID 17926)
-- Name: idx_offline_uss_preload; Type: INDEX; Schema: public; Owner: magnittest
--

CREATE INDEX idx_offline_uss_preload ON public.offline_user_session USING btree (offline_flag, created_on, user_session_id);


--
-- TOC entry 3704 (class 1259 OID 17632)
-- Name: idx_protocol_mapper_client; Type: INDEX; Schema: public; Owner: magnittest
--

CREATE INDEX idx_protocol_mapper_client ON public.protocol_mapper USING btree (client_id);


--
-- TOC entry 3651 (class 1259 OID 17635)
-- Name: idx_realm_attr_realm; Type: INDEX; Schema: public; Owner: magnittest
--

CREATE INDEX idx_realm_attr_realm ON public.realm_attribute USING btree (realm_id);


--
-- TOC entry 3798 (class 1259 OID 17814)
-- Name: idx_realm_clscope; Type: INDEX; Schema: public; Owner: magnittest
--

CREATE INDEX idx_realm_clscope ON public.client_scope USING btree (realm_id);


--
-- TOC entry 3797 (class 1259 OID 17636)
-- Name: idx_realm_def_grp_realm; Type: INDEX; Schema: public; Owner: magnittest
--

CREATE INDEX idx_realm_def_grp_realm ON public.realm_default_groups USING btree (realm_id);


--
-- TOC entry 3654 (class 1259 OID 17639)
-- Name: idx_realm_evt_list_realm; Type: INDEX; Schema: public; Owner: magnittest
--

CREATE INDEX idx_realm_evt_list_realm ON public.realm_events_listeners USING btree (realm_id);


--
-- TOC entry 3725 (class 1259 OID 17638)
-- Name: idx_realm_evt_types_realm; Type: INDEX; Schema: public; Owner: magnittest
--

CREATE INDEX idx_realm_evt_types_realm ON public.realm_enabled_event_types USING btree (realm_id);


--
-- TOC entry 3646 (class 1259 OID 17634)
-- Name: idx_realm_master_adm_cli; Type: INDEX; Schema: public; Owner: magnittest
--

CREATE INDEX idx_realm_master_adm_cli ON public.realm USING btree (master_admin_client);


--
-- TOC entry 3720 (class 1259 OID 17640)
-- Name: idx_realm_supp_local_realm; Type: INDEX; Schema: public; Owner: magnittest
--

CREATE INDEX idx_realm_supp_local_realm ON public.realm_supported_locales USING btree (realm_id);


--
-- TOC entry 3661 (class 1259 OID 17641)
-- Name: idx_redir_uri_client; Type: INDEX; Schema: public; Owner: magnittest
--

CREATE INDEX idx_redir_uri_client ON public.redirect_uris USING btree (client_id);


--
-- TOC entry 3767 (class 1259 OID 17642)
-- Name: idx_req_act_prov_realm; Type: INDEX; Schema: public; Owner: magnittest
--

CREATE INDEX idx_req_act_prov_realm ON public.required_action_provider USING btree (realm_id);


--
-- TOC entry 3834 (class 1259 OID 17643)
-- Name: idx_res_policy_policy; Type: INDEX; Schema: public; Owner: magnittest
--

CREATE INDEX idx_res_policy_policy ON public.resource_policy USING btree (policy_id);


--
-- TOC entry 3831 (class 1259 OID 17644)
-- Name: idx_res_scope_scope; Type: INDEX; Schema: public; Owner: magnittest
--

CREATE INDEX idx_res_scope_scope ON public.resource_scope USING btree (scope_id);


--
-- TOC entry 3824 (class 1259 OID 17663)
-- Name: idx_res_serv_pol_res_serv; Type: INDEX; Schema: public; Owner: magnittest
--

CREATE INDEX idx_res_serv_pol_res_serv ON public.resource_server_policy USING btree (resource_server_id);


--
-- TOC entry 3814 (class 1259 OID 17664)
-- Name: idx_res_srv_res_res_srv; Type: INDEX; Schema: public; Owner: magnittest
--

CREATE INDEX idx_res_srv_res_res_srv ON public.resource_server_resource USING btree (resource_server_id);


--
-- TOC entry 3819 (class 1259 OID 17665)
-- Name: idx_res_srv_scope_res_srv; Type: INDEX; Schema: public; Owner: magnittest
--

CREATE INDEX idx_res_srv_scope_res_srv ON public.resource_server_scope USING btree (resource_server_id);


--
-- TOC entry 3904 (class 1259 OID 17888)
-- Name: idx_role_attribute; Type: INDEX; Schema: public; Owner: magnittest
--

CREATE INDEX idx_role_attribute ON public.role_attribute USING btree (role_id);


--
-- TOC entry 3807 (class 1259 OID 17817)
-- Name: idx_role_clscope; Type: INDEX; Schema: public; Owner: magnittest
--

CREATE INDEX idx_role_clscope ON public.client_scope_role_mapping USING btree (role_id);


--
-- TOC entry 3664 (class 1259 OID 17648)
-- Name: idx_scope_mapping_role; Type: INDEX; Schema: public; Owner: magnittest
--

CREATE INDEX idx_scope_mapping_role ON public.scope_mapping USING btree (role_id);


--
-- TOC entry 3837 (class 1259 OID 17649)
-- Name: idx_scope_policy_policy; Type: INDEX; Schema: public; Owner: magnittest
--

CREATE INDEX idx_scope_policy_policy ON public.scope_policy USING btree (policy_id);


--
-- TOC entry 3728 (class 1259 OID 17898)
-- Name: idx_update_time; Type: INDEX; Schema: public; Owner: magnittest
--

CREATE INDEX idx_update_time ON public.migration_model USING btree (update_time);


--
-- TOC entry 3779 (class 1259 OID 17343)
-- Name: idx_us_sess_id_on_cl_sess; Type: INDEX; Schema: public; Owner: magnittest
--

CREATE INDEX idx_us_sess_id_on_cl_sess ON public.offline_client_session USING btree (user_session_id);


--
-- TOC entry 3891 (class 1259 OID 17823)
-- Name: idx_usconsent_clscope; Type: INDEX; Schema: public; Owner: magnittest
--

CREATE INDEX idx_usconsent_clscope ON public.user_consent_client_scope USING btree (user_consent_id);


--
-- TOC entry 3669 (class 1259 OID 17350)
-- Name: idx_user_attribute; Type: INDEX; Schema: public; Owner: magnittest
--

CREATE INDEX idx_user_attribute ON public.user_attribute USING btree (user_id);


--
-- TOC entry 3670 (class 1259 OID 17939)
-- Name: idx_user_attribute_name; Type: INDEX; Schema: public; Owner: magnittest
--

CREATE INDEX idx_user_attribute_name ON public.user_attribute USING btree (name, value);


--
-- TOC entry 3736 (class 1259 OID 17347)
-- Name: idx_user_consent; Type: INDEX; Schema: public; Owner: magnittest
--

CREATE INDEX idx_user_consent ON public.user_consent USING btree (user_id);


--
-- TOC entry 3634 (class 1259 OID 17351)
-- Name: idx_user_credential; Type: INDEX; Schema: public; Owner: magnittest
--

CREATE INDEX idx_user_credential ON public.credential USING btree (user_id);


--
-- TOC entry 3673 (class 1259 OID 17344)
-- Name: idx_user_email; Type: INDEX; Schema: public; Owner: magnittest
--

CREATE INDEX idx_user_email ON public.user_entity USING btree (email);


--
-- TOC entry 3792 (class 1259 OID 17346)
-- Name: idx_user_group_mapping; Type: INDEX; Schema: public; Owner: magnittest
--

CREATE INDEX idx_user_group_mapping ON public.user_group_membership USING btree (user_id);


--
-- TOC entry 3685 (class 1259 OID 17352)
-- Name: idx_user_reqactions; Type: INDEX; Schema: public; Owner: magnittest
--

CREATE INDEX idx_user_reqactions ON public.user_required_action USING btree (user_id);


--
-- TOC entry 3688 (class 1259 OID 17345)
-- Name: idx_user_role_mapping; Type: INDEX; Schema: public; Owner: magnittest
--

CREATE INDEX idx_user_role_mapping ON public.user_role_mapping USING btree (user_id);


--
-- TOC entry 3757 (class 1259 OID 17651)
-- Name: idx_usr_fed_map_fed_prv; Type: INDEX; Schema: public; Owner: magnittest
--

CREATE INDEX idx_usr_fed_map_fed_prv ON public.user_federation_mapper USING btree (federation_provider_id);


--
-- TOC entry 3758 (class 1259 OID 17652)
-- Name: idx_usr_fed_map_realm; Type: INDEX; Schema: public; Owner: magnittest
--

CREATE INDEX idx_usr_fed_map_realm ON public.user_federation_mapper USING btree (realm_id);


--
-- TOC entry 3682 (class 1259 OID 17653)
-- Name: idx_usr_fed_prv_realm; Type: INDEX; Schema: public; Owner: magnittest
--

CREATE INDEX idx_usr_fed_prv_realm ON public.user_federation_provider USING btree (realm_id);


--
-- TOC entry 3693 (class 1259 OID 17654)
-- Name: idx_web_orig_client; Type: INDEX; Schema: public; Owner: magnittest
--

CREATE INDEX idx_web_orig_client ON public.web_origins USING btree (client_id);


--
-- TOC entry 3948 (class 2606 OID 17077)
-- Name: client_session_auth_status auth_status_constraint; Type: FK CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.client_session_auth_status
    ADD CONSTRAINT auth_status_constraint FOREIGN KEY (client_session) REFERENCES public.client_session (id);


--
-- TOC entry 3932 (class 2606 OID 16846)
-- Name: identity_provider fk2b4ebc52ae5c3b34; Type: FK CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT fk2b4ebc52ae5c3b34 FOREIGN KEY (realm_id) REFERENCES public.realm (id);


--
-- TOC entry 3925 (class 2606 OID 16776)
-- Name: client_attributes fk3c47c64beacca966; Type: FK CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.client_attributes
    ADD CONSTRAINT fk3c47c64beacca966 FOREIGN KEY (client_id) REFERENCES public.client (id);


--
-- TOC entry 3931 (class 2606 OID 16856)
-- Name: federated_identity fk404288b92ef007a6; Type: FK CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.federated_identity
    ADD CONSTRAINT fk404288b92ef007a6 FOREIGN KEY (user_id) REFERENCES public.user_entity (id);


--
-- TOC entry 3927 (class 2606 OID 17003)
-- Name: client_node_registrations fk4129723ba992f594; Type: FK CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.client_node_registrations
    ADD CONSTRAINT fk4129723ba992f594 FOREIGN KEY (client_id) REFERENCES public.client (id);


--
-- TOC entry 3926 (class 2606 OID 16781)
-- Name: client_session_note fk5edfb00ff51c2736; Type: FK CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.client_session_note
    ADD CONSTRAINT fk5edfb00ff51c2736 FOREIGN KEY (client_session) REFERENCES public.client_session (id);


--
-- TOC entry 3935 (class 2606 OID 16886)
-- Name: user_session_note fk5edfb00ff51d3472; Type: FK CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.user_session_note
    ADD CONSTRAINT fk5edfb00ff51d3472 FOREIGN KEY (user_session) REFERENCES public.user_session (id);


--
-- TOC entry 3908 (class 2606 OID 16596)
-- Name: client_session_role fk_11b7sgqw18i532811v7o2dv76; Type: FK CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.client_session_role
    ADD CONSTRAINT fk_11b7sgqw18i532811v7o2dv76 FOREIGN KEY (client_session) REFERENCES public.client_session (id);


--
-- TOC entry 3917 (class 2606 OID 16601)
-- Name: redirect_uris fk_1burs8pb4ouj97h5wuppahv9f; Type: FK CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.redirect_uris
    ADD CONSTRAINT fk_1burs8pb4ouj97h5wuppahv9f FOREIGN KEY (client_id) REFERENCES public.client (id);


--
-- TOC entry 3921 (class 2606 OID 16606)
-- Name: user_federation_provider fk_1fj32f6ptolw2qy60cd8n01e8; Type: FK CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.user_federation_provider
    ADD CONSTRAINT fk_1fj32f6ptolw2qy60cd8n01e8 FOREIGN KEY (realm_id) REFERENCES public.realm (id);


--
-- TOC entry 3940 (class 2606 OID 16981)
-- Name: client_session_prot_mapper fk_33a8sgqw18i532811v7o2dk89; Type: FK CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.client_session_prot_mapper
    ADD CONSTRAINT fk_33a8sgqw18i532811v7o2dk89 FOREIGN KEY (client_session) REFERENCES public.client_session (id);


--
-- TOC entry 3915 (class 2606 OID 16616)
-- Name: realm_required_credential fk_5hg65lybevavkqfki3kponh9v; Type: FK CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.realm_required_credential
    ADD CONSTRAINT fk_5hg65lybevavkqfki3kponh9v FOREIGN KEY (realm_id) REFERENCES public.realm (id);


--
-- TOC entry 3978 (class 2606 OID 17856)
-- Name: resource_attribute fk_5hrm2vlf9ql5fu022kqepovbr; Type: FK CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.resource_attribute
    ADD CONSTRAINT fk_5hrm2vlf9ql5fu022kqepovbr FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource (id);


--
-- TOC entry 3919 (class 2606 OID 16621)
-- Name: user_attribute fk_5hrm2vlf9ql5fu043kqepovbr; Type: FK CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT fk_5hrm2vlf9ql5fu043kqepovbr FOREIGN KEY (user_id) REFERENCES public.user_entity (id);


--
-- TOC entry 3922 (class 2606 OID 16631)
-- Name: user_required_action fk_6qj3w1jw9cvafhe19bwsiuvmd; Type: FK CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.user_required_action
    ADD CONSTRAINT fk_6qj3w1jw9cvafhe19bwsiuvmd FOREIGN KEY (user_id) REFERENCES public.user_entity (id);


--
-- TOC entry 3912 (class 2606 OID 16636)
-- Name: keycloak_role fk_6vyqfe4cn4wlq8r6kt5vdsj5c; Type: FK CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT fk_6vyqfe4cn4wlq8r6kt5vdsj5c FOREIGN KEY (realm) REFERENCES public.realm (id);


--
-- TOC entry 3916 (class 2606 OID 16641)
-- Name: realm_smtp_config fk_70ej8xdxgxd0b9hh6180irr0o; Type: FK CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.realm_smtp_config
    ADD CONSTRAINT fk_70ej8xdxgxd0b9hh6180irr0o FOREIGN KEY (realm_id) REFERENCES public.realm (id);


--
-- TOC entry 3913 (class 2606 OID 16656)
-- Name: realm_attribute fk_8shxd6l3e9atqukacxgpffptw; Type: FK CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.realm_attribute
    ADD CONSTRAINT fk_8shxd6l3e9atqukacxgpffptw FOREIGN KEY (realm_id) REFERENCES public.realm (id);


--
-- TOC entry 3909 (class 2606 OID 16661)
-- Name: composite_role fk_a63wvekftu8jo1pnj81e7mce2; Type: FK CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT fk_a63wvekftu8jo1pnj81e7mce2 FOREIGN KEY (composite) REFERENCES public.keycloak_role (id);


--
-- TOC entry 3944 (class 2606 OID 17097)
-- Name: authentication_execution fk_auth_exec_flow; Type: FK CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT fk_auth_exec_flow FOREIGN KEY (flow_id) REFERENCES public.authentication_flow (id);


--
-- TOC entry 3943 (class 2606 OID 17092)
-- Name: authentication_execution fk_auth_exec_realm; Type: FK CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT fk_auth_exec_realm FOREIGN KEY (realm_id) REFERENCES public.realm (id);


--
-- TOC entry 3942 (class 2606 OID 17087)
-- Name: authentication_flow fk_auth_flow_realm; Type: FK CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.authentication_flow
    ADD CONSTRAINT fk_auth_flow_realm FOREIGN KEY (realm_id) REFERENCES public.realm (id);


--
-- TOC entry 3941 (class 2606 OID 17082)
-- Name: authenticator_config fk_auth_realm; Type: FK CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.authenticator_config
    ADD CONSTRAINT fk_auth_realm FOREIGN KEY (realm_id) REFERENCES public.realm (id);


--
-- TOC entry 3907 (class 2606 OID 16666)
-- Name: client_session fk_b4ao2vcvat6ukau74wbwtfqo1; Type: FK CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.client_session
    ADD CONSTRAINT fk_b4ao2vcvat6ukau74wbwtfqo1 FOREIGN KEY (session_id) REFERENCES public.user_session (id);


--
-- TOC entry 3923 (class 2606 OID 16671)
-- Name: user_role_mapping fk_c4fqv34p1mbylloxang7b1q3l; Type: FK CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.user_role_mapping
    ADD CONSTRAINT fk_c4fqv34p1mbylloxang7b1q3l FOREIGN KEY (user_id) REFERENCES public.user_entity (id);


--
-- TOC entry 3955 (class 2606 OID 17762)
-- Name: client_scope_attributes fk_cl_scope_attr_scope; Type: FK CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.client_scope_attributes
    ADD CONSTRAINT fk_cl_scope_attr_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope (id);


--
-- TOC entry 3956 (class 2606 OID 17752)
-- Name: client_scope_role_mapping fk_cl_scope_rm_scope; Type: FK CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.client_scope_role_mapping
    ADD CONSTRAINT fk_cl_scope_rm_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope (id);


--
-- TOC entry 3949 (class 2606 OID 17166)
-- Name: client_user_session_note fk_cl_usr_ses_note; Type: FK CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.client_user_session_note
    ADD CONSTRAINT fk_cl_usr_ses_note FOREIGN KEY (client_session) REFERENCES public.client_session (id);


--
-- TOC entry 3929 (class 2606 OID 17747)
-- Name: protocol_mapper fk_cli_scope_mapper; Type: FK CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT fk_cli_scope_mapper FOREIGN KEY (client_scope_id) REFERENCES public.client_scope (id);


--
-- TOC entry 3971 (class 2606 OID 17606)
-- Name: client_initial_access fk_client_init_acc_realm; Type: FK CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.client_initial_access
    ADD CONSTRAINT fk_client_init_acc_realm FOREIGN KEY (realm_id) REFERENCES public.realm (id);


--
-- TOC entry 3969 (class 2606 OID 17554)
-- Name: component_config fk_component_config; Type: FK CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.component_config
    ADD CONSTRAINT fk_component_config FOREIGN KEY (component_id) REFERENCES public.component (id);


--
-- TOC entry 3970 (class 2606 OID 17549)
-- Name: component fk_component_realm; Type: FK CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.component
    ADD CONSTRAINT fk_component_realm FOREIGN KEY (realm_id) REFERENCES public.realm (id);


--
-- TOC entry 3954 (class 2606 OID 17253)
-- Name: realm_default_groups fk_def_groups_realm; Type: FK CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT fk_def_groups_realm FOREIGN KEY (realm_id) REFERENCES public.realm (id);


--
-- TOC entry 3947 (class 2606 OID 17112)
-- Name: user_federation_mapper_config fk_fedmapper_cfg; Type: FK CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.user_federation_mapper_config
    ADD CONSTRAINT fk_fedmapper_cfg FOREIGN KEY (user_federation_mapper_id) REFERENCES public.user_federation_mapper (id);


--
-- TOC entry 3946 (class 2606 OID 17107)
-- Name: user_federation_mapper fk_fedmapperpm_fedprv; Type: FK CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT fk_fedmapperpm_fedprv FOREIGN KEY (federation_provider_id) REFERENCES public.user_federation_provider (id);


--
-- TOC entry 3945 (class 2606 OID 17102)
-- Name: user_federation_mapper fk_fedmapperpm_realm; Type: FK CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT fk_fedmapperpm_realm FOREIGN KEY (realm_id) REFERENCES public.realm (id);


--
-- TOC entry 3968 (class 2606 OID 17472)
-- Name: associated_policy fk_frsr5s213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT fk_frsr5s213xcx4wnkog82ssrfy FOREIGN KEY (associated_policy_id) REFERENCES public.resource_server_policy (id);


--
-- TOC entry 3966 (class 2606 OID 17457)
-- Name: scope_policy fk_frsrasp13xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT fk_frsrasp13xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy (id);


--
-- TOC entry 3974 (class 2606 OID 17829)
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog82sspmt; Type: FK CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog82sspmt FOREIGN KEY (resource_server_id) REFERENCES public.resource_server (id);


--
-- TOC entry 3957 (class 2606 OID 17673)
-- Name: resource_server_resource fk_frsrho213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT fk_frsrho213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server (id);


--
-- TOC entry 3975 (class 2606 OID 17834)
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog83sspmt; Type: FK CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog83sspmt FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource (id);


--
-- TOC entry 3976 (class 2606 OID 17839)
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog84sspmt; Type: FK CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog84sspmt FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope (id);


--
-- TOC entry 3967 (class 2606 OID 17467)
-- Name: associated_policy fk_frsrpas14xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT fk_frsrpas14xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy (id);


--
-- TOC entry 3965 (class 2606 OID 17452)
-- Name: scope_policy fk_frsrpass3xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT fk_frsrpass3xcx4wnkog82ssrfy FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope (id);


--
-- TOC entry 3977 (class 2606 OID 17861)
-- Name: resource_server_perm_ticket fk_frsrpo2128cx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrpo2128cx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy (id);


--
-- TOC entry 3959 (class 2606 OID 17668)
-- Name: resource_server_policy fk_frsrpo213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT fk_frsrpo213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server (id);


--
-- TOC entry 3961 (class 2606 OID 17422)
-- Name: resource_scope fk_frsrpos13xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT fk_frsrpos13xcx4wnkog82ssrfy FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource (id);


--
-- TOC entry 3963 (class 2606 OID 17437)
-- Name: resource_policy fk_frsrpos53xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT fk_frsrpos53xcx4wnkog82ssrfy FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource (id);


--
-- TOC entry 3964 (class 2606 OID 17442)
-- Name: resource_policy fk_frsrpp213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT fk_frsrpp213xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy (id);


--
-- TOC entry 3962 (class 2606 OID 17427)
-- Name: resource_scope fk_frsrps213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT fk_frsrps213xcx4wnkog82ssrfy FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope (id);


--
-- TOC entry 3958 (class 2606 OID 17678)
-- Name: resource_server_scope fk_frsrso213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT fk_frsrso213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server (id);


--
-- TOC entry 3910 (class 2606 OID 16686)
-- Name: composite_role fk_gr7thllb9lu8q4vqa4524jjy8; Type: FK CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT fk_gr7thllb9lu8q4vqa4524jjy8 FOREIGN KEY (child_role) REFERENCES public.keycloak_role (id);


--
-- TOC entry 3973 (class 2606 OID 17804)
-- Name: user_consent_client_scope fk_grntcsnt_clsc_usc; Type: FK CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.user_consent_client_scope
    ADD CONSTRAINT fk_grntcsnt_clsc_usc FOREIGN KEY (user_consent_id) REFERENCES public.user_consent (id);


--
-- TOC entry 3939 (class 2606 OID 16966)
-- Name: user_consent fk_grntcsnt_user; Type: FK CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT fk_grntcsnt_user FOREIGN KEY (user_id) REFERENCES public.user_entity (id);


--
-- TOC entry 3952 (class 2606 OID 17227)
-- Name: group_attribute fk_group_attribute_group; Type: FK CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.group_attribute
    ADD CONSTRAINT fk_group_attribute_group FOREIGN KEY (group_id) REFERENCES public.keycloak_group (id);


--
-- TOC entry 3951 (class 2606 OID 17241)
-- Name: group_role_mapping fk_group_role_group; Type: FK CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.group_role_mapping
    ADD CONSTRAINT fk_group_role_group FOREIGN KEY (group_id) REFERENCES public.keycloak_group (id);


--
-- TOC entry 3936 (class 2606 OID 16912)
-- Name: realm_enabled_event_types fk_h846o4h0w8epx5nwedrf5y69j; Type: FK CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.realm_enabled_event_types
    ADD CONSTRAINT fk_h846o4h0w8epx5nwedrf5y69j FOREIGN KEY (realm_id) REFERENCES public.realm (id);


--
-- TOC entry 3914 (class 2606 OID 16696)
-- Name: realm_events_listeners fk_h846o4h0w8epx5nxev9f5y69j; Type: FK CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.realm_events_listeners
    ADD CONSTRAINT fk_h846o4h0w8epx5nxev9f5y69j FOREIGN KEY (realm_id) REFERENCES public.realm (id);


--
-- TOC entry 3937 (class 2606 OID 16956)
-- Name: identity_provider_mapper fk_idpm_realm; Type: FK CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.identity_provider_mapper
    ADD CONSTRAINT fk_idpm_realm FOREIGN KEY (realm_id) REFERENCES public.realm (id);


--
-- TOC entry 3938 (class 2606 OID 17126)
-- Name: idp_mapper_config fk_idpmconfig; Type: FK CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.idp_mapper_config
    ADD CONSTRAINT fk_idpmconfig FOREIGN KEY (idp_mapper_id) REFERENCES public.identity_provider_mapper (id);


--
-- TOC entry 3924 (class 2606 OID 16706)
-- Name: web_origins fk_lojpho213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.web_origins
    ADD CONSTRAINT fk_lojpho213xcx4wnkog82ssrfy FOREIGN KEY (client_id) REFERENCES public.client (id);


--
-- TOC entry 3918 (class 2606 OID 16716)
-- Name: scope_mapping fk_ouse064plmlr732lxjcn1q5f1; Type: FK CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.scope_mapping
    ADD CONSTRAINT fk_ouse064plmlr732lxjcn1q5f1 FOREIGN KEY (client_id) REFERENCES public.client (id);


--
-- TOC entry 3928 (class 2606 OID 16851)
-- Name: protocol_mapper fk_pcm_realm; Type: FK CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT fk_pcm_realm FOREIGN KEY (client_id) REFERENCES public.client (id);


--
-- TOC entry 3911 (class 2606 OID 16731)
-- Name: credential fk_pfyr0glasqyl0dei3kl69r6v0; Type: FK CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.credential
    ADD CONSTRAINT fk_pfyr0glasqyl0dei3kl69r6v0 FOREIGN KEY (user_id) REFERENCES public.user_entity (id);


--
-- TOC entry 3930 (class 2606 OID 17119)
-- Name: protocol_mapper_config fk_pmconfig; Type: FK CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.protocol_mapper_config
    ADD CONSTRAINT fk_pmconfig FOREIGN KEY (protocol_mapper_id) REFERENCES public.protocol_mapper (id);


--
-- TOC entry 3972 (class 2606 OID 17789)
-- Name: default_client_scope fk_r_def_cli_scope_realm; Type: FK CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.default_client_scope
    ADD CONSTRAINT fk_r_def_cli_scope_realm FOREIGN KEY (realm_id) REFERENCES public.realm (id);


--
-- TOC entry 3950 (class 2606 OID 17161)
-- Name: required_action_provider fk_req_act_realm; Type: FK CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.required_action_provider
    ADD CONSTRAINT fk_req_act_realm FOREIGN KEY (realm_id) REFERENCES public.realm (id);


--
-- TOC entry 3979 (class 2606 OID 17869)
-- Name: resource_uris fk_resource_server_uris; Type: FK CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.resource_uris
    ADD CONSTRAINT fk_resource_server_uris FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource (id);


--
-- TOC entry 3980 (class 2606 OID 17883)
-- Name: role_attribute fk_role_attribute_id; Type: FK CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.role_attribute
    ADD CONSTRAINT fk_role_attribute_id FOREIGN KEY (role_id) REFERENCES public.keycloak_role (id);


--
-- TOC entry 3934 (class 2606 OID 16881)
-- Name: realm_supported_locales fk_supported_locales_realm; Type: FK CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.realm_supported_locales
    ADD CONSTRAINT fk_supported_locales_realm FOREIGN KEY (realm_id) REFERENCES public.realm (id);


--
-- TOC entry 3920 (class 2606 OID 16751)
-- Name: user_federation_config fk_t13hpu1j94r2ebpekr39x5eu5; Type: FK CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.user_federation_config
    ADD CONSTRAINT fk_t13hpu1j94r2ebpekr39x5eu5 FOREIGN KEY (user_federation_provider_id) REFERENCES public.user_federation_provider (id);


--
-- TOC entry 3953 (class 2606 OID 17234)
-- Name: user_group_membership fk_user_group_user; Type: FK CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.user_group_membership
    ADD CONSTRAINT fk_user_group_user FOREIGN KEY (user_id) REFERENCES public.user_entity (id);


--
-- TOC entry 3960 (class 2606 OID 17412)
-- Name: policy_config fkdc34197cf864c4e43; Type: FK CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.policy_config
    ADD CONSTRAINT fkdc34197cf864c4e43 FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy (id);


--
-- TOC entry 3933 (class 2606 OID 16861)
-- Name: identity_provider_config fkdc4897cf864c4e43; Type: FK CONSTRAINT; Schema: public; Owner: magnittest
--

ALTER TABLE ONLY public.identity_provider_config
    ADD CONSTRAINT fkdc4897cf864c4e43 FOREIGN KEY (identity_provider_id) REFERENCES public.identity_provider (internal_id);


-- Completed on 2022-11-14 23:37:42 MSK

--
-- PostgreSQL database dump complete
--

