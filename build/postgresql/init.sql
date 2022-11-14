PGDMP     :                 
    z         
   magnittest    14.4    14.4 �   v           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            w           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            x           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            y           1262    16384 
   magnittest    DATABASE     ^   CREATE DATABASE magnittest WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';
    DROP DATABASE magnittest;
             
   magnittest    false            �            1259    17017    admin_event_entity    TABLE     �  CREATE TABLE public.admin_event_entity (
    id character varying(36) NOT NULL,
    admin_event_time bigint,
    realm_id character varying(255),
    operation_type character varying(255),
    auth_realm_id character varying(255),
    auth_client_id character varying(255),
    auth_user_id character varying(255),
    ip_address character varying(255),
    resource_path character varying(2550),
    representation text,
    error character varying(255),
    resource_type character varying(64)
);
 &   DROP TABLE public.admin_event_entity;
       public         heap 
   magnittest    false                       1259    17462    associated_policy    TABLE     �   CREATE TABLE public.associated_policy (
    policy_id character varying(36) NOT NULL,
    associated_policy_id character varying(36) NOT NULL
);
 %   DROP TABLE public.associated_policy;
       public         heap 
   magnittest    false            �            1259    17032    authentication_execution    TABLE     �  CREATE TABLE public.authentication_execution (
    id character varying(36) NOT NULL,
    alias character varying(255),
    authenticator character varying(36),
    realm_id character varying(36),
    flow_id character varying(36),
    requirement integer,
    priority integer,
    authenticator_flow boolean DEFAULT false NOT NULL,
    auth_flow_id character varying(36),
    auth_config character varying(36)
);
 ,   DROP TABLE public.authentication_execution;
       public         heap 
   magnittest    false            �            1259    17027    authentication_flow    TABLE     t  CREATE TABLE public.authentication_flow (
    id character varying(36) NOT NULL,
    alias character varying(255),
    description character varying(255),
    realm_id character varying(36),
    provider_id character varying(36) DEFAULT 'basic-flow'::character varying NOT NULL,
    top_level boolean DEFAULT false NOT NULL,
    built_in boolean DEFAULT false NOT NULL
);
 '   DROP TABLE public.authentication_flow;
       public         heap 
   magnittest    false            �            1259    17022    authenticator_config    TABLE     �   CREATE TABLE public.authenticator_config (
    id character varying(36) NOT NULL,
    alias character varying(255),
    realm_id character varying(36)
);
 (   DROP TABLE public.authenticator_config;
       public         heap 
   magnittest    false            �            1259    17037    authenticator_config_entry    TABLE     �   CREATE TABLE public.authenticator_config_entry (
    authenticator_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);
 .   DROP TABLE public.authenticator_config_entry;
       public         heap 
   magnittest    false                       1259    17477    broker_link    TABLE     L  CREATE TABLE public.broker_link (
    identity_provider character varying(255) NOT NULL,
    storage_provider_id character varying(255),
    realm_id character varying(36) NOT NULL,
    broker_user_id character varying(255),
    broker_username character varying(255),
    token text,
    user_id character varying(255) NOT NULL
);
    DROP TABLE public.broker_link;
       public         heap 
   magnittest    false            �            1259    16398    client    TABLE     �  CREATE TABLE public.client (
    id character varying(36) NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    full_scope_allowed boolean DEFAULT false NOT NULL,
    client_id character varying(255),
    not_before integer,
    public_client boolean DEFAULT false NOT NULL,
    secret character varying(255),
    base_url character varying(255),
    bearer_only boolean DEFAULT false NOT NULL,
    management_url character varying(255),
    surrogate_auth_required boolean DEFAULT false NOT NULL,
    realm_id character varying(36),
    protocol character varying(255),
    node_rereg_timeout integer DEFAULT 0,
    frontchannel_logout boolean DEFAULT false NOT NULL,
    consent_required boolean DEFAULT false NOT NULL,
    name character varying(255),
    service_accounts_enabled boolean DEFAULT false NOT NULL,
    client_authenticator_type character varying(255),
    root_url character varying(255),
    description character varying(255),
    registration_token character varying(255),
    standard_flow_enabled boolean DEFAULT true NOT NULL,
    implicit_flow_enabled boolean DEFAULT false NOT NULL,
    direct_access_grants_enabled boolean DEFAULT false NOT NULL,
    always_display_in_console boolean DEFAULT false NOT NULL
);
    DROP TABLE public.client;
       public         heap 
   magnittest    false            �            1259    16756    client_attributes    TABLE     �   CREATE TABLE public.client_attributes (
    client_id character varying(36) NOT NULL,
    value character varying(4000),
    name character varying(255) NOT NULL
);
 %   DROP TABLE public.client_attributes;
       public         heap 
   magnittest    false            #           1259    17726    client_auth_flow_bindings    TABLE     �   CREATE TABLE public.client_auth_flow_bindings (
    client_id character varying(36) NOT NULL,
    flow_id character varying(36),
    binding_name character varying(255) NOT NULL
);
 -   DROP TABLE public.client_auth_flow_bindings;
       public         heap 
   magnittest    false            "           1259    17601    client_initial_access    TABLE     �   CREATE TABLE public.client_initial_access (
    id character varying(36) NOT NULL,
    realm_id character varying(36) NOT NULL,
    "timestamp" integer,
    expiration integer,
    count integer,
    remaining_count integer
);
 )   DROP TABLE public.client_initial_access;
       public         heap 
   magnittest    false            �            1259    16766    client_node_registrations    TABLE     �   CREATE TABLE public.client_node_registrations (
    client_id character varying(36) NOT NULL,
    value integer,
    name character varying(255) NOT NULL
);
 -   DROP TABLE public.client_node_registrations;
       public         heap 
   magnittest    false                       1259    17266    client_scope    TABLE     �   CREATE TABLE public.client_scope (
    id character varying(36) NOT NULL,
    name character varying(255),
    realm_id character varying(36),
    description character varying(255),
    protocol character varying(255)
);
     DROP TABLE public.client_scope;
       public         heap 
   magnittest    false                       1259    17280    client_scope_attributes    TABLE     �   CREATE TABLE public.client_scope_attributes (
    scope_id character varying(36) NOT NULL,
    value character varying(2048),
    name character varying(255) NOT NULL
);
 +   DROP TABLE public.client_scope_attributes;
       public         heap 
   magnittest    false            $           1259    17767    client_scope_client    TABLE     �   CREATE TABLE public.client_scope_client (
    client_id character varying(255) NOT NULL,
    scope_id character varying(255) NOT NULL,
    default_scope boolean DEFAULT false NOT NULL
);
 '   DROP TABLE public.client_scope_client;
       public         heap 
   magnittest    false                       1259    17285    client_scope_role_mapping    TABLE     �   CREATE TABLE public.client_scope_role_mapping (
    scope_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);
 -   DROP TABLE public.client_scope_role_mapping;
       public         heap 
   magnittest    false            �            1259    16409    client_session    TABLE     �  CREATE TABLE public.client_session (
    id character varying(36) NOT NULL,
    client_id character varying(36),
    redirect_uri character varying(255),
    state character varying(255),
    "timestamp" integer,
    session_id character varying(36),
    auth_method character varying(255),
    realm_id character varying(255),
    auth_user_id character varying(36),
    current_action character varying(36)
);
 "   DROP TABLE public.client_session;
       public         heap 
   magnittest    false                       1259    17055    client_session_auth_status    TABLE     �   CREATE TABLE public.client_session_auth_status (
    authenticator character varying(36) NOT NULL,
    status integer,
    client_session character varying(36) NOT NULL
);
 .   DROP TABLE public.client_session_auth_status;
       public         heap 
   magnittest    false            �            1259    16761    client_session_note    TABLE     �   CREATE TABLE public.client_session_note (
    name character varying(255) NOT NULL,
    value character varying(255),
    client_session character varying(36) NOT NULL
);
 '   DROP TABLE public.client_session_note;
       public         heap 
   magnittest    false            �            1259    16939    client_session_prot_mapper    TABLE     �   CREATE TABLE public.client_session_prot_mapper (
    protocol_mapper_id character varying(36) NOT NULL,
    client_session character varying(36) NOT NULL
);
 .   DROP TABLE public.client_session_prot_mapper;
       public         heap 
   magnittest    false            �            1259    16414    client_session_role    TABLE     �   CREATE TABLE public.client_session_role (
    role_id character varying(255) NOT NULL,
    client_session character varying(36) NOT NULL
);
 '   DROP TABLE public.client_session_role;
       public         heap 
   magnittest    false                       1259    17136    client_user_session_note    TABLE     �   CREATE TABLE public.client_user_session_note (
    name character varying(255) NOT NULL,
    value character varying(2048),
    client_session character varying(36) NOT NULL
);
 ,   DROP TABLE public.client_user_session_note;
       public         heap 
   magnittest    false                        1259    17522 	   component    TABLE     )  CREATE TABLE public.component (
    id character varying(36) NOT NULL,
    name character varying(255),
    parent_id character varying(36),
    provider_id character varying(36),
    provider_type character varying(255),
    realm_id character varying(36),
    sub_type character varying(255)
);
    DROP TABLE public.component;
       public         heap 
   magnittest    false                       1259    17517    component_config    TABLE     �   CREATE TABLE public.component_config (
    id character varying(36) NOT NULL,
    component_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(4000)
);
 $   DROP TABLE public.component_config;
       public         heap 
   magnittest    false            �            1259    16417    composite_role    TABLE     �   CREATE TABLE public.composite_role (
    composite character varying(36) NOT NULL,
    child_role character varying(36) NOT NULL
);
 "   DROP TABLE public.composite_role;
       public         heap 
   magnittest    false            �            1259    16420 
   credential    TABLE     $  CREATE TABLE public.credential (
    id character varying(36) NOT NULL,
    salt bytea,
    type character varying(255),
    user_id character varying(36),
    created_date bigint,
    user_label character varying(255),
    secret_data text,
    credential_data text,
    priority integer
);
    DROP TABLE public.credential;
       public         heap 
   magnittest    false            �            1259    16390    databasechangelog    TABLE     Y  CREATE TABLE public.databasechangelog (
    id character varying(255) NOT NULL,
    author character varying(255) NOT NULL,
    filename character varying(255) NOT NULL,
    dateexecuted timestamp without time zone NOT NULL,
    orderexecuted integer NOT NULL,
    exectype character varying(10) NOT NULL,
    md5sum character varying(35),
    description character varying(255),
    comments character varying(255),
    tag character varying(255),
    liquibase character varying(20),
    contexts character varying(255),
    labels character varying(255),
    deployment_id character varying(10)
);
 %   DROP TABLE public.databasechangelog;
       public         heap 
   magnittest    false            �            1259    16385    databasechangeloglock    TABLE     �   CREATE TABLE public.databasechangeloglock (
    id integer NOT NULL,
    locked boolean NOT NULL,
    lockgranted timestamp without time zone,
    lockedby character varying(255)
);
 )   DROP TABLE public.databasechangeloglock;
       public         heap 
   magnittest    false            %           1259    17783    default_client_scope    TABLE     �   CREATE TABLE public.default_client_scope (
    realm_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL,
    default_scope boolean DEFAULT false NOT NULL
);
 (   DROP TABLE public.default_client_scope;
       public         heap 
   magnittest    false            �            1259    16425    event_entity    TABLE     �  CREATE TABLE public.event_entity (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    details_json character varying(2550),
    error character varying(255),
    ip_address character varying(255),
    realm_id character varying(255),
    session_id character varying(255),
    event_time bigint,
    type character varying(255),
    user_id character varying(255)
);
     DROP TABLE public.event_entity;
       public         heap 
   magnittest    false                       1259    17482    fed_user_attribute    TABLE     (  CREATE TABLE public.fed_user_attribute (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    value character varying(2024)
);
 &   DROP TABLE public.fed_user_attribute;
       public         heap 
   magnittest    false                       1259    17487    fed_user_consent    TABLE     �  CREATE TABLE public.fed_user_consent (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    created_date bigint,
    last_updated_date bigint,
    client_storage_provider character varying(36),
    external_client_id character varying(255)
);
 $   DROP TABLE public.fed_user_consent;
       public         heap 
   magnittest    false            '           1259    17809    fed_user_consent_cl_scope    TABLE     �   CREATE TABLE public.fed_user_consent_cl_scope (
    user_consent_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);
 -   DROP TABLE public.fed_user_consent_cl_scope;
       public         heap 
   magnittest    false                       1259    17496    fed_user_credential    TABLE     �  CREATE TABLE public.fed_user_credential (
    id character varying(36) NOT NULL,
    salt bytea,
    type character varying(255),
    created_date bigint,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    user_label character varying(255),
    secret_data text,
    credential_data text,
    priority integer
);
 '   DROP TABLE public.fed_user_credential;
       public         heap 
   magnittest    false                       1259    17505    fed_user_group_membership    TABLE     �   CREATE TABLE public.fed_user_group_membership (
    group_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);
 -   DROP TABLE public.fed_user_group_membership;
       public         heap 
   magnittest    false                       1259    17508    fed_user_required_action    TABLE       CREATE TABLE public.fed_user_required_action (
    required_action character varying(255) DEFAULT ' '::character varying NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);
 ,   DROP TABLE public.fed_user_required_action;
       public         heap 
   magnittest    false                       1259    17514    fed_user_role_mapping    TABLE     �   CREATE TABLE public.fed_user_role_mapping (
    role_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);
 )   DROP TABLE public.fed_user_role_mapping;
       public         heap 
   magnittest    false            �            1259    16802    federated_identity    TABLE       CREATE TABLE public.federated_identity (
    identity_provider character varying(255) NOT NULL,
    realm_id character varying(36),
    federated_user_id character varying(255),
    federated_username character varying(255),
    token text,
    user_id character varying(36) NOT NULL
);
 &   DROP TABLE public.federated_identity;
       public         heap 
   magnittest    false            !           1259    17579    federated_user    TABLE     �   CREATE TABLE public.federated_user (
    id character varying(255) NOT NULL,
    storage_provider_id character varying(255),
    realm_id character varying(36) NOT NULL
);
 "   DROP TABLE public.federated_user;
       public         heap 
   magnittest    false            	           1259    17204    group_attribute    TABLE       CREATE TABLE public.group_attribute (
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255),
    group_id character varying(36) NOT NULL
);
 #   DROP TABLE public.group_attribute;
       public         heap 
   magnittest    false                       1259    17201    group_role_mapping    TABLE     �   CREATE TABLE public.group_role_mapping (
    role_id character varying(36) NOT NULL,
    group_id character varying(36) NOT NULL
);
 &   DROP TABLE public.group_role_mapping;
       public         heap 
   magnittest    false            �            1259    16807    identity_provider    TABLE     �  CREATE TABLE public.identity_provider (
    internal_id character varying(36) NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    provider_alias character varying(255),
    provider_id character varying(255),
    store_token boolean DEFAULT false NOT NULL,
    authenticate_by_default boolean DEFAULT false NOT NULL,
    realm_id character varying(36),
    add_token_role boolean DEFAULT true NOT NULL,
    trust_email boolean DEFAULT false NOT NULL,
    first_broker_login_flow_id character varying(36),
    post_broker_login_flow_id character varying(36),
    provider_display_name character varying(255),
    link_only boolean DEFAULT false NOT NULL
);
 %   DROP TABLE public.identity_provider;
       public         heap 
   magnittest    false            �            1259    16816    identity_provider_config    TABLE     �   CREATE TABLE public.identity_provider_config (
    identity_provider_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);
 ,   DROP TABLE public.identity_provider_config;
       public         heap 
   magnittest    false            �            1259    16920    identity_provider_mapper    TABLE       CREATE TABLE public.identity_provider_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    idp_alias character varying(255) NOT NULL,
    idp_mapper_name character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL
);
 ,   DROP TABLE public.identity_provider_mapper;
       public         heap 
   magnittest    false            �            1259    16925    idp_mapper_config    TABLE     �   CREATE TABLE public.idp_mapper_config (
    idp_mapper_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);
 %   DROP TABLE public.idp_mapper_config;
       public         heap 
   magnittest    false                       1259    17198    keycloak_group    TABLE     �   CREATE TABLE public.keycloak_group (
    id character varying(36) NOT NULL,
    name character varying(255),
    parent_group character varying(36) NOT NULL,
    realm_id character varying(36)
);
 "   DROP TABLE public.keycloak_group;
       public         heap 
   magnittest    false            �            1259    16433    keycloak_role    TABLE     b  CREATE TABLE public.keycloak_role (
    id character varying(36) NOT NULL,
    client_realm_constraint character varying(255),
    client_role boolean DEFAULT false NOT NULL,
    description character varying(255),
    name character varying(255),
    realm_id character varying(255),
    client character varying(36),
    realm character varying(36)
);
 !   DROP TABLE public.keycloak_role;
       public         heap 
   magnittest    false            �            1259    16917    migration_model    TABLE     �   CREATE TABLE public.migration_model (
    id character varying(36) NOT NULL,
    version character varying(36),
    update_time bigint DEFAULT 0 NOT NULL
);
 #   DROP TABLE public.migration_model;
       public         heap 
   magnittest    false                       1259    17189    offline_client_session    TABLE     �  CREATE TABLE public.offline_client_session (
    user_session_id character varying(36) NOT NULL,
    client_id character varying(255) NOT NULL,
    offline_flag character varying(4) NOT NULL,
    "timestamp" integer,
    data text,
    client_storage_provider character varying(36) DEFAULT 'local'::character varying NOT NULL,
    external_client_id character varying(255) DEFAULT 'local'::character varying NOT NULL
);
 *   DROP TABLE public.offline_client_session;
       public         heap 
   magnittest    false                       1259    17184    offline_user_session    TABLE     P  CREATE TABLE public.offline_user_session (
    user_session_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    created_on integer NOT NULL,
    offline_flag character varying(4) NOT NULL,
    data text,
    last_session_refresh integer DEFAULT 0 NOT NULL
);
 (   DROP TABLE public.offline_user_session;
       public         heap 
   magnittest    false                       1259    17405    policy_config    TABLE     �   CREATE TABLE public.policy_config (
    policy_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value text
);
 !   DROP TABLE public.policy_config;
       public         heap 
   magnittest    false            �            1259    16791    protocol_mapper    TABLE     1  CREATE TABLE public.protocol_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    protocol character varying(255) NOT NULL,
    protocol_mapper_name character varying(255) NOT NULL,
    client_id character varying(36),
    client_scope_id character varying(36)
);
 #   DROP TABLE public.protocol_mapper;
       public         heap 
   magnittest    false            �            1259    16797    protocol_mapper_config    TABLE     �   CREATE TABLE public.protocol_mapper_config (
    protocol_mapper_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);
 *   DROP TABLE public.protocol_mapper_config;
       public         heap 
   magnittest    false            �            1259    16439    realm    TABLE     �	  CREATE TABLE public.realm (
    id character varying(36) NOT NULL,
    access_code_lifespan integer,
    user_action_lifespan integer,
    access_token_lifespan integer,
    account_theme character varying(255),
    admin_theme character varying(255),
    email_theme character varying(255),
    enabled boolean DEFAULT false NOT NULL,
    events_enabled boolean DEFAULT false NOT NULL,
    events_expiration bigint,
    login_theme character varying(255),
    name character varying(255),
    not_before integer,
    password_policy character varying(2550),
    registration_allowed boolean DEFAULT false NOT NULL,
    remember_me boolean DEFAULT false NOT NULL,
    reset_password_allowed boolean DEFAULT false NOT NULL,
    social boolean DEFAULT false NOT NULL,
    ssl_required character varying(255),
    sso_idle_timeout integer,
    sso_max_lifespan integer,
    update_profile_on_soc_login boolean DEFAULT false NOT NULL,
    verify_email boolean DEFAULT false NOT NULL,
    master_admin_client character varying(36),
    login_lifespan integer,
    internationalization_enabled boolean DEFAULT false NOT NULL,
    default_locale character varying(255),
    reg_email_as_username boolean DEFAULT false NOT NULL,
    admin_events_enabled boolean DEFAULT false NOT NULL,
    admin_events_details_enabled boolean DEFAULT false NOT NULL,
    edit_username_allowed boolean DEFAULT false NOT NULL,
    otp_policy_counter integer DEFAULT 0,
    otp_policy_window integer DEFAULT 1,
    otp_policy_period integer DEFAULT 30,
    otp_policy_digits integer DEFAULT 6,
    otp_policy_alg character varying(36) DEFAULT 'HmacSHA1'::character varying,
    otp_policy_type character varying(36) DEFAULT 'totp'::character varying,
    browser_flow character varying(36),
    registration_flow character varying(36),
    direct_grant_flow character varying(36),
    reset_credentials_flow character varying(36),
    client_auth_flow character varying(36),
    offline_session_idle_timeout integer DEFAULT 0,
    revoke_refresh_token boolean DEFAULT false NOT NULL,
    access_token_life_implicit integer DEFAULT 0,
    login_with_email_allowed boolean DEFAULT true NOT NULL,
    duplicate_emails_allowed boolean DEFAULT false NOT NULL,
    docker_auth_flow character varying(36),
    refresh_token_max_reuse integer DEFAULT 0,
    allow_user_managed_access boolean DEFAULT false NOT NULL,
    sso_max_lifespan_remember_me integer DEFAULT 0 NOT NULL,
    sso_idle_timeout_remember_me integer DEFAULT 0 NOT NULL,
    default_role character varying(255)
);
    DROP TABLE public.realm;
       public         heap 
   magnittest    false            �            1259    16456    realm_attribute    TABLE     �   CREATE TABLE public.realm_attribute (
    name character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    value text
);
 #   DROP TABLE public.realm_attribute;
       public         heap 
   magnittest    false                       1259    17213    realm_default_groups    TABLE     �   CREATE TABLE public.realm_default_groups (
    realm_id character varying(36) NOT NULL,
    group_id character varying(36) NOT NULL
);
 (   DROP TABLE public.realm_default_groups;
       public         heap 
   magnittest    false            �            1259    16909    realm_enabled_event_types    TABLE     �   CREATE TABLE public.realm_enabled_event_types (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);
 -   DROP TABLE public.realm_enabled_event_types;
       public         heap 
   magnittest    false            �            1259    16464    realm_events_listeners    TABLE     �   CREATE TABLE public.realm_events_listeners (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);
 *   DROP TABLE public.realm_events_listeners;
       public         heap 
   magnittest    false            ,           1259    17919    realm_localizations    TABLE     �   CREATE TABLE public.realm_localizations (
    realm_id character varying(255) NOT NULL,
    locale character varying(255) NOT NULL,
    texts text NOT NULL
);
 '   DROP TABLE public.realm_localizations;
       public         heap 
   magnittest    false            �            1259    16467    realm_required_credential    TABLE       CREATE TABLE public.realm_required_credential (
    type character varying(255) NOT NULL,
    form_label character varying(255),
    input boolean DEFAULT false NOT NULL,
    secret boolean DEFAULT false NOT NULL,
    realm_id character varying(36) NOT NULL
);
 -   DROP TABLE public.realm_required_credential;
       public         heap 
   magnittest    false            �            1259    16474    realm_smtp_config    TABLE     �   CREATE TABLE public.realm_smtp_config (
    realm_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);
 %   DROP TABLE public.realm_smtp_config;
       public         heap 
   magnittest    false            �            1259    16825    realm_supported_locales    TABLE     �   CREATE TABLE public.realm_supported_locales (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);
 +   DROP TABLE public.realm_supported_locales;
       public         heap 
   magnittest    false            �            1259    16484    redirect_uris    TABLE        CREATE TABLE public.redirect_uris (
    client_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);
 !   DROP TABLE public.redirect_uris;
       public         heap 
   magnittest    false                       1259    17148    required_action_config    TABLE     �   CREATE TABLE public.required_action_config (
    required_action_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);
 *   DROP TABLE public.required_action_config;
       public         heap 
   magnittest    false                       1259    17141    required_action_provider    TABLE     \  CREATE TABLE public.required_action_provider (
    id character varying(36) NOT NULL,
    alias character varying(255),
    name character varying(255),
    realm_id character varying(36),
    enabled boolean DEFAULT false NOT NULL,
    default_action boolean DEFAULT false NOT NULL,
    provider_id character varying(255),
    priority integer
);
 ,   DROP TABLE public.required_action_provider;
       public         heap 
   magnittest    false            )           1259    17848    resource_attribute    TABLE       CREATE TABLE public.resource_attribute (
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255),
    resource_id character varying(36) NOT NULL
);
 &   DROP TABLE public.resource_attribute;
       public         heap 
   magnittest    false                       1259    17432    resource_policy    TABLE     �   CREATE TABLE public.resource_policy (
    resource_id character varying(36) NOT NULL,
    policy_id character varying(36) NOT NULL
);
 #   DROP TABLE public.resource_policy;
       public         heap 
   magnittest    false                       1259    17417    resource_scope    TABLE     �   CREATE TABLE public.resource_scope (
    resource_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);
 "   DROP TABLE public.resource_scope;
       public         heap 
   magnittest    false                       1259    17355    resource_server    TABLE     �   CREATE TABLE public.resource_server (
    id character varying(36) NOT NULL,
    allow_rs_remote_mgmt boolean DEFAULT false NOT NULL,
    policy_enforce_mode character varying(15) NOT NULL,
    decision_strategy smallint DEFAULT 1 NOT NULL
);
 #   DROP TABLE public.resource_server;
       public         heap 
   magnittest    false            (           1259    17824    resource_server_perm_ticket    TABLE     �  CREATE TABLE public.resource_server_perm_ticket (
    id character varying(36) NOT NULL,
    owner character varying(255) NOT NULL,
    requester character varying(255) NOT NULL,
    created_timestamp bigint NOT NULL,
    granted_timestamp bigint,
    resource_id character varying(36) NOT NULL,
    scope_id character varying(36),
    resource_server_id character varying(36) NOT NULL,
    policy_id character varying(36)
);
 /   DROP TABLE public.resource_server_perm_ticket;
       public         heap 
   magnittest    false                       1259    17391    resource_server_policy    TABLE     y  CREATE TABLE public.resource_server_policy (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255),
    type character varying(255) NOT NULL,
    decision_strategy character varying(20),
    logic character varying(20),
    resource_server_id character varying(36) NOT NULL,
    owner character varying(255)
);
 *   DROP TABLE public.resource_server_policy;
       public         heap 
   magnittest    false                       1259    17363    resource_server_resource    TABLE     �  CREATE TABLE public.resource_server_resource (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    type character varying(255),
    icon_uri character varying(255),
    owner character varying(255) NOT NULL,
    resource_server_id character varying(36) NOT NULL,
    owner_managed_access boolean DEFAULT false NOT NULL,
    display_name character varying(255)
);
 ,   DROP TABLE public.resource_server_resource;
       public         heap 
   magnittest    false                       1259    17377    resource_server_scope    TABLE       CREATE TABLE public.resource_server_scope (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    icon_uri character varying(255),
    resource_server_id character varying(36) NOT NULL,
    display_name character varying(255)
);
 )   DROP TABLE public.resource_server_scope;
       public         heap 
   magnittest    false            *           1259    17866    resource_uris    TABLE     �   CREATE TABLE public.resource_uris (
    resource_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);
 !   DROP TABLE public.resource_uris;
       public         heap 
   magnittest    false            +           1259    17876    role_attribute    TABLE     �   CREATE TABLE public.role_attribute (
    id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255)
);
 "   DROP TABLE public.role_attribute;
       public         heap 
   magnittest    false            �            1259    16487    scope_mapping    TABLE     �   CREATE TABLE public.scope_mapping (
    client_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);
 !   DROP TABLE public.scope_mapping;
       public         heap 
   magnittest    false                       1259    17447    scope_policy    TABLE     �   CREATE TABLE public.scope_policy (
    scope_id character varying(36) NOT NULL,
    policy_id character varying(36) NOT NULL
);
     DROP TABLE public.scope_policy;
       public         heap 
   magnittest    false            �            1259    16493    user_attribute    TABLE     �   CREATE TABLE public.user_attribute (
    name character varying(255) NOT NULL,
    value character varying(255),
    user_id character varying(36) NOT NULL,
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL
);
 "   DROP TABLE public.user_attribute;
       public         heap 
   magnittest    false            �            1259    16930    user_consent    TABLE     7  CREATE TABLE public.user_consent (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    user_id character varying(36) NOT NULL,
    created_date bigint,
    last_updated_date bigint,
    client_storage_provider character varying(36),
    external_client_id character varying(255)
);
     DROP TABLE public.user_consent;
       public         heap 
   magnittest    false            &           1259    17799    user_consent_client_scope    TABLE     �   CREATE TABLE public.user_consent_client_scope (
    user_consent_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);
 -   DROP TABLE public.user_consent_client_scope;
       public         heap 
   magnittest    false            �            1259    16498    user_entity    TABLE     =  CREATE TABLE public.user_entity (
    id character varying(36) NOT NULL,
    email character varying(255),
    email_constraint character varying(255),
    email_verified boolean DEFAULT false NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    federation_link character varying(255),
    first_name character varying(255),
    last_name character varying(255),
    realm_id character varying(255),
    username character varying(255),
    created_timestamp bigint,
    service_account_client_link character varying(255),
    not_before integer DEFAULT 0 NOT NULL
);
    DROP TABLE public.user_entity;
       public         heap 
   magnittest    false            �            1259    16506    user_federation_config    TABLE     �   CREATE TABLE public.user_federation_config (
    user_federation_provider_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);
 *   DROP TABLE public.user_federation_config;
       public         heap 
   magnittest    false            �            1259    17042    user_federation_mapper    TABLE     $  CREATE TABLE public.user_federation_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    federation_provider_id character varying(36) NOT NULL,
    federation_mapper_type character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL
);
 *   DROP TABLE public.user_federation_mapper;
       public         heap 
   magnittest    false                        1259    17047    user_federation_mapper_config    TABLE     �   CREATE TABLE public.user_federation_mapper_config (
    user_federation_mapper_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);
 1   DROP TABLE public.user_federation_mapper_config;
       public         heap 
   magnittest    false            �            1259    16511    user_federation_provider    TABLE     ;  CREATE TABLE public.user_federation_provider (
    id character varying(36) NOT NULL,
    changed_sync_period integer,
    display_name character varying(255),
    full_sync_period integer,
    last_sync integer,
    priority integer,
    provider_name character varying(255),
    realm_id character varying(36)
);
 ,   DROP TABLE public.user_federation_provider;
       public         heap 
   magnittest    false            
           1259    17210    user_group_membership    TABLE     �   CREATE TABLE public.user_group_membership (
    group_id character varying(36) NOT NULL,
    user_id character varying(36) NOT NULL
);
 )   DROP TABLE public.user_group_membership;
       public         heap 
   magnittest    false            �            1259    16516    user_required_action    TABLE     �   CREATE TABLE public.user_required_action (
    user_id character varying(36) NOT NULL,
    required_action character varying(255) DEFAULT ' '::character varying NOT NULL
);
 (   DROP TABLE public.user_required_action;
       public         heap 
   magnittest    false            �            1259    16519    user_role_mapping    TABLE     �   CREATE TABLE public.user_role_mapping (
    role_id character varying(255) NOT NULL,
    user_id character varying(36) NOT NULL
);
 %   DROP TABLE public.user_role_mapping;
       public         heap 
   magnittest    false            �            1259    16522    user_session    TABLE     �  CREATE TABLE public.user_session (
    id character varying(36) NOT NULL,
    auth_method character varying(255),
    ip_address character varying(255),
    last_session_refresh integer,
    login_username character varying(255),
    realm_id character varying(255),
    remember_me boolean DEFAULT false NOT NULL,
    started integer,
    user_id character varying(255),
    user_session_state integer,
    broker_session_id character varying(255),
    broker_user_id character varying(255)
);
     DROP TABLE public.user_session;
       public         heap 
   magnittest    false            �            1259    16828    user_session_note    TABLE     �   CREATE TABLE public.user_session_note (
    user_session character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(2048)
);
 %   DROP TABLE public.user_session_note;
       public         heap 
   magnittest    false            �            1259    16490    username_login_failure    TABLE       CREATE TABLE public.username_login_failure (
    realm_id character varying(36) NOT NULL,
    username character varying(255) NOT NULL,
    failed_login_not_before integer,
    last_failure bigint,
    last_ip_failure character varying(255),
    num_failures integer
);
 *   DROP TABLE public.username_login_failure;
       public         heap 
   magnittest    false            �            1259    16533    web_origins    TABLE     }   CREATE TABLE public.web_origins (
    client_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);
    DROP TABLE public.web_origins;
       public         heap 
   magnittest    false            A          0    17017    admin_event_entity 
   TABLE DATA           �   COPY public.admin_event_entity (id, admin_event_time, realm_id, operation_type, auth_realm_id, auth_client_id, auth_user_id, ip_address, resource_path, representation, error, resource_type) FROM stdin;
    public       
   magnittest    false    250   T|      ^          0    17462    associated_policy 
   TABLE DATA           L   COPY public.associated_policy (policy_id, associated_policy_id) FROM stdin;
    public       
   magnittest    false    279   q|      D          0    17032    authentication_execution 
   TABLE DATA           �   COPY public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) FROM stdin;
    public       
   magnittest    false    253   �|      C          0    17027    authentication_flow 
   TABLE DATA           q   COPY public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) FROM stdin;
    public       
   magnittest    false    252   :�      B          0    17022    authenticator_config 
   TABLE DATA           C   COPY public.authenticator_config (id, alias, realm_id) FROM stdin;
    public       
   magnittest    false    251   :�      E          0    17037    authenticator_config_entry 
   TABLE DATA           S   COPY public.authenticator_config_entry (authenticator_id, value, name) FROM stdin;
    public       
   magnittest    false    254   �      _          0    17477    broker_link 
   TABLE DATA           �   COPY public.broker_link (identity_provider, storage_provider_id, realm_id, broker_user_id, broker_username, token, user_id) FROM stdin;
    public       
   magnittest    false    280   ϕ                0    16398    client 
   TABLE DATA           �  COPY public.client (id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url, bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout, frontchannel_logout, consent_required, name, service_accounts_enabled, client_authenticator_type, root_url, description, registration_token, standard_flow_enabled, implicit_flow_enabled, direct_access_grants_enabled, always_display_in_console) FROM stdin;
    public       
   magnittest    false    211   �      1          0    16756    client_attributes 
   TABLE DATA           C   COPY public.client_attributes (client_id, value, name) FROM stdin;
    public       
   magnittest    false    234   �      j          0    17726    client_auth_flow_bindings 
   TABLE DATA           U   COPY public.client_auth_flow_bindings (client_id, flow_id, binding_name) FROM stdin;
    public       
   magnittest    false    291   ��      i          0    17601    client_initial_access 
   TABLE DATA           n   COPY public.client_initial_access (id, realm_id, "timestamp", expiration, count, remaining_count) FROM stdin;
    public       
   magnittest    false    290   ��      3          0    16766    client_node_registrations 
   TABLE DATA           K   COPY public.client_node_registrations (client_id, value, name) FROM stdin;
    public       
   magnittest    false    236   ٛ      S          0    17266    client_scope 
   TABLE DATA           Q   COPY public.client_scope (id, name, realm_id, description, protocol) FROM stdin;
    public       
   magnittest    false    268   ��      T          0    17280    client_scope_attributes 
   TABLE DATA           H   COPY public.client_scope_attributes (scope_id, value, name) FROM stdin;
    public       
   magnittest    false    269   מ      k          0    17767    client_scope_client 
   TABLE DATA           Q   COPY public.client_scope_client (client_id, scope_id, default_scope) FROM stdin;
    public       
   magnittest    false    292   ��      U          0    17285    client_scope_role_mapping 
   TABLE DATA           F   COPY public.client_scope_role_mapping (scope_id, role_id) FROM stdin;
    public       
   magnittest    false    270   �                0    16409    client_session 
   TABLE DATA           �   COPY public.client_session (id, client_id, redirect_uri, state, "timestamp", session_id, auth_method, realm_id, auth_user_id, current_action) FROM stdin;
    public       
   magnittest    false    212   ;�      H          0    17055    client_session_auth_status 
   TABLE DATA           [   COPY public.client_session_auth_status (authenticator, status, client_session) FROM stdin;
    public       
   magnittest    false    257   X�      2          0    16761    client_session_note 
   TABLE DATA           J   COPY public.client_session_note (name, value, client_session) FROM stdin;
    public       
   magnittest    false    235   u�      @          0    16939    client_session_prot_mapper 
   TABLE DATA           X   COPY public.client_session_prot_mapper (protocol_mapper_id, client_session) FROM stdin;
    public       
   magnittest    false    249   ��                0    16414    client_session_role 
   TABLE DATA           F   COPY public.client_session_role (role_id, client_session) FROM stdin;
    public       
   magnittest    false    213   ��      I          0    17136    client_user_session_note 
   TABLE DATA           O   COPY public.client_user_session_note (name, value, client_session) FROM stdin;
    public       
   magnittest    false    258   ̦      g          0    17522 	   component 
   TABLE DATA           h   COPY public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) FROM stdin;
    public       
   magnittest    false    288   �      f          0    17517    component_config 
   TABLE DATA           I   COPY public.component_config (id, component_id, name, value) FROM stdin;
    public       
   magnittest    false    287    �                0    16417    composite_role 
   TABLE DATA           ?   COPY public.composite_role (composite, child_role) FROM stdin;
    public       
   magnittest    false    214   E�                0    16420 
   credential 
   TABLE DATA              COPY public.credential (id, salt, type, user_id, created_date, user_label, secret_data, credential_data, priority) FROM stdin;
    public       
   magnittest    false    215   -�                0    16390    databasechangelog 
   TABLE DATA           �   COPY public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) FROM stdin;
    public       
   magnittest    false    210   ��                0    16385    databasechangeloglock 
   TABLE DATA           R   COPY public.databasechangeloglock (id, locked, lockgranted, lockedby) FROM stdin;
    public       
   magnittest    false    209   ��      l          0    17783    default_client_scope 
   TABLE DATA           Q   COPY public.default_client_scope (realm_id, scope_id, default_scope) FROM stdin;
    public       
   magnittest    false    293   ��                0    16425    event_entity 
   TABLE DATA           �   COPY public.event_entity (id, client_id, details_json, error, ip_address, realm_id, session_id, event_time, type, user_id) FROM stdin;
    public       
   magnittest    false    216   ��      `          0    17482    fed_user_attribute 
   TABLE DATA           e   COPY public.fed_user_attribute (id, name, user_id, realm_id, storage_provider_id, value) FROM stdin;
    public       
   magnittest    false    281   ��      a          0    17487    fed_user_consent 
   TABLE DATA           �   COPY public.fed_user_consent (id, client_id, user_id, realm_id, storage_provider_id, created_date, last_updated_date, client_storage_provider, external_client_id) FROM stdin;
    public       
   magnittest    false    282   ��      n          0    17809    fed_user_consent_cl_scope 
   TABLE DATA           N   COPY public.fed_user_consent_cl_scope (user_consent_id, scope_id) FROM stdin;
    public       
   magnittest    false    295   ��      b          0    17496    fed_user_credential 
   TABLE DATA           �   COPY public.fed_user_credential (id, salt, type, created_date, user_id, realm_id, storage_provider_id, user_label, secret_data, credential_data, priority) FROM stdin;
    public       
   magnittest    false    283   ��      c          0    17505    fed_user_group_membership 
   TABLE DATA           e   COPY public.fed_user_group_membership (group_id, user_id, realm_id, storage_provider_id) FROM stdin;
    public       
   magnittest    false    284   �      d          0    17508    fed_user_required_action 
   TABLE DATA           k   COPY public.fed_user_required_action (required_action, user_id, realm_id, storage_provider_id) FROM stdin;
    public       
   magnittest    false    285   8�      e          0    17514    fed_user_role_mapping 
   TABLE DATA           `   COPY public.fed_user_role_mapping (role_id, user_id, realm_id, storage_provider_id) FROM stdin;
    public       
   magnittest    false    286   U�      6          0    16802    federated_identity 
   TABLE DATA           �   COPY public.federated_identity (identity_provider, realm_id, federated_user_id, federated_username, token, user_id) FROM stdin;
    public       
   magnittest    false    239   r�      h          0    17579    federated_user 
   TABLE DATA           K   COPY public.federated_user (id, storage_provider_id, realm_id) FROM stdin;
    public       
   magnittest    false    289   ��      P          0    17204    group_attribute 
   TABLE DATA           D   COPY public.group_attribute (id, name, value, group_id) FROM stdin;
    public       
   magnittest    false    265   ��      O          0    17201    group_role_mapping 
   TABLE DATA           ?   COPY public.group_role_mapping (role_id, group_id) FROM stdin;
    public       
   magnittest    false    264   ��      7          0    16807    identity_provider 
   TABLE DATA             COPY public.identity_provider (internal_id, enabled, provider_alias, provider_id, store_token, authenticate_by_default, realm_id, add_token_role, trust_email, first_broker_login_flow_id, post_broker_login_flow_id, provider_display_name, link_only) FROM stdin;
    public       
   magnittest    false    240   ��      8          0    16816    identity_provider_config 
   TABLE DATA           U   COPY public.identity_provider_config (identity_provider_id, value, name) FROM stdin;
    public       
   magnittest    false    241   �      =          0    16920    identity_provider_mapper 
   TABLE DATA           b   COPY public.identity_provider_mapper (id, name, idp_alias, idp_mapper_name, realm_id) FROM stdin;
    public       
   magnittest    false    246    �      >          0    16925    idp_mapper_config 
   TABLE DATA           G   COPY public.idp_mapper_config (idp_mapper_id, value, name) FROM stdin;
    public       
   magnittest    false    247   =�      N          0    17198    keycloak_group 
   TABLE DATA           J   COPY public.keycloak_group (id, name, parent_group, realm_id) FROM stdin;
    public       
   magnittest    false    263   Z�                 0    16433    keycloak_role 
   TABLE DATA           }   COPY public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) FROM stdin;
    public       
   magnittest    false    217   w�      <          0    16917    migration_model 
   TABLE DATA           C   COPY public.migration_model (id, version, update_time) FROM stdin;
    public       
   magnittest    false    245         M          0    17189    offline_client_session 
   TABLE DATA           �   COPY public.offline_client_session (user_session_id, client_id, offline_flag, "timestamp", data, client_storage_provider, external_client_id) FROM stdin;
    public       
   magnittest    false    262   6      L          0    17184    offline_user_session 
   TABLE DATA           �   COPY public.offline_user_session (user_session_id, user_id, realm_id, created_on, offline_flag, data, last_session_refresh) FROM stdin;
    public       
   magnittest    false    261   S      Z          0    17405    policy_config 
   TABLE DATA           ?   COPY public.policy_config (policy_id, name, value) FROM stdin;
    public       
   magnittest    false    275   p      4          0    16791    protocol_mapper 
   TABLE DATA           o   COPY public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) FROM stdin;
    public       
   magnittest    false    237   n	      5          0    16797    protocol_mapper_config 
   TABLE DATA           Q   COPY public.protocol_mapper_config (protocol_mapper_id, value, name) FROM stdin;
    public       
   magnittest    false    238         !          0    16439    realm 
   TABLE DATA              COPY public.realm (id, access_code_lifespan, user_action_lifespan, access_token_lifespan, account_theme, admin_theme, email_theme, enabled, events_enabled, events_expiration, login_theme, name, not_before, password_policy, registration_allowed, remember_me, reset_password_allowed, social, ssl_required, sso_idle_timeout, sso_max_lifespan, update_profile_on_soc_login, verify_email, master_admin_client, login_lifespan, internationalization_enabled, default_locale, reg_email_as_username, admin_events_enabled, admin_events_details_enabled, edit_username_allowed, otp_policy_counter, otp_policy_window, otp_policy_period, otp_policy_digits, otp_policy_alg, otp_policy_type, browser_flow, registration_flow, direct_grant_flow, reset_credentials_flow, client_auth_flow, offline_session_idle_timeout, revoke_refresh_token, access_token_life_implicit, login_with_email_allowed, duplicate_emails_allowed, docker_auth_flow, refresh_token_max_reuse, allow_user_managed_access, sso_max_lifespan_remember_me, sso_idle_timeout_remember_me, default_role) FROM stdin;
    public       
   magnittest    false    218   �      "          0    16456    realm_attribute 
   TABLE DATA           @   COPY public.realm_attribute (name, realm_id, value) FROM stdin;
    public       
   magnittest    false    219   �       R          0    17213    realm_default_groups 
   TABLE DATA           B   COPY public.realm_default_groups (realm_id, group_id) FROM stdin;
    public       
   magnittest    false    267   �$      ;          0    16909    realm_enabled_event_types 
   TABLE DATA           D   COPY public.realm_enabled_event_types (realm_id, value) FROM stdin;
    public       
   magnittest    false    244   �$      #          0    16464    realm_events_listeners 
   TABLE DATA           A   COPY public.realm_events_listeners (realm_id, value) FROM stdin;
    public       
   magnittest    false    220   �$      s          0    17919    realm_localizations 
   TABLE DATA           F   COPY public.realm_localizations (realm_id, locale, texts) FROM stdin;
    public       
   magnittest    false    300   %      $          0    16467    realm_required_credential 
   TABLE DATA           ^   COPY public.realm_required_credential (type, form_label, input, secret, realm_id) FROM stdin;
    public       
   magnittest    false    221   )%      %          0    16474    realm_smtp_config 
   TABLE DATA           B   COPY public.realm_smtp_config (realm_id, value, name) FROM stdin;
    public       
   magnittest    false    222   h%      9          0    16825    realm_supported_locales 
   TABLE DATA           B   COPY public.realm_supported_locales (realm_id, value) FROM stdin;
    public       
   magnittest    false    242   �%      &          0    16484    redirect_uris 
   TABLE DATA           9   COPY public.redirect_uris (client_id, value) FROM stdin;
    public       
   magnittest    false    223   �%      K          0    17148    required_action_config 
   TABLE DATA           Q   COPY public.required_action_config (required_action_id, value, name) FROM stdin;
    public       
   magnittest    false    260   �&      J          0    17141    required_action_provider 
   TABLE DATA           }   COPY public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority) FROM stdin;
    public       
   magnittest    false    259   �&      p          0    17848    resource_attribute 
   TABLE DATA           J   COPY public.resource_attribute (id, name, value, resource_id) FROM stdin;
    public       
   magnittest    false    297   o)      \          0    17432    resource_policy 
   TABLE DATA           A   COPY public.resource_policy (resource_id, policy_id) FROM stdin;
    public       
   magnittest    false    277   �)      [          0    17417    resource_scope 
   TABLE DATA           ?   COPY public.resource_scope (resource_id, scope_id) FROM stdin;
    public       
   magnittest    false    276   �)      V          0    17355    resource_server 
   TABLE DATA           k   COPY public.resource_server (id, allow_rs_remote_mgmt, policy_enforce_mode, decision_strategy) FROM stdin;
    public       
   magnittest    false    271   �)      o          0    17824    resource_server_perm_ticket 
   TABLE DATA           �   COPY public.resource_server_perm_ticket (id, owner, requester, created_timestamp, granted_timestamp, resource_id, scope_id, resource_server_id, policy_id) FROM stdin;
    public       
   magnittest    false    296   %*      Y          0    17391    resource_server_policy 
   TABLE DATA           �   COPY public.resource_server_policy (id, name, description, type, decision_strategy, logic, resource_server_id, owner) FROM stdin;
    public       
   magnittest    false    274   B*      W          0    17363    resource_server_resource 
   TABLE DATA           �   COPY public.resource_server_resource (id, name, type, icon_uri, owner, resource_server_id, owner_managed_access, display_name) FROM stdin;
    public       
   magnittest    false    272   z+      X          0    17377    resource_server_scope 
   TABLE DATA           e   COPY public.resource_server_scope (id, name, icon_uri, resource_server_id, display_name) FROM stdin;
    public       
   magnittest    false    273   4,      q          0    17866    resource_uris 
   TABLE DATA           ;   COPY public.resource_uris (resource_id, value) FROM stdin;
    public       
   magnittest    false    298   Q,      r          0    17876    role_attribute 
   TABLE DATA           B   COPY public.role_attribute (id, role_id, name, value) FROM stdin;
    public       
   magnittest    false    299   �,      '          0    16487    scope_mapping 
   TABLE DATA           ;   COPY public.scope_mapping (client_id, role_id) FROM stdin;
    public       
   magnittest    false    224   -      ]          0    17447    scope_policy 
   TABLE DATA           ;   COPY public.scope_policy (scope_id, policy_id) FROM stdin;
    public       
   magnittest    false    278   r-      )          0    16493    user_attribute 
   TABLE DATA           B   COPY public.user_attribute (name, value, user_id, id) FROM stdin;
    public       
   magnittest    false    226   �-      ?          0    16930    user_consent 
   TABLE DATA           �   COPY public.user_consent (id, client_id, user_id, created_date, last_updated_date, client_storage_provider, external_client_id) FROM stdin;
    public       
   magnittest    false    248   �-      m          0    17799    user_consent_client_scope 
   TABLE DATA           N   COPY public.user_consent_client_scope (user_consent_id, scope_id) FROM stdin;
    public       
   magnittest    false    294   �-      *          0    16498    user_entity 
   TABLE DATA           �   COPY public.user_entity (id, email, email_constraint, email_verified, enabled, federation_link, first_name, last_name, realm_id, username, created_timestamp, service_account_client_link, not_before) FROM stdin;
    public       
   magnittest    false    227   �-      +          0    16506    user_federation_config 
   TABLE DATA           Z   COPY public.user_federation_config (user_federation_provider_id, value, name) FROM stdin;
    public       
   magnittest    false    228   �/      F          0    17042    user_federation_mapper 
   TABLE DATA           t   COPY public.user_federation_mapper (id, name, federation_provider_id, federation_mapper_type, realm_id) FROM stdin;
    public       
   magnittest    false    255   �/      G          0    17047    user_federation_mapper_config 
   TABLE DATA           _   COPY public.user_federation_mapper_config (user_federation_mapper_id, value, name) FROM stdin;
    public       
   magnittest    false    256   �/      ,          0    16511    user_federation_provider 
   TABLE DATA           �   COPY public.user_federation_provider (id, changed_sync_period, display_name, full_sync_period, last_sync, priority, provider_name, realm_id) FROM stdin;
    public       
   magnittest    false    229   �/      Q          0    17210    user_group_membership 
   TABLE DATA           B   COPY public.user_group_membership (group_id, user_id) FROM stdin;
    public       
   magnittest    false    266   0      -          0    16516    user_required_action 
   TABLE DATA           H   COPY public.user_required_action (user_id, required_action) FROM stdin;
    public       
   magnittest    false    230   %0      .          0    16519    user_role_mapping 
   TABLE DATA           =   COPY public.user_role_mapping (role_id, user_id) FROM stdin;
    public       
   magnittest    false    231   B0      /          0    16522    user_session 
   TABLE DATA           �   COPY public.user_session (id, auth_method, ip_address, last_session_refresh, login_username, realm_id, remember_me, started, user_id, user_session_state, broker_session_id, broker_user_id) FROM stdin;
    public       
   magnittest    false    232   `1      :          0    16828    user_session_note 
   TABLE DATA           F   COPY public.user_session_note (user_session, name, value) FROM stdin;
    public       
   magnittest    false    243   }1      (          0    16490    username_login_failure 
   TABLE DATA           �   COPY public.username_login_failure (realm_id, username, failed_login_not_before, last_failure, last_ip_failure, num_failures) FROM stdin;
    public       
   magnittest    false    225   �1      0          0    16533    web_origins 
   TABLE DATA           7   COPY public.web_origins (client_id, value) FROM stdin;
    public       
   magnittest    false    233   �1      R           2606    17591 &   username_login_failure CONSTRAINT_17-2 
   CONSTRAINT     v   ALTER TABLE ONLY public.username_login_failure
    ADD CONSTRAINT "CONSTRAINT_17-2" PRIMARY KEY (realm_id, username);
 R   ALTER TABLE ONLY public.username_login_failure DROP CONSTRAINT "CONSTRAINT_17-2";
       public         
   magnittest    false    225    225            7           2606    17902 ,   keycloak_role UK_J3RWUVD56ONTGSUHOGM184WW2-2 
   CONSTRAINT     �   ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT "UK_J3RWUVD56ONTGSUHOGM184WW2-2" UNIQUE (name, client_realm_constraint);
 X   ALTER TABLE ONLY public.keycloak_role DROP CONSTRAINT "UK_J3RWUVD56ONTGSUHOGM184WW2-2";
       public         
   magnittest    false    217    217            (           2606    17730 )   client_auth_flow_bindings c_cli_flow_bind 
   CONSTRAINT     |   ALTER TABLE ONLY public.client_auth_flow_bindings
    ADD CONSTRAINT c_cli_flow_bind PRIMARY KEY (client_id, binding_name);
 S   ALTER TABLE ONLY public.client_auth_flow_bindings DROP CONSTRAINT c_cli_flow_bind;
       public         
   magnittest    false    291    291            *           2606    17931 $   client_scope_client c_cli_scope_bind 
   CONSTRAINT     s   ALTER TABLE ONLY public.client_scope_client
    ADD CONSTRAINT c_cli_scope_bind PRIMARY KEY (client_id, scope_id);
 N   ALTER TABLE ONLY public.client_scope_client DROP CONSTRAINT c_cli_scope_bind;
       public         
   magnittest    false    292    292            %           2606    17605 .   client_initial_access cnstr_client_init_acc_pk 
   CONSTRAINT     l   ALTER TABLE ONLY public.client_initial_access
    ADD CONSTRAINT cnstr_client_init_acc_pk PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.client_initial_access DROP CONSTRAINT cnstr_client_init_acc_pk;
       public         
   magnittest    false    290            �           2606    17252 ,   realm_default_groups con_group_id_def_groups 
   CONSTRAINT     k   ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT con_group_id_def_groups UNIQUE (group_id);
 V   ALTER TABLE ONLY public.realm_default_groups DROP CONSTRAINT con_group_id_def_groups;
       public         
   magnittest    false    267                       2606    17528 !   broker_link constr_broker_link_pk 
   CONSTRAINT     w   ALTER TABLE ONLY public.broker_link
    ADD CONSTRAINT constr_broker_link_pk PRIMARY KEY (identity_provider, user_id);
 K   ALTER TABLE ONLY public.broker_link DROP CONSTRAINT constr_broker_link_pk;
       public         
   magnittest    false    280    280            �           2606    17160 /   client_user_session_note constr_cl_usr_ses_note 
   CONSTRAINT        ALTER TABLE ONLY public.client_user_session_note
    ADD CONSTRAINT constr_cl_usr_ses_note PRIMARY KEY (client_session, name);
 Y   ALTER TABLE ONLY public.client_user_session_note DROP CONSTRAINT constr_cl_usr_ses_note;
       public         
   magnittest    false    258    258                       2606    17548 +   component_config constr_component_config_pk 
   CONSTRAINT     i   ALTER TABLE ONLY public.component_config
    ADD CONSTRAINT constr_component_config_pk PRIMARY KEY (id);
 U   ALTER TABLE ONLY public.component_config DROP CONSTRAINT constr_component_config_pk;
       public         
   magnittest    false    287                       2606    17546    component constr_component_pk 
   CONSTRAINT     [   ALTER TABLE ONLY public.component
    ADD CONSTRAINT constr_component_pk PRIMARY KEY (id);
 G   ALTER TABLE ONLY public.component DROP CONSTRAINT constr_component_pk;
       public         
   magnittest    false    288                       2606    17544 3   fed_user_required_action constr_fed_required_action 
   CONSTRAINT     �   ALTER TABLE ONLY public.fed_user_required_action
    ADD CONSTRAINT constr_fed_required_action PRIMARY KEY (required_action, user_id);
 ]   ALTER TABLE ONLY public.fed_user_required_action DROP CONSTRAINT constr_fed_required_action;
       public         
   magnittest    false    285    285                       2606    17530 *   fed_user_attribute constr_fed_user_attr_pk 
   CONSTRAINT     h   ALTER TABLE ONLY public.fed_user_attribute
    ADD CONSTRAINT constr_fed_user_attr_pk PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.fed_user_attribute DROP CONSTRAINT constr_fed_user_attr_pk;
       public         
   magnittest    false    281                       2606    17532 +   fed_user_consent constr_fed_user_consent_pk 
   CONSTRAINT     i   ALTER TABLE ONLY public.fed_user_consent
    ADD CONSTRAINT constr_fed_user_consent_pk PRIMARY KEY (id);
 U   ALTER TABLE ONLY public.fed_user_consent DROP CONSTRAINT constr_fed_user_consent_pk;
       public         
   magnittest    false    282                       2606    17538 +   fed_user_credential constr_fed_user_cred_pk 
   CONSTRAINT     i   ALTER TABLE ONLY public.fed_user_credential
    ADD CONSTRAINT constr_fed_user_cred_pk PRIMARY KEY (id);
 U   ALTER TABLE ONLY public.fed_user_credential DROP CONSTRAINT constr_fed_user_cred_pk;
       public         
   magnittest    false    283                       2606    17540 /   fed_user_group_membership constr_fed_user_group 
   CONSTRAINT     |   ALTER TABLE ONLY public.fed_user_group_membership
    ADD CONSTRAINT constr_fed_user_group PRIMARY KEY (group_id, user_id);
 Y   ALTER TABLE ONLY public.fed_user_group_membership DROP CONSTRAINT constr_fed_user_group;
       public         
   magnittest    false    284    284                       2606    17542 *   fed_user_role_mapping constr_fed_user_role 
   CONSTRAINT     v   ALTER TABLE ONLY public.fed_user_role_mapping
    ADD CONSTRAINT constr_fed_user_role PRIMARY KEY (role_id, user_id);
 T   ALTER TABLE ONLY public.fed_user_role_mapping DROP CONSTRAINT constr_fed_user_role;
       public         
   magnittest    false    286    286            #           2606    17585 $   federated_user constr_federated_user 
   CONSTRAINT     b   ALTER TABLE ONLY public.federated_user
    ADD CONSTRAINT constr_federated_user PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.federated_user DROP CONSTRAINT constr_federated_user;
       public         
   magnittest    false    289            �           2606    17689 0   realm_default_groups constr_realm_default_groups 
   CONSTRAINT     ~   ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT constr_realm_default_groups PRIMARY KEY (realm_id, group_id);
 Z   ALTER TABLE ONLY public.realm_default_groups DROP CONSTRAINT constr_realm_default_groups;
       public         
   magnittest    false    267    267            �           2606    17706 8   realm_enabled_event_types constr_realm_enabl_event_types 
   CONSTRAINT     �   ALTER TABLE ONLY public.realm_enabled_event_types
    ADD CONSTRAINT constr_realm_enabl_event_types PRIMARY KEY (realm_id, value);
 b   ALTER TABLE ONLY public.realm_enabled_event_types DROP CONSTRAINT constr_realm_enabl_event_types;
       public         
   magnittest    false    244    244            E           2606    17708 4   realm_events_listeners constr_realm_events_listeners 
   CONSTRAINT        ALTER TABLE ONLY public.realm_events_listeners
    ADD CONSTRAINT constr_realm_events_listeners PRIMARY KEY (realm_id, value);
 ^   ALTER TABLE ONLY public.realm_events_listeners DROP CONSTRAINT constr_realm_events_listeners;
       public         
   magnittest    false    220    220            �           2606    17710 6   realm_supported_locales constr_realm_supported_locales 
   CONSTRAINT     �   ALTER TABLE ONLY public.realm_supported_locales
    ADD CONSTRAINT constr_realm_supported_locales PRIMARY KEY (realm_id, value);
 `   ALTER TABLE ONLY public.realm_supported_locales DROP CONSTRAINT constr_realm_supported_locales;
       public         
   magnittest    false    242    242            �           2606    16837    identity_provider constraint_2b 
   CONSTRAINT     f   ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT constraint_2b PRIMARY KEY (internal_id);
 I   ALTER TABLE ONLY public.identity_provider DROP CONSTRAINT constraint_2b;
       public         
   magnittest    false    240            o           2606    16771    client_attributes constraint_3c 
   CONSTRAINT     j   ALTER TABLE ONLY public.client_attributes
    ADD CONSTRAINT constraint_3c PRIMARY KEY (client_id, name);
 I   ALTER TABLE ONLY public.client_attributes DROP CONSTRAINT constraint_3c;
       public         
   magnittest    false    234    234            4           2606    16545    event_entity constraint_4 
   CONSTRAINT     W   ALTER TABLE ONLY public.event_entity
    ADD CONSTRAINT constraint_4 PRIMARY KEY (id);
 C   ALTER TABLE ONLY public.event_entity DROP CONSTRAINT constraint_4;
       public         
   magnittest    false    216            |           2606    16839     federated_identity constraint_40 
   CONSTRAINT     v   ALTER TABLE ONLY public.federated_identity
    ADD CONSTRAINT constraint_40 PRIMARY KEY (identity_provider, user_id);
 J   ALTER TABLE ONLY public.federated_identity DROP CONSTRAINT constraint_40;
       public         
   magnittest    false    239    239            =           2606    16547    realm constraint_4a 
   CONSTRAINT     Q   ALTER TABLE ONLY public.realm
    ADD CONSTRAINT constraint_4a PRIMARY KEY (id);
 =   ALTER TABLE ONLY public.realm DROP CONSTRAINT constraint_4a;
       public         
   magnittest    false    218            +           2606    16549     client_session_role constraint_5 
   CONSTRAINT     s   ALTER TABLE ONLY public.client_session_role
    ADD CONSTRAINT constraint_5 PRIMARY KEY (client_session, role_id);
 J   ALTER TABLE ONLY public.client_session_role DROP CONSTRAINT constraint_5;
       public         
   magnittest    false    213    213            j           2606    16551    user_session constraint_57 
   CONSTRAINT     X   ALTER TABLE ONLY public.user_session
    ADD CONSTRAINT constraint_57 PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.user_session DROP CONSTRAINT constraint_57;
       public         
   magnittest    false    232            a           2606    16553 &   user_federation_provider constraint_5c 
   CONSTRAINT     d   ALTER TABLE ONLY public.user_federation_provider
    ADD CONSTRAINT constraint_5c PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.user_federation_provider DROP CONSTRAINT constraint_5c;
       public         
   magnittest    false    229            r           2606    16773 !   client_session_note constraint_5e 
   CONSTRAINT     q   ALTER TABLE ONLY public.client_session_note
    ADD CONSTRAINT constraint_5e PRIMARY KEY (client_session, name);
 K   ALTER TABLE ONLY public.client_session_note DROP CONSTRAINT constraint_5e;
       public         
   magnittest    false    235    235            #           2606    16557    client constraint_7 
   CONSTRAINT     Q   ALTER TABLE ONLY public.client
    ADD CONSTRAINT constraint_7 PRIMARY KEY (id);
 =   ALTER TABLE ONLY public.client DROP CONSTRAINT constraint_7;
       public         
   magnittest    false    211            (           2606    16559    client_session constraint_8 
   CONSTRAINT     Y   ALTER TABLE ONLY public.client_session
    ADD CONSTRAINT constraint_8 PRIMARY KEY (id);
 E   ALTER TABLE ONLY public.client_session DROP CONSTRAINT constraint_8;
       public         
   magnittest    false    212            O           2606    16561    scope_mapping constraint_81 
   CONSTRAINT     i   ALTER TABLE ONLY public.scope_mapping
    ADD CONSTRAINT constraint_81 PRIMARY KEY (client_id, role_id);
 E   ALTER TABLE ONLY public.scope_mapping DROP CONSTRAINT constraint_81;
       public         
   magnittest    false    224    224            t           2606    16775 '   client_node_registrations constraint_84 
   CONSTRAINT     r   ALTER TABLE ONLY public.client_node_registrations
    ADD CONSTRAINT constraint_84 PRIMARY KEY (client_id, name);
 Q   ALTER TABLE ONLY public.client_node_registrations DROP CONSTRAINT constraint_84;
       public         
   magnittest    false    236    236            B           2606    16563    realm_attribute constraint_9 
   CONSTRAINT     f   ALTER TABLE ONLY public.realm_attribute
    ADD CONSTRAINT constraint_9 PRIMARY KEY (name, realm_id);
 F   ALTER TABLE ONLY public.realm_attribute DROP CONSTRAINT constraint_9;
       public         
   magnittest    false    219    219            H           2606    16565 '   realm_required_credential constraint_92 
   CONSTRAINT     q   ALTER TABLE ONLY public.realm_required_credential
    ADD CONSTRAINT constraint_92 PRIMARY KEY (realm_id, type);
 Q   ALTER TABLE ONLY public.realm_required_credential DROP CONSTRAINT constraint_92;
       public         
   magnittest    false    221    221            9           2606    16567    keycloak_role constraint_a 
   CONSTRAINT     X   ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT constraint_a PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.keycloak_role DROP CONSTRAINT constraint_a;
       public         
   magnittest    false    217            �           2606    17693 0   admin_event_entity constraint_admin_event_entity 
   CONSTRAINT     n   ALTER TABLE ONLY public.admin_event_entity
    ADD CONSTRAINT constraint_admin_event_entity PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.admin_event_entity DROP CONSTRAINT constraint_admin_event_entity;
       public         
   magnittest    false    250            �           2606    17068 1   authenticator_config_entry constraint_auth_cfg_pk 
   CONSTRAINT     �   ALTER TABLE ONLY public.authenticator_config_entry
    ADD CONSTRAINT constraint_auth_cfg_pk PRIMARY KEY (authenticator_id, name);
 [   ALTER TABLE ONLY public.authenticator_config_entry DROP CONSTRAINT constraint_auth_cfg_pk;
       public         
   magnittest    false    254    254            �           2606    17066 0   authentication_execution constraint_auth_exec_pk 
   CONSTRAINT     n   ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT constraint_auth_exec_pk PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.authentication_execution DROP CONSTRAINT constraint_auth_exec_pk;
       public         
   magnittest    false    253            �           2606    17064 +   authentication_flow constraint_auth_flow_pk 
   CONSTRAINT     i   ALTER TABLE ONLY public.authentication_flow
    ADD CONSTRAINT constraint_auth_flow_pk PRIMARY KEY (id);
 U   ALTER TABLE ONLY public.authentication_flow DROP CONSTRAINT constraint_auth_flow_pk;
       public         
   magnittest    false    252            �           2606    17062 '   authenticator_config constraint_auth_pk 
   CONSTRAINT     e   ALTER TABLE ONLY public.authenticator_config
    ADD CONSTRAINT constraint_auth_pk PRIMARY KEY (id);
 Q   ALTER TABLE ONLY public.authenticator_config DROP CONSTRAINT constraint_auth_pk;
       public         
   magnittest    false    251            �           2606    17072 4   client_session_auth_status constraint_auth_status_pk 
   CONSTRAINT     �   ALTER TABLE ONLY public.client_session_auth_status
    ADD CONSTRAINT constraint_auth_status_pk PRIMARY KEY (client_session, authenticator);
 ^   ALTER TABLE ONLY public.client_session_auth_status DROP CONSTRAINT constraint_auth_status_pk;
       public         
   magnittest    false    257    257            g           2606    16569    user_role_mapping constraint_c 
   CONSTRAINT     j   ALTER TABLE ONLY public.user_role_mapping
    ADD CONSTRAINT constraint_c PRIMARY KEY (role_id, user_id);
 H   ALTER TABLE ONLY public.user_role_mapping DROP CONSTRAINT constraint_c;
       public         
   magnittest    false    231    231            -           2606    17687 (   composite_role constraint_composite_role 
   CONSTRAINT     y   ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT constraint_composite_role PRIMARY KEY (composite, child_role);
 R   ALTER TABLE ONLY public.composite_role DROP CONSTRAINT constraint_composite_role;
       public         
   magnittest    false    214    214            �           2606    16955 /   client_session_prot_mapper constraint_cs_pmp_pk 
   CONSTRAINT     �   ALTER TABLE ONLY public.client_session_prot_mapper
    ADD CONSTRAINT constraint_cs_pmp_pk PRIMARY KEY (client_session, protocol_mapper_id);
 Y   ALTER TABLE ONLY public.client_session_prot_mapper DROP CONSTRAINT constraint_cs_pmp_pk;
       public         
   magnittest    false    249    249            �           2606    16841 %   identity_provider_config constraint_d 
   CONSTRAINT     {   ALTER TABLE ONLY public.identity_provider_config
    ADD CONSTRAINT constraint_d PRIMARY KEY (identity_provider_id, name);
 O   ALTER TABLE ONLY public.identity_provider_config DROP CONSTRAINT constraint_d;
       public         
   magnittest    false    241    241            �           2606    17411    policy_config constraint_dpc 
   CONSTRAINT     g   ALTER TABLE ONLY public.policy_config
    ADD CONSTRAINT constraint_dpc PRIMARY KEY (policy_id, name);
 F   ALTER TABLE ONLY public.policy_config DROP CONSTRAINT constraint_dpc;
       public         
   magnittest    false    275    275            J           2606    16571    realm_smtp_config constraint_e 
   CONSTRAINT     h   ALTER TABLE ONLY public.realm_smtp_config
    ADD CONSTRAINT constraint_e PRIMARY KEY (realm_id, name);
 H   ALTER TABLE ONLY public.realm_smtp_config DROP CONSTRAINT constraint_e;
       public         
   magnittest    false    222    222            1           2606    16573    credential constraint_f 
   CONSTRAINT     U   ALTER TABLE ONLY public.credential
    ADD CONSTRAINT constraint_f PRIMARY KEY (id);
 A   ALTER TABLE ONLY public.credential DROP CONSTRAINT constraint_f;
       public         
   magnittest    false    215            _           2606    16575 $   user_federation_config constraint_f9 
   CONSTRAINT     �   ALTER TABLE ONLY public.user_federation_config
    ADD CONSTRAINT constraint_f9 PRIMARY KEY (user_federation_provider_id, name);
 N   ALTER TABLE ONLY public.user_federation_config DROP CONSTRAINT constraint_f9;
       public         
   magnittest    false    228    228            7           2606    17828 ,   resource_server_perm_ticket constraint_fapmt 
   CONSTRAINT     j   ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT constraint_fapmt PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.resource_server_perm_ticket DROP CONSTRAINT constraint_fapmt;
       public         
   magnittest    false    296            �           2606    17369 )   resource_server_resource constraint_farsr 
   CONSTRAINT     g   ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT constraint_farsr PRIMARY KEY (id);
 S   ALTER TABLE ONLY public.resource_server_resource DROP CONSTRAINT constraint_farsr;
       public         
   magnittest    false    272            �           2606    17397 (   resource_server_policy constraint_farsrp 
   CONSTRAINT     f   ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT constraint_farsrp PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.resource_server_policy DROP CONSTRAINT constraint_farsrp;
       public         
   magnittest    false    274            �           2606    17466 %   associated_policy constraint_farsrpap 
   CONSTRAINT     �   ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT constraint_farsrpap PRIMARY KEY (policy_id, associated_policy_id);
 O   ALTER TABLE ONLY public.associated_policy DROP CONSTRAINT constraint_farsrpap;
       public         
   magnittest    false    279    279            �           2606    17436 "   resource_policy constraint_farsrpp 
   CONSTRAINT     t   ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT constraint_farsrpp PRIMARY KEY (resource_id, policy_id);
 L   ALTER TABLE ONLY public.resource_policy DROP CONSTRAINT constraint_farsrpp;
       public         
   magnittest    false    277    277            �           2606    17383 '   resource_server_scope constraint_farsrs 
   CONSTRAINT     e   ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT constraint_farsrs PRIMARY KEY (id);
 Q   ALTER TABLE ONLY public.resource_server_scope DROP CONSTRAINT constraint_farsrs;
       public         
   magnittest    false    273            �           2606    17421 !   resource_scope constraint_farsrsp 
   CONSTRAINT     r   ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT constraint_farsrsp PRIMARY KEY (resource_id, scope_id);
 K   ALTER TABLE ONLY public.resource_scope DROP CONSTRAINT constraint_farsrsp;
       public         
   magnittest    false    276    276            �           2606    17451     scope_policy constraint_farsrsps 
   CONSTRAINT     o   ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT constraint_farsrsps PRIMARY KEY (scope_id, policy_id);
 J   ALTER TABLE ONLY public.scope_policy DROP CONSTRAINT constraint_farsrsps;
       public         
   magnittest    false    278    278            X           2606    16577    user_entity constraint_fb 
   CONSTRAINT     W   ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT constraint_fb PRIMARY KEY (id);
 C   ALTER TABLE ONLY public.user_entity DROP CONSTRAINT constraint_fb;
       public         
   magnittest    false    227            �           2606    17076 9   user_federation_mapper_config constraint_fedmapper_cfg_pm 
   CONSTRAINT     �   ALTER TABLE ONLY public.user_federation_mapper_config
    ADD CONSTRAINT constraint_fedmapper_cfg_pm PRIMARY KEY (user_federation_mapper_id, name);
 c   ALTER TABLE ONLY public.user_federation_mapper_config DROP CONSTRAINT constraint_fedmapper_cfg_pm;
       public         
   magnittest    false    256    256            �           2606    17074 -   user_federation_mapper constraint_fedmapperpm 
   CONSTRAINT     k   ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT constraint_fedmapperpm PRIMARY KEY (id);
 W   ALTER TABLE ONLY public.user_federation_mapper DROP CONSTRAINT constraint_fedmapperpm;
       public         
   magnittest    false    255            5           2606    17813 6   fed_user_consent_cl_scope constraint_fgrntcsnt_clsc_pm 
   CONSTRAINT     �   ALTER TABLE ONLY public.fed_user_consent_cl_scope
    ADD CONSTRAINT constraint_fgrntcsnt_clsc_pm PRIMARY KEY (user_consent_id, scope_id);
 `   ALTER TABLE ONLY public.fed_user_consent_cl_scope DROP CONSTRAINT constraint_fgrntcsnt_clsc_pm;
       public         
   magnittest    false    295    295            2           2606    17803 5   user_consent_client_scope constraint_grntcsnt_clsc_pm 
   CONSTRAINT     �   ALTER TABLE ONLY public.user_consent_client_scope
    ADD CONSTRAINT constraint_grntcsnt_clsc_pm PRIMARY KEY (user_consent_id, scope_id);
 _   ALTER TABLE ONLY public.user_consent_client_scope DROP CONSTRAINT constraint_grntcsnt_clsc_pm;
       public         
   magnittest    false    294    294            �           2606    16949 #   user_consent constraint_grntcsnt_pm 
   CONSTRAINT     a   ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT constraint_grntcsnt_pm PRIMARY KEY (id);
 M   ALTER TABLE ONLY public.user_consent DROP CONSTRAINT constraint_grntcsnt_pm;
       public         
   magnittest    false    248            �           2606    17219    keycloak_group constraint_group 
   CONSTRAINT     ]   ALTER TABLE ONLY public.keycloak_group
    ADD CONSTRAINT constraint_group PRIMARY KEY (id);
 I   ALTER TABLE ONLY public.keycloak_group DROP CONSTRAINT constraint_group;
       public         
   magnittest    false    263            �           2606    17226 -   group_attribute constraint_group_attribute_pk 
   CONSTRAINT     k   ALTER TABLE ONLY public.group_attribute
    ADD CONSTRAINT constraint_group_attribute_pk PRIMARY KEY (id);
 W   ALTER TABLE ONLY public.group_attribute DROP CONSTRAINT constraint_group_attribute_pk;
       public         
   magnittest    false    265            �           2606    17240 (   group_role_mapping constraint_group_role 
   CONSTRAINT     u   ALTER TABLE ONLY public.group_role_mapping
    ADD CONSTRAINT constraint_group_role PRIMARY KEY (role_id, group_id);
 R   ALTER TABLE ONLY public.group_role_mapping DROP CONSTRAINT constraint_group_role;
       public         
   magnittest    false    264    264            �           2606    16945 (   identity_provider_mapper constraint_idpm 
   CONSTRAINT     f   ALTER TABLE ONLY public.identity_provider_mapper
    ADD CONSTRAINT constraint_idpm PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.identity_provider_mapper DROP CONSTRAINT constraint_idpm;
       public         
   magnittest    false    246            �           2606    17125 '   idp_mapper_config constraint_idpmconfig 
   CONSTRAINT     v   ALTER TABLE ONLY public.idp_mapper_config
    ADD CONSTRAINT constraint_idpmconfig PRIMARY KEY (idp_mapper_id, name);
 Q   ALTER TABLE ONLY public.idp_mapper_config DROP CONSTRAINT constraint_idpmconfig;
       public         
   magnittest    false    247    247            �           2606    16943 !   migration_model constraint_migmod 
   CONSTRAINT     _   ALTER TABLE ONLY public.migration_model
    ADD CONSTRAINT constraint_migmod PRIMARY KEY (id);
 K   ALTER TABLE ONLY public.migration_model DROP CONSTRAINT constraint_migmod;
       public         
   magnittest    false    245            �           2606    17908 1   offline_client_session constraint_offl_cl_ses_pk3 
   CONSTRAINT     �   ALTER TABLE ONLY public.offline_client_session
    ADD CONSTRAINT constraint_offl_cl_ses_pk3 PRIMARY KEY (user_session_id, client_id, client_storage_provider, external_client_id, offline_flag);
 [   ALTER TABLE ONLY public.offline_client_session DROP CONSTRAINT constraint_offl_cl_ses_pk3;
       public         
   magnittest    false    262    262    262    262    262            �           2606    17195 /   offline_user_session constraint_offl_us_ses_pk2 
   CONSTRAINT     �   ALTER TABLE ONLY public.offline_user_session
    ADD CONSTRAINT constraint_offl_us_ses_pk2 PRIMARY KEY (user_session_id, offline_flag);
 Y   ALTER TABLE ONLY public.offline_user_session DROP CONSTRAINT constraint_offl_us_ses_pk2;
       public         
   magnittest    false    261    261            v           2606    16835    protocol_mapper constraint_pcm 
   CONSTRAINT     \   ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT constraint_pcm PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.protocol_mapper DROP CONSTRAINT constraint_pcm;
       public         
   magnittest    false    237            z           2606    17118 *   protocol_mapper_config constraint_pmconfig 
   CONSTRAINT     ~   ALTER TABLE ONLY public.protocol_mapper_config
    ADD CONSTRAINT constraint_pmconfig PRIMARY KEY (protocol_mapper_id, name);
 T   ALTER TABLE ONLY public.protocol_mapper_config DROP CONSTRAINT constraint_pmconfig;
       public         
   magnittest    false    238    238            L           2606    17712 &   redirect_uris constraint_redirect_uris 
   CONSTRAINT     r   ALTER TABLE ONLY public.redirect_uris
    ADD CONSTRAINT constraint_redirect_uris PRIMARY KEY (client_id, value);
 P   ALTER TABLE ONLY public.redirect_uris DROP CONSTRAINT constraint_redirect_uris;
       public         
   magnittest    false    223    223            �           2606    17158 0   required_action_config constraint_req_act_cfg_pk 
   CONSTRAINT     �   ALTER TABLE ONLY public.required_action_config
    ADD CONSTRAINT constraint_req_act_cfg_pk PRIMARY KEY (required_action_id, name);
 Z   ALTER TABLE ONLY public.required_action_config DROP CONSTRAINT constraint_req_act_cfg_pk;
       public         
   magnittest    false    260    260            �           2606    17156 2   required_action_provider constraint_req_act_prv_pk 
   CONSTRAINT     p   ALTER TABLE ONLY public.required_action_provider
    ADD CONSTRAINT constraint_req_act_prv_pk PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.required_action_provider DROP CONSTRAINT constraint_req_act_prv_pk;
       public         
   magnittest    false    259            d           2606    17070 /   user_required_action constraint_required_action 
   CONSTRAINT     �   ALTER TABLE ONLY public.user_required_action
    ADD CONSTRAINT constraint_required_action PRIMARY KEY (required_action, user_id);
 Y   ALTER TABLE ONLY public.user_required_action DROP CONSTRAINT constraint_required_action;
       public         
   magnittest    false    230    230            =           2606    17875 '   resource_uris constraint_resour_uris_pk 
   CONSTRAINT     u   ALTER TABLE ONLY public.resource_uris
    ADD CONSTRAINT constraint_resour_uris_pk PRIMARY KEY (resource_id, value);
 Q   ALTER TABLE ONLY public.resource_uris DROP CONSTRAINT constraint_resour_uris_pk;
       public         
   magnittest    false    298    298            ?           2606    17882 +   role_attribute constraint_role_attribute_pk 
   CONSTRAINT     i   ALTER TABLE ONLY public.role_attribute
    ADD CONSTRAINT constraint_role_attribute_pk PRIMARY KEY (id);
 U   ALTER TABLE ONLY public.role_attribute DROP CONSTRAINT constraint_role_attribute_pk;
       public         
   magnittest    false    299            T           2606    17154 +   user_attribute constraint_user_attribute_pk 
   CONSTRAINT     i   ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT constraint_user_attribute_pk PRIMARY KEY (id);
 U   ALTER TABLE ONLY public.user_attribute DROP CONSTRAINT constraint_user_attribute_pk;
       public         
   magnittest    false    226            �           2606    17233 +   user_group_membership constraint_user_group 
   CONSTRAINT     x   ALTER TABLE ONLY public.user_group_membership
    ADD CONSTRAINT constraint_user_group PRIMARY KEY (group_id, user_id);
 U   ALTER TABLE ONLY public.user_group_membership DROP CONSTRAINT constraint_user_group;
       public         
   magnittest    false    266    266            �           2606    16845 #   user_session_note constraint_usn_pk 
   CONSTRAINT     q   ALTER TABLE ONLY public.user_session_note
    ADD CONSTRAINT constraint_usn_pk PRIMARY KEY (user_session, name);
 M   ALTER TABLE ONLY public.user_session_note DROP CONSTRAINT constraint_usn_pk;
       public         
   magnittest    false    243    243            l           2606    17714 "   web_origins constraint_web_origins 
   CONSTRAINT     n   ALTER TABLE ONLY public.web_origins
    ADD CONSTRAINT constraint_web_origins PRIMARY KEY (client_id, value);
 L   ALTER TABLE ONLY public.web_origins DROP CONSTRAINT constraint_web_origins;
       public         
   magnittest    false    233    233            �           2606    17336 '   client_scope_attributes pk_cl_tmpl_attr 
   CONSTRAINT     q   ALTER TABLE ONLY public.client_scope_attributes
    ADD CONSTRAINT pk_cl_tmpl_attr PRIMARY KEY (scope_id, name);
 Q   ALTER TABLE ONLY public.client_scope_attributes DROP CONSTRAINT pk_cl_tmpl_attr;
       public         
   magnittest    false    269    269            �           2606    17295    client_scope pk_cli_template 
   CONSTRAINT     Z   ALTER TABLE ONLY public.client_scope
    ADD CONSTRAINT pk_cli_template PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.client_scope DROP CONSTRAINT pk_cli_template;
       public         
   magnittest    false    268            !           2606    16389 .   databasechangeloglock pk_databasechangeloglock 
   CONSTRAINT     l   ALTER TABLE ONLY public.databasechangeloglock
    ADD CONSTRAINT pk_databasechangeloglock PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.databasechangeloglock DROP CONSTRAINT pk_databasechangeloglock;
       public         
   magnittest    false    209            �           2606    17667 "   resource_server pk_resource_server 
   CONSTRAINT     `   ALTER TABLE ONLY public.resource_server
    ADD CONSTRAINT pk_resource_server PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.resource_server DROP CONSTRAINT pk_resource_server;
       public         
   magnittest    false    271            �           2606    17324 +   client_scope_role_mapping pk_template_scope 
   CONSTRAINT     x   ALTER TABLE ONLY public.client_scope_role_mapping
    ADD CONSTRAINT pk_template_scope PRIMARY KEY (scope_id, role_id);
 U   ALTER TABLE ONLY public.client_scope_role_mapping DROP CONSTRAINT pk_template_scope;
       public         
   magnittest    false    270    270            0           2606    17788 )   default_client_scope r_def_cli_scope_bind 
   CONSTRAINT     w   ALTER TABLE ONLY public.default_client_scope
    ADD CONSTRAINT r_def_cli_scope_bind PRIMARY KEY (realm_id, scope_id);
 S   ALTER TABLE ONLY public.default_client_scope DROP CONSTRAINT r_def_cli_scope_bind;
       public         
   magnittest    false    293    293            B           2606    17925 ,   realm_localizations realm_localizations_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.realm_localizations
    ADD CONSTRAINT realm_localizations_pkey PRIMARY KEY (realm_id, locale);
 V   ALTER TABLE ONLY public.realm_localizations DROP CONSTRAINT realm_localizations_pkey;
       public         
   magnittest    false    300    300            ;           2606    17855    resource_attribute res_attr_pk 
   CONSTRAINT     \   ALTER TABLE ONLY public.resource_attribute
    ADD CONSTRAINT res_attr_pk PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.resource_attribute DROP CONSTRAINT res_attr_pk;
       public         
   magnittest    false    297            �           2606    17597    keycloak_group sibling_names 
   CONSTRAINT     o   ALTER TABLE ONLY public.keycloak_group
    ADD CONSTRAINT sibling_names UNIQUE (realm_id, parent_group, name);
 F   ALTER TABLE ONLY public.keycloak_group DROP CONSTRAINT sibling_names;
       public         
   magnittest    false    263    263    263            �           2606    16892 /   identity_provider uk_2daelwnibji49avxsrtuf6xj33 
   CONSTRAINT     ~   ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT uk_2daelwnibji49avxsrtuf6xj33 UNIQUE (provider_alias, realm_id);
 Y   ALTER TABLE ONLY public.identity_provider DROP CONSTRAINT uk_2daelwnibji49avxsrtuf6xj33;
       public         
   magnittest    false    240    240            &           2606    16581 #   client uk_b71cjlbenv945rb6gcon438at 
   CONSTRAINT     m   ALTER TABLE ONLY public.client
    ADD CONSTRAINT uk_b71cjlbenv945rb6gcon438at UNIQUE (realm_id, client_id);
 M   ALTER TABLE ONLY public.client DROP CONSTRAINT uk_b71cjlbenv945rb6gcon438at;
       public         
   magnittest    false    211    211            �           2606    17741    client_scope uk_cli_scope 
   CONSTRAINT     ^   ALTER TABLE ONLY public.client_scope
    ADD CONSTRAINT uk_cli_scope UNIQUE (realm_id, name);
 C   ALTER TABLE ONLY public.client_scope DROP CONSTRAINT uk_cli_scope;
       public         
   magnittest    false    268    268            [           2606    16585 (   user_entity uk_dykn684sl8up1crfei6eckhd7 
   CONSTRAINT     y   ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT uk_dykn684sl8up1crfei6eckhd7 UNIQUE (realm_id, email_constraint);
 R   ALTER TABLE ONLY public.user_entity DROP CONSTRAINT uk_dykn684sl8up1crfei6eckhd7;
       public         
   magnittest    false    227    227            �           2606    17916 4   resource_server_resource uk_frsr6t700s9v50bu18ws5ha6 
   CONSTRAINT     �   ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT uk_frsr6t700s9v50bu18ws5ha6 UNIQUE (name, owner, resource_server_id);
 ^   ALTER TABLE ONLY public.resource_server_resource DROP CONSTRAINT uk_frsr6t700s9v50bu18ws5ha6;
       public         
   magnittest    false    272    272    272            9           2606    17912 7   resource_server_perm_ticket uk_frsr6t700s9v50bu18ws5pmt 
   CONSTRAINT     �   ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT uk_frsr6t700s9v50bu18ws5pmt UNIQUE (owner, requester, resource_server_id, resource_id, scope_id);
 a   ALTER TABLE ONLY public.resource_server_perm_ticket DROP CONSTRAINT uk_frsr6t700s9v50bu18ws5pmt;
       public         
   magnittest    false    296    296    296    296    296            �           2606    17658 2   resource_server_policy uk_frsrpt700s9v50bu18ws5ha6 
   CONSTRAINT     �   ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT uk_frsrpt700s9v50bu18ws5ha6 UNIQUE (name, resource_server_id);
 \   ALTER TABLE ONLY public.resource_server_policy DROP CONSTRAINT uk_frsrpt700s9v50bu18ws5ha6;
       public         
   magnittest    false    274    274            �           2606    17662 1   resource_server_scope uk_frsrst700s9v50bu18ws5ha6 
   CONSTRAINT     �   ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT uk_frsrst700s9v50bu18ws5ha6 UNIQUE (name, resource_server_id);
 [   ALTER TABLE ONLY public.resource_server_scope DROP CONSTRAINT uk_frsrst700s9v50bu18ws5ha6;
       public         
   magnittest    false    273    273            �           2606    17904 )   user_consent uk_jkuwuvd56ontgsuhogm8uewrt 
   CONSTRAINT     �   ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT uk_jkuwuvd56ontgsuhogm8uewrt UNIQUE (client_id, client_storage_provider, external_client_id, user_id);
 S   ALTER TABLE ONLY public.user_consent DROP CONSTRAINT uk_jkuwuvd56ontgsuhogm8uewrt;
       public         
   magnittest    false    248    248    248    248            @           2606    16593 "   realm uk_orvsdmla56612eaefiq6wl5oi 
   CONSTRAINT     ]   ALTER TABLE ONLY public.realm
    ADD CONSTRAINT uk_orvsdmla56612eaefiq6wl5oi UNIQUE (name);
 L   ALTER TABLE ONLY public.realm DROP CONSTRAINT uk_orvsdmla56612eaefiq6wl5oi;
       public         
   magnittest    false    218            ]           2606    17587 (   user_entity uk_ru8tt6t700s9v50bu18ws5ha6 
   CONSTRAINT     q   ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT uk_ru8tt6t700s9v50bu18ws5ha6 UNIQUE (realm_id, username);
 R   ALTER TABLE ONLY public.user_entity DROP CONSTRAINT uk_ru8tt6t700s9v50bu18ws5ha6;
       public         
   magnittest    false    227    227                        1259    17611    idx_assoc_pol_assoc_pol_id    INDEX     h   CREATE INDEX idx_assoc_pol_assoc_pol_id ON public.associated_policy USING btree (associated_policy_id);
 .   DROP INDEX public.idx_assoc_pol_assoc_pol_id;
       public         
   magnittest    false    279            �           1259    17615    idx_auth_config_realm    INDEX     Z   CREATE INDEX idx_auth_config_realm ON public.authenticator_config USING btree (realm_id);
 )   DROP INDEX public.idx_auth_config_realm;
       public         
   magnittest    false    251            �           1259    17613    idx_auth_exec_flow    INDEX     Z   CREATE INDEX idx_auth_exec_flow ON public.authentication_execution USING btree (flow_id);
 &   DROP INDEX public.idx_auth_exec_flow;
       public         
   magnittest    false    253            �           1259    17612    idx_auth_exec_realm_flow    INDEX     j   CREATE INDEX idx_auth_exec_realm_flow ON public.authentication_execution USING btree (realm_id, flow_id);
 ,   DROP INDEX public.idx_auth_exec_realm_flow;
       public         
   magnittest    false    253    253            �           1259    17614    idx_auth_flow_realm    INDEX     W   CREATE INDEX idx_auth_flow_realm ON public.authentication_flow USING btree (realm_id);
 '   DROP INDEX public.idx_auth_flow_realm;
       public         
   magnittest    false    252            +           1259    17932    idx_cl_clscope    INDEX     R   CREATE INDEX idx_cl_clscope ON public.client_scope_client USING btree (scope_id);
 "   DROP INDEX public.idx_cl_clscope;
       public         
   magnittest    false    292            p           1259    17938    idx_client_att_by_name_value    INDEX     }   CREATE INDEX idx_client_att_by_name_value ON public.client_attributes USING btree (name, ((value)::character varying(250)));
 0   DROP INDEX public.idx_client_att_by_name_value;
       public         
   magnittest    false    234    234            $           1259    17917    idx_client_id    INDEX     E   CREATE INDEX idx_client_id ON public.client USING btree (client_id);
 !   DROP INDEX public.idx_client_id;
       public         
   magnittest    false    211            &           1259    17655    idx_client_init_acc_realm    INDEX     _   CREATE INDEX idx_client_init_acc_realm ON public.client_initial_access USING btree (realm_id);
 -   DROP INDEX public.idx_client_init_acc_realm;
       public         
   magnittest    false    290            )           1259    17619    idx_client_session_session    INDEX     [   CREATE INDEX idx_client_session_session ON public.client_session USING btree (session_id);
 .   DROP INDEX public.idx_client_session_session;
       public         
   magnittest    false    212            �           1259    17818    idx_clscope_attrs    INDEX     Y   CREATE INDEX idx_clscope_attrs ON public.client_scope_attributes USING btree (scope_id);
 %   DROP INDEX public.idx_clscope_attrs;
       public         
   magnittest    false    269            ,           1259    17929    idx_clscope_cl    INDEX     S   CREATE INDEX idx_clscope_cl ON public.client_scope_client USING btree (client_id);
 "   DROP INDEX public.idx_clscope_cl;
       public         
   magnittest    false    292            w           1259    17815    idx_clscope_protmap    INDEX     Z   CREATE INDEX idx_clscope_protmap ON public.protocol_mapper USING btree (client_scope_id);
 '   DROP INDEX public.idx_clscope_protmap;
       public         
   magnittest    false    237            �           1259    17816    idx_clscope_role    INDEX     Z   CREATE INDEX idx_clscope_role ON public.client_scope_role_mapping USING btree (scope_id);
 $   DROP INDEX public.idx_clscope_role;
       public         
   magnittest    false    270                       1259    17621    idx_compo_config_compo    INDEX     [   CREATE INDEX idx_compo_config_compo ON public.component_config USING btree (component_id);
 *   DROP INDEX public.idx_compo_config_compo;
       public         
   magnittest    false    287                        1259    17889    idx_component_provider_type    INDEX     Z   CREATE INDEX idx_component_provider_type ON public.component USING btree (provider_type);
 /   DROP INDEX public.idx_component_provider_type;
       public         
   magnittest    false    288            !           1259    17620    idx_component_realm    INDEX     M   CREATE INDEX idx_component_realm ON public.component USING btree (realm_id);
 '   DROP INDEX public.idx_component_realm;
       public         
   magnittest    false    288            .           1259    17622    idx_composite    INDEX     M   CREATE INDEX idx_composite ON public.composite_role USING btree (composite);
 !   DROP INDEX public.idx_composite;
       public         
   magnittest    false    214            /           1259    17623    idx_composite_child    INDEX     T   CREATE INDEX idx_composite_child ON public.composite_role USING btree (child_role);
 '   DROP INDEX public.idx_composite_child;
       public         
   magnittest    false    214            -           1259    17821    idx_defcls_realm    INDEX     U   CREATE INDEX idx_defcls_realm ON public.default_client_scope USING btree (realm_id);
 $   DROP INDEX public.idx_defcls_realm;
       public         
   magnittest    false    293            .           1259    17822    idx_defcls_scope    INDEX     U   CREATE INDEX idx_defcls_scope ON public.default_client_scope USING btree (scope_id);
 $   DROP INDEX public.idx_defcls_scope;
       public         
   magnittest    false    293            5           1259    17918    idx_event_time    INDEX     W   CREATE INDEX idx_event_time ON public.event_entity USING btree (realm_id, event_time);
 "   DROP INDEX public.idx_event_time;
       public         
   magnittest    false    216    216            }           1259    17354    idx_fedidentity_feduser    INDEX     c   CREATE INDEX idx_fedidentity_feduser ON public.federated_identity USING btree (federated_user_id);
 +   DROP INDEX public.idx_fedidentity_feduser;
       public         
   magnittest    false    239            ~           1259    17353    idx_fedidentity_user    INDEX     V   CREATE INDEX idx_fedidentity_user ON public.federated_identity USING btree (user_id);
 (   DROP INDEX public.idx_fedidentity_user;
       public         
   magnittest    false    239                       1259    17715    idx_fu_attribute    INDEX     b   CREATE INDEX idx_fu_attribute ON public.fed_user_attribute USING btree (user_id, realm_id, name);
 $   DROP INDEX public.idx_fu_attribute;
       public         
   magnittest    false    281    281    281                       1259    17735    idx_fu_cnsnt_ext    INDEX     }   CREATE INDEX idx_fu_cnsnt_ext ON public.fed_user_consent USING btree (user_id, client_storage_provider, external_client_id);
 $   DROP INDEX public.idx_fu_cnsnt_ext;
       public         
   magnittest    false    282    282    282            	           1259    17900    idx_fu_consent    INDEX     Y   CREATE INDEX idx_fu_consent ON public.fed_user_consent USING btree (user_id, client_id);
 "   DROP INDEX public.idx_fu_consent;
       public         
   magnittest    false    282    282            
           1259    17717    idx_fu_consent_ru    INDEX     [   CREATE INDEX idx_fu_consent_ru ON public.fed_user_consent USING btree (realm_id, user_id);
 %   DROP INDEX public.idx_fu_consent_ru;
       public         
   magnittest    false    282    282                       1259    17718    idx_fu_credential    INDEX     Z   CREATE INDEX idx_fu_credential ON public.fed_user_credential USING btree (user_id, type);
 %   DROP INDEX public.idx_fu_credential;
       public         
   magnittest    false    283    283                       1259    17719    idx_fu_credential_ru    INDEX     a   CREATE INDEX idx_fu_credential_ru ON public.fed_user_credential USING btree (realm_id, user_id);
 (   DROP INDEX public.idx_fu_credential_ru;
       public         
   magnittest    false    283    283                       1259    17720    idx_fu_group_membership    INDEX     j   CREATE INDEX idx_fu_group_membership ON public.fed_user_group_membership USING btree (user_id, group_id);
 +   DROP INDEX public.idx_fu_group_membership;
       public         
   magnittest    false    284    284                       1259    17721    idx_fu_group_membership_ru    INDEX     m   CREATE INDEX idx_fu_group_membership_ru ON public.fed_user_group_membership USING btree (realm_id, user_id);
 .   DROP INDEX public.idx_fu_group_membership_ru;
       public         
   magnittest    false    284    284                       1259    17722    idx_fu_required_action    INDEX     o   CREATE INDEX idx_fu_required_action ON public.fed_user_required_action USING btree (user_id, required_action);
 *   DROP INDEX public.idx_fu_required_action;
       public         
   magnittest    false    285    285                       1259    17723    idx_fu_required_action_ru    INDEX     k   CREATE INDEX idx_fu_required_action_ru ON public.fed_user_required_action USING btree (realm_id, user_id);
 -   DROP INDEX public.idx_fu_required_action_ru;
       public         
   magnittest    false    285    285                       1259    17724    idx_fu_role_mapping    INDEX     a   CREATE INDEX idx_fu_role_mapping ON public.fed_user_role_mapping USING btree (user_id, role_id);
 '   DROP INDEX public.idx_fu_role_mapping;
       public         
   magnittest    false    286    286                       1259    17725    idx_fu_role_mapping_ru    INDEX     e   CREATE INDEX idx_fu_role_mapping_ru ON public.fed_user_role_mapping USING btree (realm_id, user_id);
 *   DROP INDEX public.idx_fu_role_mapping_ru;
       public         
   magnittest    false    286    286            �           1259    17626    idx_group_attr_group    INDEX     T   CREATE INDEX idx_group_attr_group ON public.group_attribute USING btree (group_id);
 (   DROP INDEX public.idx_group_attr_group;
       public         
   magnittest    false    265            �           1259    17627    idx_group_role_mapp_group    INDEX     \   CREATE INDEX idx_group_role_mapp_group ON public.group_role_mapping USING btree (group_id);
 -   DROP INDEX public.idx_group_role_mapp_group;
       public         
   magnittest    false    264            �           1259    17629    idx_id_prov_mapp_realm    INDEX     _   CREATE INDEX idx_id_prov_mapp_realm ON public.identity_provider_mapper USING btree (realm_id);
 *   DROP INDEX public.idx_id_prov_mapp_realm;
       public         
   magnittest    false    246            �           1259    17628    idx_ident_prov_realm    INDEX     V   CREATE INDEX idx_ident_prov_realm ON public.identity_provider USING btree (realm_id);
 (   DROP INDEX public.idx_ident_prov_realm;
       public         
   magnittest    false    240            :           1259    17630    idx_keycloak_role_client    INDEX     T   CREATE INDEX idx_keycloak_role_client ON public.keycloak_role USING btree (client);
 ,   DROP INDEX public.idx_keycloak_role_client;
       public         
   magnittest    false    217            ;           1259    17631    idx_keycloak_role_realm    INDEX     R   CREATE INDEX idx_keycloak_role_realm ON public.keycloak_role USING btree (realm);
 +   DROP INDEX public.idx_keycloak_role_realm;
       public         
   magnittest    false    217            �           1259    17935    idx_offline_css_preload    INDEX     m   CREATE INDEX idx_offline_css_preload ON public.offline_client_session USING btree (client_id, offline_flag);
 +   DROP INDEX public.idx_offline_css_preload;
       public         
   magnittest    false    262    262            �           1259    17936    idx_offline_uss_by_user    INDEX     s   CREATE INDEX idx_offline_uss_by_user ON public.offline_user_session USING btree (user_id, realm_id, offline_flag);
 +   DROP INDEX public.idx_offline_uss_by_user;
       public         
   magnittest    false    261    261    261            �           1259    17937    idx_offline_uss_by_usersess    INDEX        CREATE INDEX idx_offline_uss_by_usersess ON public.offline_user_session USING btree (realm_id, offline_flag, user_session_id);
 /   DROP INDEX public.idx_offline_uss_by_usersess;
       public         
   magnittest    false    261    261    261            �           1259    17893    idx_offline_uss_createdon    INDEX     `   CREATE INDEX idx_offline_uss_createdon ON public.offline_user_session USING btree (created_on);
 -   DROP INDEX public.idx_offline_uss_createdon;
       public         
   magnittest    false    261            �           1259    17926    idx_offline_uss_preload    INDEX     }   CREATE INDEX idx_offline_uss_preload ON public.offline_user_session USING btree (offline_flag, created_on, user_session_id);
 +   DROP INDEX public.idx_offline_uss_preload;
       public         
   magnittest    false    261    261    261            x           1259    17632    idx_protocol_mapper_client    INDEX     [   CREATE INDEX idx_protocol_mapper_client ON public.protocol_mapper USING btree (client_id);
 .   DROP INDEX public.idx_protocol_mapper_client;
       public         
   magnittest    false    237            C           1259    17635    idx_realm_attr_realm    INDEX     T   CREATE INDEX idx_realm_attr_realm ON public.realm_attribute USING btree (realm_id);
 (   DROP INDEX public.idx_realm_attr_realm;
       public         
   magnittest    false    219            �           1259    17814    idx_realm_clscope    INDEX     N   CREATE INDEX idx_realm_clscope ON public.client_scope USING btree (realm_id);
 %   DROP INDEX public.idx_realm_clscope;
       public         
   magnittest    false    268            �           1259    17636    idx_realm_def_grp_realm    INDEX     \   CREATE INDEX idx_realm_def_grp_realm ON public.realm_default_groups USING btree (realm_id);
 +   DROP INDEX public.idx_realm_def_grp_realm;
       public         
   magnittest    false    267            F           1259    17639    idx_realm_evt_list_realm    INDEX     _   CREATE INDEX idx_realm_evt_list_realm ON public.realm_events_listeners USING btree (realm_id);
 ,   DROP INDEX public.idx_realm_evt_list_realm;
       public         
   magnittest    false    220            �           1259    17638    idx_realm_evt_types_realm    INDEX     c   CREATE INDEX idx_realm_evt_types_realm ON public.realm_enabled_event_types USING btree (realm_id);
 -   DROP INDEX public.idx_realm_evt_types_realm;
       public         
   magnittest    false    244            >           1259    17634    idx_realm_master_adm_cli    INDEX     Y   CREATE INDEX idx_realm_master_adm_cli ON public.realm USING btree (master_admin_client);
 ,   DROP INDEX public.idx_realm_master_adm_cli;
       public         
   magnittest    false    218            �           1259    17640    idx_realm_supp_local_realm    INDEX     b   CREATE INDEX idx_realm_supp_local_realm ON public.realm_supported_locales USING btree (realm_id);
 .   DROP INDEX public.idx_realm_supp_local_realm;
       public         
   magnittest    false    242            M           1259    17641    idx_redir_uri_client    INDEX     S   CREATE INDEX idx_redir_uri_client ON public.redirect_uris USING btree (client_id);
 (   DROP INDEX public.idx_redir_uri_client;
       public         
   magnittest    false    223            �           1259    17642    idx_req_act_prov_realm    INDEX     _   CREATE INDEX idx_req_act_prov_realm ON public.required_action_provider USING btree (realm_id);
 *   DROP INDEX public.idx_req_act_prov_realm;
       public         
   magnittest    false    259            �           1259    17643    idx_res_policy_policy    INDEX     V   CREATE INDEX idx_res_policy_policy ON public.resource_policy USING btree (policy_id);
 )   DROP INDEX public.idx_res_policy_policy;
       public         
   magnittest    false    277            �           1259    17644    idx_res_scope_scope    INDEX     R   CREATE INDEX idx_res_scope_scope ON public.resource_scope USING btree (scope_id);
 '   DROP INDEX public.idx_res_scope_scope;
       public         
   magnittest    false    276            �           1259    17663    idx_res_serv_pol_res_serv    INDEX     j   CREATE INDEX idx_res_serv_pol_res_serv ON public.resource_server_policy USING btree (resource_server_id);
 -   DROP INDEX public.idx_res_serv_pol_res_serv;
       public         
   magnittest    false    274            �           1259    17664    idx_res_srv_res_res_srv    INDEX     j   CREATE INDEX idx_res_srv_res_res_srv ON public.resource_server_resource USING btree (resource_server_id);
 +   DROP INDEX public.idx_res_srv_res_res_srv;
       public         
   magnittest    false    272            �           1259    17665    idx_res_srv_scope_res_srv    INDEX     i   CREATE INDEX idx_res_srv_scope_res_srv ON public.resource_server_scope USING btree (resource_server_id);
 -   DROP INDEX public.idx_res_srv_scope_res_srv;
       public         
   magnittest    false    273            @           1259    17888    idx_role_attribute    INDEX     P   CREATE INDEX idx_role_attribute ON public.role_attribute USING btree (role_id);
 &   DROP INDEX public.idx_role_attribute;
       public         
   magnittest    false    299            �           1259    17817    idx_role_clscope    INDEX     Y   CREATE INDEX idx_role_clscope ON public.client_scope_role_mapping USING btree (role_id);
 $   DROP INDEX public.idx_role_clscope;
       public         
   magnittest    false    270            P           1259    17648    idx_scope_mapping_role    INDEX     S   CREATE INDEX idx_scope_mapping_role ON public.scope_mapping USING btree (role_id);
 *   DROP INDEX public.idx_scope_mapping_role;
       public         
   magnittest    false    224            �           1259    17649    idx_scope_policy_policy    INDEX     U   CREATE INDEX idx_scope_policy_policy ON public.scope_policy USING btree (policy_id);
 +   DROP INDEX public.idx_scope_policy_policy;
       public         
   magnittest    false    278            �           1259    17898    idx_update_time    INDEX     R   CREATE INDEX idx_update_time ON public.migration_model USING btree (update_time);
 #   DROP INDEX public.idx_update_time;
       public         
   magnittest    false    245            �           1259    17343    idx_us_sess_id_on_cl_sess    INDEX     g   CREATE INDEX idx_us_sess_id_on_cl_sess ON public.offline_client_session USING btree (user_session_id);
 -   DROP INDEX public.idx_us_sess_id_on_cl_sess;
       public         
   magnittest    false    262            3           1259    17823    idx_usconsent_clscope    INDEX     f   CREATE INDEX idx_usconsent_clscope ON public.user_consent_client_scope USING btree (user_consent_id);
 )   DROP INDEX public.idx_usconsent_clscope;
       public         
   magnittest    false    294            U           1259    17350    idx_user_attribute    INDEX     P   CREATE INDEX idx_user_attribute ON public.user_attribute USING btree (user_id);
 &   DROP INDEX public.idx_user_attribute;
       public         
   magnittest    false    226            V           1259    17939    idx_user_attribute_name    INDEX     Y   CREATE INDEX idx_user_attribute_name ON public.user_attribute USING btree (name, value);
 +   DROP INDEX public.idx_user_attribute_name;
       public         
   magnittest    false    226    226            �           1259    17347    idx_user_consent    INDEX     L   CREATE INDEX idx_user_consent ON public.user_consent USING btree (user_id);
 $   DROP INDEX public.idx_user_consent;
       public         
   magnittest    false    248            2           1259    17351    idx_user_credential    INDEX     M   CREATE INDEX idx_user_credential ON public.credential USING btree (user_id);
 '   DROP INDEX public.idx_user_credential;
       public         
   magnittest    false    215            Y           1259    17344    idx_user_email    INDEX     G   CREATE INDEX idx_user_email ON public.user_entity USING btree (email);
 "   DROP INDEX public.idx_user_email;
       public         
   magnittest    false    227            �           1259    17346    idx_user_group_mapping    INDEX     [   CREATE INDEX idx_user_group_mapping ON public.user_group_membership USING btree (user_id);
 *   DROP INDEX public.idx_user_group_mapping;
       public         
   magnittest    false    266            e           1259    17352    idx_user_reqactions    INDEX     W   CREATE INDEX idx_user_reqactions ON public.user_required_action USING btree (user_id);
 '   DROP INDEX public.idx_user_reqactions;
       public         
   magnittest    false    230            h           1259    17345    idx_user_role_mapping    INDEX     V   CREATE INDEX idx_user_role_mapping ON public.user_role_mapping USING btree (user_id);
 )   DROP INDEX public.idx_user_role_mapping;
       public         
   magnittest    false    231            �           1259    17651    idx_usr_fed_map_fed_prv    INDEX     l   CREATE INDEX idx_usr_fed_map_fed_prv ON public.user_federation_mapper USING btree (federation_provider_id);
 +   DROP INDEX public.idx_usr_fed_map_fed_prv;
       public         
   magnittest    false    255            �           1259    17652    idx_usr_fed_map_realm    INDEX     \   CREATE INDEX idx_usr_fed_map_realm ON public.user_federation_mapper USING btree (realm_id);
 )   DROP INDEX public.idx_usr_fed_map_realm;
       public         
   magnittest    false    255            b           1259    17653    idx_usr_fed_prv_realm    INDEX     ^   CREATE INDEX idx_usr_fed_prv_realm ON public.user_federation_provider USING btree (realm_id);
 )   DROP INDEX public.idx_usr_fed_prv_realm;
       public         
   magnittest    false    229            m           1259    17654    idx_web_orig_client    INDEX     P   CREATE INDEX idx_web_orig_client ON public.web_origins USING btree (client_id);
 '   DROP INDEX public.idx_web_orig_client;
       public         
   magnittest    false    233            l           2606    17077 1   client_session_auth_status auth_status_constraint    FK CONSTRAINT     �   ALTER TABLE ONLY public.client_session_auth_status
    ADD CONSTRAINT auth_status_constraint FOREIGN KEY (client_session) REFERENCES public.client_session(id);
 [   ALTER TABLE ONLY public.client_session_auth_status DROP CONSTRAINT auth_status_constraint;
       public       
   magnittest    false    212    3624    257            \           2606    16846 $   identity_provider fk2b4ebc52ae5c3b34    FK CONSTRAINT     �   ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT fk2b4ebc52ae5c3b34 FOREIGN KEY (realm_id) REFERENCES public.realm(id);
 N   ALTER TABLE ONLY public.identity_provider DROP CONSTRAINT fk2b4ebc52ae5c3b34;
       public       
   magnittest    false    240    218    3645            U           2606    16776 $   client_attributes fk3c47c64beacca966    FK CONSTRAINT     �   ALTER TABLE ONLY public.client_attributes
    ADD CONSTRAINT fk3c47c64beacca966 FOREIGN KEY (client_id) REFERENCES public.client(id);
 N   ALTER TABLE ONLY public.client_attributes DROP CONSTRAINT fk3c47c64beacca966;
       public       
   magnittest    false    211    3619    234            [           2606    16856 %   federated_identity fk404288b92ef007a6    FK CONSTRAINT     �   ALTER TABLE ONLY public.federated_identity
    ADD CONSTRAINT fk404288b92ef007a6 FOREIGN KEY (user_id) REFERENCES public.user_entity(id);
 O   ALTER TABLE ONLY public.federated_identity DROP CONSTRAINT fk404288b92ef007a6;
       public       
   magnittest    false    227    3672    239            W           2606    17003 ,   client_node_registrations fk4129723ba992f594    FK CONSTRAINT     �   ALTER TABLE ONLY public.client_node_registrations
    ADD CONSTRAINT fk4129723ba992f594 FOREIGN KEY (client_id) REFERENCES public.client(id);
 V   ALTER TABLE ONLY public.client_node_registrations DROP CONSTRAINT fk4129723ba992f594;
       public       
   magnittest    false    3619    236    211            V           2606    16781 &   client_session_note fk5edfb00ff51c2736    FK CONSTRAINT     �   ALTER TABLE ONLY public.client_session_note
    ADD CONSTRAINT fk5edfb00ff51c2736 FOREIGN KEY (client_session) REFERENCES public.client_session(id);
 P   ALTER TABLE ONLY public.client_session_note DROP CONSTRAINT fk5edfb00ff51c2736;
       public       
   magnittest    false    235    3624    212            _           2606    16886 $   user_session_note fk5edfb00ff51d3472    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_session_note
    ADD CONSTRAINT fk5edfb00ff51d3472 FOREIGN KEY (user_session) REFERENCES public.user_session(id);
 N   ALTER TABLE ONLY public.user_session_note DROP CONSTRAINT fk5edfb00ff51d3472;
       public       
   magnittest    false    3690    232    243            D           2606    16596 0   client_session_role fk_11b7sgqw18i532811v7o2dv76    FK CONSTRAINT     �   ALTER TABLE ONLY public.client_session_role
    ADD CONSTRAINT fk_11b7sgqw18i532811v7o2dv76 FOREIGN KEY (client_session) REFERENCES public.client_session(id);
 Z   ALTER TABLE ONLY public.client_session_role DROP CONSTRAINT fk_11b7sgqw18i532811v7o2dv76;
       public       
   magnittest    false    212    3624    213            M           2606    16601 *   redirect_uris fk_1burs8pb4ouj97h5wuppahv9f    FK CONSTRAINT     �   ALTER TABLE ONLY public.redirect_uris
    ADD CONSTRAINT fk_1burs8pb4ouj97h5wuppahv9f FOREIGN KEY (client_id) REFERENCES public.client(id);
 T   ALTER TABLE ONLY public.redirect_uris DROP CONSTRAINT fk_1burs8pb4ouj97h5wuppahv9f;
       public       
   magnittest    false    211    223    3619            Q           2606    16606 5   user_federation_provider fk_1fj32f6ptolw2qy60cd8n01e8    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_federation_provider
    ADD CONSTRAINT fk_1fj32f6ptolw2qy60cd8n01e8 FOREIGN KEY (realm_id) REFERENCES public.realm(id);
 _   ALTER TABLE ONLY public.user_federation_provider DROP CONSTRAINT fk_1fj32f6ptolw2qy60cd8n01e8;
       public       
   magnittest    false    218    229    3645            d           2606    16981 7   client_session_prot_mapper fk_33a8sgqw18i532811v7o2dk89    FK CONSTRAINT     �   ALTER TABLE ONLY public.client_session_prot_mapper
    ADD CONSTRAINT fk_33a8sgqw18i532811v7o2dk89 FOREIGN KEY (client_session) REFERENCES public.client_session(id);
 a   ALTER TABLE ONLY public.client_session_prot_mapper DROP CONSTRAINT fk_33a8sgqw18i532811v7o2dk89;
       public       
   magnittest    false    3624    212    249            K           2606    16616 6   realm_required_credential fk_5hg65lybevavkqfki3kponh9v    FK CONSTRAINT     �   ALTER TABLE ONLY public.realm_required_credential
    ADD CONSTRAINT fk_5hg65lybevavkqfki3kponh9v FOREIGN KEY (realm_id) REFERENCES public.realm(id);
 `   ALTER TABLE ONLY public.realm_required_credential DROP CONSTRAINT fk_5hg65lybevavkqfki3kponh9v;
       public       
   magnittest    false    221    3645    218            �           2606    17856 /   resource_attribute fk_5hrm2vlf9ql5fu022kqepovbr    FK CONSTRAINT     �   ALTER TABLE ONLY public.resource_attribute
    ADD CONSTRAINT fk_5hrm2vlf9ql5fu022kqepovbr FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);
 Y   ALTER TABLE ONLY public.resource_attribute DROP CONSTRAINT fk_5hrm2vlf9ql5fu022kqepovbr;
       public       
   magnittest    false    3813    297    272            O           2606    16621 +   user_attribute fk_5hrm2vlf9ql5fu043kqepovbr    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT fk_5hrm2vlf9ql5fu043kqepovbr FOREIGN KEY (user_id) REFERENCES public.user_entity(id);
 U   ALTER TABLE ONLY public.user_attribute DROP CONSTRAINT fk_5hrm2vlf9ql5fu043kqepovbr;
       public       
   magnittest    false    3672    227    226            R           2606    16631 1   user_required_action fk_6qj3w1jw9cvafhe19bwsiuvmd    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_required_action
    ADD CONSTRAINT fk_6qj3w1jw9cvafhe19bwsiuvmd FOREIGN KEY (user_id) REFERENCES public.user_entity(id);
 [   ALTER TABLE ONLY public.user_required_action DROP CONSTRAINT fk_6qj3w1jw9cvafhe19bwsiuvmd;
       public       
   magnittest    false    3672    230    227            H           2606    16636 *   keycloak_role fk_6vyqfe4cn4wlq8r6kt5vdsj5c    FK CONSTRAINT     �   ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT fk_6vyqfe4cn4wlq8r6kt5vdsj5c FOREIGN KEY (realm) REFERENCES public.realm(id);
 T   ALTER TABLE ONLY public.keycloak_role DROP CONSTRAINT fk_6vyqfe4cn4wlq8r6kt5vdsj5c;
       public       
   magnittest    false    217    3645    218            L           2606    16641 .   realm_smtp_config fk_70ej8xdxgxd0b9hh6180irr0o    FK CONSTRAINT     �   ALTER TABLE ONLY public.realm_smtp_config
    ADD CONSTRAINT fk_70ej8xdxgxd0b9hh6180irr0o FOREIGN KEY (realm_id) REFERENCES public.realm(id);
 X   ALTER TABLE ONLY public.realm_smtp_config DROP CONSTRAINT fk_70ej8xdxgxd0b9hh6180irr0o;
       public       
   magnittest    false    218    222    3645            I           2606    16656 ,   realm_attribute fk_8shxd6l3e9atqukacxgpffptw    FK CONSTRAINT     �   ALTER TABLE ONLY public.realm_attribute
    ADD CONSTRAINT fk_8shxd6l3e9atqukacxgpffptw FOREIGN KEY (realm_id) REFERENCES public.realm(id);
 V   ALTER TABLE ONLY public.realm_attribute DROP CONSTRAINT fk_8shxd6l3e9atqukacxgpffptw;
       public       
   magnittest    false    218    3645    219            E           2606    16661 +   composite_role fk_a63wvekftu8jo1pnj81e7mce2    FK CONSTRAINT     �   ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT fk_a63wvekftu8jo1pnj81e7mce2 FOREIGN KEY (composite) REFERENCES public.keycloak_role(id);
 U   ALTER TABLE ONLY public.composite_role DROP CONSTRAINT fk_a63wvekftu8jo1pnj81e7mce2;
       public       
   magnittest    false    217    214    3641            h           2606    17097 *   authentication_execution fk_auth_exec_flow    FK CONSTRAINT     �   ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT fk_auth_exec_flow FOREIGN KEY (flow_id) REFERENCES public.authentication_flow(id);
 T   ALTER TABLE ONLY public.authentication_execution DROP CONSTRAINT fk_auth_exec_flow;
       public       
   magnittest    false    252    253    3747            g           2606    17092 +   authentication_execution fk_auth_exec_realm    FK CONSTRAINT     �   ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT fk_auth_exec_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);
 U   ALTER TABLE ONLY public.authentication_execution DROP CONSTRAINT fk_auth_exec_realm;
       public       
   magnittest    false    253    3645    218            f           2606    17087 &   authentication_flow fk_auth_flow_realm    FK CONSTRAINT     �   ALTER TABLE ONLY public.authentication_flow
    ADD CONSTRAINT fk_auth_flow_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);
 P   ALTER TABLE ONLY public.authentication_flow DROP CONSTRAINT fk_auth_flow_realm;
       public       
   magnittest    false    218    252    3645            e           2606    17082 "   authenticator_config fk_auth_realm    FK CONSTRAINT     �   ALTER TABLE ONLY public.authenticator_config
    ADD CONSTRAINT fk_auth_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);
 L   ALTER TABLE ONLY public.authenticator_config DROP CONSTRAINT fk_auth_realm;
       public       
   magnittest    false    251    218    3645            C           2606    16666 +   client_session fk_b4ao2vcvat6ukau74wbwtfqo1    FK CONSTRAINT     �   ALTER TABLE ONLY public.client_session
    ADD CONSTRAINT fk_b4ao2vcvat6ukau74wbwtfqo1 FOREIGN KEY (session_id) REFERENCES public.user_session(id);
 U   ALTER TABLE ONLY public.client_session DROP CONSTRAINT fk_b4ao2vcvat6ukau74wbwtfqo1;
       public       
   magnittest    false    212    3690    232            S           2606    16671 .   user_role_mapping fk_c4fqv34p1mbylloxang7b1q3l    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_role_mapping
    ADD CONSTRAINT fk_c4fqv34p1mbylloxang7b1q3l FOREIGN KEY (user_id) REFERENCES public.user_entity(id);
 X   ALTER TABLE ONLY public.user_role_mapping DROP CONSTRAINT fk_c4fqv34p1mbylloxang7b1q3l;
       public       
   magnittest    false    231    227    3672            s           2606    17762 .   client_scope_attributes fk_cl_scope_attr_scope    FK CONSTRAINT     �   ALTER TABLE ONLY public.client_scope_attributes
    ADD CONSTRAINT fk_cl_scope_attr_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);
 X   ALTER TABLE ONLY public.client_scope_attributes DROP CONSTRAINT fk_cl_scope_attr_scope;
       public       
   magnittest    false    268    3800    269            t           2606    17752 .   client_scope_role_mapping fk_cl_scope_rm_scope    FK CONSTRAINT     �   ALTER TABLE ONLY public.client_scope_role_mapping
    ADD CONSTRAINT fk_cl_scope_rm_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);
 X   ALTER TABLE ONLY public.client_scope_role_mapping DROP CONSTRAINT fk_cl_scope_rm_scope;
       public       
   magnittest    false    270    268    3800            m           2606    17166 +   client_user_session_note fk_cl_usr_ses_note    FK CONSTRAINT     �   ALTER TABLE ONLY public.client_user_session_note
    ADD CONSTRAINT fk_cl_usr_ses_note FOREIGN KEY (client_session) REFERENCES public.client_session(id);
 U   ALTER TABLE ONLY public.client_user_session_note DROP CONSTRAINT fk_cl_usr_ses_note;
       public       
   magnittest    false    212    3624    258            Y           2606    17747 #   protocol_mapper fk_cli_scope_mapper    FK CONSTRAINT     �   ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT fk_cli_scope_mapper FOREIGN KEY (client_scope_id) REFERENCES public.client_scope(id);
 M   ALTER TABLE ONLY public.protocol_mapper DROP CONSTRAINT fk_cli_scope_mapper;
       public       
   magnittest    false    3800    268    237            �           2606    17606 .   client_initial_access fk_client_init_acc_realm    FK CONSTRAINT     �   ALTER TABLE ONLY public.client_initial_access
    ADD CONSTRAINT fk_client_init_acc_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);
 X   ALTER TABLE ONLY public.client_initial_access DROP CONSTRAINT fk_client_init_acc_realm;
       public       
   magnittest    false    3645    290    218            �           2606    17554 $   component_config fk_component_config    FK CONSTRAINT     �   ALTER TABLE ONLY public.component_config
    ADD CONSTRAINT fk_component_config FOREIGN KEY (component_id) REFERENCES public.component(id);
 N   ALTER TABLE ONLY public.component_config DROP CONSTRAINT fk_component_config;
       public       
   magnittest    false    288    287    3871            �           2606    17549    component fk_component_realm    FK CONSTRAINT     |   ALTER TABLE ONLY public.component
    ADD CONSTRAINT fk_component_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);
 F   ALTER TABLE ONLY public.component DROP CONSTRAINT fk_component_realm;
       public       
   magnittest    false    218    3645    288            r           2606    17253 (   realm_default_groups fk_def_groups_realm    FK CONSTRAINT     �   ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT fk_def_groups_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);
 R   ALTER TABLE ONLY public.realm_default_groups DROP CONSTRAINT fk_def_groups_realm;
       public       
   magnittest    false    218    3645    267            k           2606    17112 .   user_federation_mapper_config fk_fedmapper_cfg    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_federation_mapper_config
    ADD CONSTRAINT fk_fedmapper_cfg FOREIGN KEY (user_federation_mapper_id) REFERENCES public.user_federation_mapper(id);
 X   ALTER TABLE ONLY public.user_federation_mapper_config DROP CONSTRAINT fk_fedmapper_cfg;
       public       
   magnittest    false    256    255    3756            j           2606    17107 ,   user_federation_mapper fk_fedmapperpm_fedprv    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT fk_fedmapperpm_fedprv FOREIGN KEY (federation_provider_id) REFERENCES public.user_federation_provider(id);
 V   ALTER TABLE ONLY public.user_federation_mapper DROP CONSTRAINT fk_fedmapperpm_fedprv;
       public       
   magnittest    false    229    3681    255            i           2606    17102 +   user_federation_mapper fk_fedmapperpm_realm    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT fk_fedmapperpm_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);
 U   ALTER TABLE ONLY public.user_federation_mapper DROP CONSTRAINT fk_fedmapperpm_realm;
       public       
   magnittest    false    255    218    3645            �           2606    17472 .   associated_policy fk_frsr5s213xcx4wnkog82ssrfy    FK CONSTRAINT     �   ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT fk_frsr5s213xcx4wnkog82ssrfy FOREIGN KEY (associated_policy_id) REFERENCES public.resource_server_policy(id);
 X   ALTER TABLE ONLY public.associated_policy DROP CONSTRAINT fk_frsr5s213xcx4wnkog82ssrfy;
       public       
   magnittest    false    274    279    3823            ~           2606    17457 )   scope_policy fk_frsrasp13xcx4wnkog82ssrfy    FK CONSTRAINT     �   ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT fk_frsrasp13xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);
 S   ALTER TABLE ONLY public.scope_policy DROP CONSTRAINT fk_frsrasp13xcx4wnkog82ssrfy;
       public       
   magnittest    false    3823    274    278            �           2606    17829 8   resource_server_perm_ticket fk_frsrho213xcx4wnkog82sspmt    FK CONSTRAINT     �   ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog82sspmt FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);
 b   ALTER TABLE ONLY public.resource_server_perm_ticket DROP CONSTRAINT fk_frsrho213xcx4wnkog82sspmt;
       public       
   magnittest    false    3811    296    271            u           2606    17673 5   resource_server_resource fk_frsrho213xcx4wnkog82ssrfy    FK CONSTRAINT     �   ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT fk_frsrho213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);
 _   ALTER TABLE ONLY public.resource_server_resource DROP CONSTRAINT fk_frsrho213xcx4wnkog82ssrfy;
       public       
   magnittest    false    3811    272    271            �           2606    17834 8   resource_server_perm_ticket fk_frsrho213xcx4wnkog83sspmt    FK CONSTRAINT     �   ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog83sspmt FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);
 b   ALTER TABLE ONLY public.resource_server_perm_ticket DROP CONSTRAINT fk_frsrho213xcx4wnkog83sspmt;
       public       
   magnittest    false    296    272    3813            �           2606    17839 8   resource_server_perm_ticket fk_frsrho213xcx4wnkog84sspmt    FK CONSTRAINT     �   ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog84sspmt FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);
 b   ALTER TABLE ONLY public.resource_server_perm_ticket DROP CONSTRAINT fk_frsrho213xcx4wnkog84sspmt;
       public       
   magnittest    false    3818    296    273                       2606    17467 .   associated_policy fk_frsrpas14xcx4wnkog82ssrfy    FK CONSTRAINT     �   ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT fk_frsrpas14xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);
 X   ALTER TABLE ONLY public.associated_policy DROP CONSTRAINT fk_frsrpas14xcx4wnkog82ssrfy;
       public       
   magnittest    false    279    274    3823            }           2606    17452 )   scope_policy fk_frsrpass3xcx4wnkog82ssrfy    FK CONSTRAINT     �   ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT fk_frsrpass3xcx4wnkog82ssrfy FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);
 S   ALTER TABLE ONLY public.scope_policy DROP CONSTRAINT fk_frsrpass3xcx4wnkog82ssrfy;
       public       
   magnittest    false    3818    273    278            �           2606    17861 8   resource_server_perm_ticket fk_frsrpo2128cx4wnkog82ssrfy    FK CONSTRAINT     �   ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrpo2128cx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);
 b   ALTER TABLE ONLY public.resource_server_perm_ticket DROP CONSTRAINT fk_frsrpo2128cx4wnkog82ssrfy;
       public       
   magnittest    false    274    296    3823            w           2606    17668 3   resource_server_policy fk_frsrpo213xcx4wnkog82ssrfy    FK CONSTRAINT     �   ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT fk_frsrpo213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);
 ]   ALTER TABLE ONLY public.resource_server_policy DROP CONSTRAINT fk_frsrpo213xcx4wnkog82ssrfy;
       public       
   magnittest    false    3811    274    271            y           2606    17422 +   resource_scope fk_frsrpos13xcx4wnkog82ssrfy    FK CONSTRAINT     �   ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT fk_frsrpos13xcx4wnkog82ssrfy FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);
 U   ALTER TABLE ONLY public.resource_scope DROP CONSTRAINT fk_frsrpos13xcx4wnkog82ssrfy;
       public       
   magnittest    false    3813    276    272            {           2606    17437 ,   resource_policy fk_frsrpos53xcx4wnkog82ssrfy    FK CONSTRAINT     �   ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT fk_frsrpos53xcx4wnkog82ssrfy FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);
 V   ALTER TABLE ONLY public.resource_policy DROP CONSTRAINT fk_frsrpos53xcx4wnkog82ssrfy;
       public       
   magnittest    false    277    272    3813            |           2606    17442 ,   resource_policy fk_frsrpp213xcx4wnkog82ssrfy    FK CONSTRAINT     �   ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT fk_frsrpp213xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);
 V   ALTER TABLE ONLY public.resource_policy DROP CONSTRAINT fk_frsrpp213xcx4wnkog82ssrfy;
       public       
   magnittest    false    3823    274    277            z           2606    17427 +   resource_scope fk_frsrps213xcx4wnkog82ssrfy    FK CONSTRAINT     �   ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT fk_frsrps213xcx4wnkog82ssrfy FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);
 U   ALTER TABLE ONLY public.resource_scope DROP CONSTRAINT fk_frsrps213xcx4wnkog82ssrfy;
       public       
   magnittest    false    276    3818    273            v           2606    17678 2   resource_server_scope fk_frsrso213xcx4wnkog82ssrfy    FK CONSTRAINT     �   ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT fk_frsrso213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);
 \   ALTER TABLE ONLY public.resource_server_scope DROP CONSTRAINT fk_frsrso213xcx4wnkog82ssrfy;
       public       
   magnittest    false    3811    273    271            F           2606    16686 +   composite_role fk_gr7thllb9lu8q4vqa4524jjy8    FK CONSTRAINT     �   ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT fk_gr7thllb9lu8q4vqa4524jjy8 FOREIGN KEY (child_role) REFERENCES public.keycloak_role(id);
 U   ALTER TABLE ONLY public.composite_role DROP CONSTRAINT fk_gr7thllb9lu8q4vqa4524jjy8;
       public       
   magnittest    false    3641    217    214            �           2606    17804 .   user_consent_client_scope fk_grntcsnt_clsc_usc    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_consent_client_scope
    ADD CONSTRAINT fk_grntcsnt_clsc_usc FOREIGN KEY (user_consent_id) REFERENCES public.user_consent(id);
 X   ALTER TABLE ONLY public.user_consent_client_scope DROP CONSTRAINT fk_grntcsnt_clsc_usc;
       public       
   magnittest    false    3735    294    248            c           2606    16966    user_consent fk_grntcsnt_user    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT fk_grntcsnt_user FOREIGN KEY (user_id) REFERENCES public.user_entity(id);
 G   ALTER TABLE ONLY public.user_consent DROP CONSTRAINT fk_grntcsnt_user;
       public       
   magnittest    false    227    248    3672            p           2606    17227 (   group_attribute fk_group_attribute_group    FK CONSTRAINT     �   ALTER TABLE ONLY public.group_attribute
    ADD CONSTRAINT fk_group_attribute_group FOREIGN KEY (group_id) REFERENCES public.keycloak_group(id);
 R   ALTER TABLE ONLY public.group_attribute DROP CONSTRAINT fk_group_attribute_group;
       public       
   magnittest    false    265    263    3781            o           2606    17241 &   group_role_mapping fk_group_role_group    FK CONSTRAINT     �   ALTER TABLE ONLY public.group_role_mapping
    ADD CONSTRAINT fk_group_role_group FOREIGN KEY (group_id) REFERENCES public.keycloak_group(id);
 P   ALTER TABLE ONLY public.group_role_mapping DROP CONSTRAINT fk_group_role_group;
       public       
   magnittest    false    264    263    3781            `           2606    16912 6   realm_enabled_event_types fk_h846o4h0w8epx5nwedrf5y69j    FK CONSTRAINT     �   ALTER TABLE ONLY public.realm_enabled_event_types
    ADD CONSTRAINT fk_h846o4h0w8epx5nwedrf5y69j FOREIGN KEY (realm_id) REFERENCES public.realm(id);
 `   ALTER TABLE ONLY public.realm_enabled_event_types DROP CONSTRAINT fk_h846o4h0w8epx5nwedrf5y69j;
       public       
   magnittest    false    244    218    3645            J           2606    16696 3   realm_events_listeners fk_h846o4h0w8epx5nxev9f5y69j    FK CONSTRAINT     �   ALTER TABLE ONLY public.realm_events_listeners
    ADD CONSTRAINT fk_h846o4h0w8epx5nxev9f5y69j FOREIGN KEY (realm_id) REFERENCES public.realm(id);
 ]   ALTER TABLE ONLY public.realm_events_listeners DROP CONSTRAINT fk_h846o4h0w8epx5nxev9f5y69j;
       public       
   magnittest    false    220    218    3645            a           2606    16956 &   identity_provider_mapper fk_idpm_realm    FK CONSTRAINT     �   ALTER TABLE ONLY public.identity_provider_mapper
    ADD CONSTRAINT fk_idpm_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);
 P   ALTER TABLE ONLY public.identity_provider_mapper DROP CONSTRAINT fk_idpm_realm;
       public       
   magnittest    false    218    3645    246            b           2606    17126    idp_mapper_config fk_idpmconfig    FK CONSTRAINT     �   ALTER TABLE ONLY public.idp_mapper_config
    ADD CONSTRAINT fk_idpmconfig FOREIGN KEY (idp_mapper_id) REFERENCES public.identity_provider_mapper(id);
 I   ALTER TABLE ONLY public.idp_mapper_config DROP CONSTRAINT fk_idpmconfig;
       public       
   magnittest    false    3730    247    246            T           2606    16706 (   web_origins fk_lojpho213xcx4wnkog82ssrfy    FK CONSTRAINT     �   ALTER TABLE ONLY public.web_origins
    ADD CONSTRAINT fk_lojpho213xcx4wnkog82ssrfy FOREIGN KEY (client_id) REFERENCES public.client(id);
 R   ALTER TABLE ONLY public.web_origins DROP CONSTRAINT fk_lojpho213xcx4wnkog82ssrfy;
       public       
   magnittest    false    233    211    3619            N           2606    16716 *   scope_mapping fk_ouse064plmlr732lxjcn1q5f1    FK CONSTRAINT     �   ALTER TABLE ONLY public.scope_mapping
    ADD CONSTRAINT fk_ouse064plmlr732lxjcn1q5f1 FOREIGN KEY (client_id) REFERENCES public.client(id);
 T   ALTER TABLE ONLY public.scope_mapping DROP CONSTRAINT fk_ouse064plmlr732lxjcn1q5f1;
       public       
   magnittest    false    3619    224    211            X           2606    16851    protocol_mapper fk_pcm_realm    FK CONSTRAINT     ~   ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT fk_pcm_realm FOREIGN KEY (client_id) REFERENCES public.client(id);
 F   ALTER TABLE ONLY public.protocol_mapper DROP CONSTRAINT fk_pcm_realm;
       public       
   magnittest    false    211    3619    237            G           2606    16731 '   credential fk_pfyr0glasqyl0dei3kl69r6v0    FK CONSTRAINT     �   ALTER TABLE ONLY public.credential
    ADD CONSTRAINT fk_pfyr0glasqyl0dei3kl69r6v0 FOREIGN KEY (user_id) REFERENCES public.user_entity(id);
 Q   ALTER TABLE ONLY public.credential DROP CONSTRAINT fk_pfyr0glasqyl0dei3kl69r6v0;
       public       
   magnittest    false    215    227    3672            Z           2606    17119 "   protocol_mapper_config fk_pmconfig    FK CONSTRAINT     �   ALTER TABLE ONLY public.protocol_mapper_config
    ADD CONSTRAINT fk_pmconfig FOREIGN KEY (protocol_mapper_id) REFERENCES public.protocol_mapper(id);
 L   ALTER TABLE ONLY public.protocol_mapper_config DROP CONSTRAINT fk_pmconfig;
       public       
   magnittest    false    237    3702    238            �           2606    17789 -   default_client_scope fk_r_def_cli_scope_realm    FK CONSTRAINT     �   ALTER TABLE ONLY public.default_client_scope
    ADD CONSTRAINT fk_r_def_cli_scope_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);
 W   ALTER TABLE ONLY public.default_client_scope DROP CONSTRAINT fk_r_def_cli_scope_realm;
       public       
   magnittest    false    293    218    3645            n           2606    17161 )   required_action_provider fk_req_act_realm    FK CONSTRAINT     �   ALTER TABLE ONLY public.required_action_provider
    ADD CONSTRAINT fk_req_act_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);
 S   ALTER TABLE ONLY public.required_action_provider DROP CONSTRAINT fk_req_act_realm;
       public       
   magnittest    false    218    3645    259            �           2606    17869 %   resource_uris fk_resource_server_uris    FK CONSTRAINT     �   ALTER TABLE ONLY public.resource_uris
    ADD CONSTRAINT fk_resource_server_uris FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);
 O   ALTER TABLE ONLY public.resource_uris DROP CONSTRAINT fk_resource_server_uris;
       public       
   magnittest    false    272    298    3813            �           2606    17883 #   role_attribute fk_role_attribute_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.role_attribute
    ADD CONSTRAINT fk_role_attribute_id FOREIGN KEY (role_id) REFERENCES public.keycloak_role(id);
 M   ALTER TABLE ONLY public.role_attribute DROP CONSTRAINT fk_role_attribute_id;
       public       
   magnittest    false    217    3641    299            ^           2606    16881 2   realm_supported_locales fk_supported_locales_realm    FK CONSTRAINT     �   ALTER TABLE ONLY public.realm_supported_locales
    ADD CONSTRAINT fk_supported_locales_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);
 \   ALTER TABLE ONLY public.realm_supported_locales DROP CONSTRAINT fk_supported_locales_realm;
       public       
   magnittest    false    218    242    3645            P           2606    16751 3   user_federation_config fk_t13hpu1j94r2ebpekr39x5eu5    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_federation_config
    ADD CONSTRAINT fk_t13hpu1j94r2ebpekr39x5eu5 FOREIGN KEY (user_federation_provider_id) REFERENCES public.user_federation_provider(id);
 ]   ALTER TABLE ONLY public.user_federation_config DROP CONSTRAINT fk_t13hpu1j94r2ebpekr39x5eu5;
       public       
   magnittest    false    229    3681    228            q           2606    17234 (   user_group_membership fk_user_group_user    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_group_membership
    ADD CONSTRAINT fk_user_group_user FOREIGN KEY (user_id) REFERENCES public.user_entity(id);
 R   ALTER TABLE ONLY public.user_group_membership DROP CONSTRAINT fk_user_group_user;
       public       
   magnittest    false    266    3672    227            x           2606    17412 !   policy_config fkdc34197cf864c4e43    FK CONSTRAINT     �   ALTER TABLE ONLY public.policy_config
    ADD CONSTRAINT fkdc34197cf864c4e43 FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);
 K   ALTER TABLE ONLY public.policy_config DROP CONSTRAINT fkdc34197cf864c4e43;
       public       
   magnittest    false    274    275    3823            ]           2606    16861 +   identity_provider_config fkdc4897cf864c4e43    FK CONSTRAINT     �   ALTER TABLE ONLY public.identity_provider_config
    ADD CONSTRAINT fkdc4897cf864c4e43 FOREIGN KEY (identity_provider_id) REFERENCES public.identity_provider(internal_id);
 U   ALTER TABLE ONLY public.identity_provider_config DROP CONSTRAINT fkdc4897cf864c4e43;
       public       
   magnittest    false    240    3712    241            A      x������ � �      ^   r   x�̻!����<����	҉�K��;�Y4K����Sp�lJ��V���n��i��&���R�L9�V�Z/Ɋw�C��������o}�X��BY_�mE�;��pL�=~�1�n5%      D      x����v���m�]0�b�������DjH�{���/�DVVQK�R�� b�$�I���՜a)o�T�u�J/}�UW\���կ/��������\�_��]Y����-z���y��zt�fLw���%O��_Z�9f>B��|��o̤̊Ʀֆ�-�����`�Ξ��>�Z�(�JP��e���̜�]��G��|x�������7�<��9�fy|�q�6�E��9�GW�V���T�Ϋ�|\֤�j=}��N߽ܙ�G��*3y�_l���T�^�QF���*����U-�g��*b�*%={Yf����y>=��S}����<>��>�.�PH����3��-NE�i���j�ѻ�M��e
�0R䗻6r�t�ґ�z�Om��f�%�ѳ^iK��s�U풂��ʺz�F5!�l���?>����Ǉ�i�����?~�^�w(�E
����5��#��lXA)k�ZM�������E��۵|�9�H��#�U&��.�6F��(é�O��>>Շ�w�t?��|��k�ި�V�T�!�Qy��֊�����֋��KLto�d�WWe�I}]ٔ�Ƭ���_�������e�'E����oUe:_ِ����0����0��ssEА��ДϮ�ּQ+��~m�9l�?�ֱK
�_�TTz�`���5�evܡ�%�5�T=*m'C��f�؟)6�XJ�
?.-xc�]��nv��dz�*����f�؂[�����痧*[���E׏ZrM9��Z�3��Z��ny�Ӗ_�bpCw�)�䳄W��f�5Ŕ��VV��w��6��S�W5
Y��Ӵ��w+;��in����P�ˬ�Z[�l��b�a�3�uζ\[��;Yyz\��xv������v�8���.0UNT&��B���~�$��������>�֔��w��V���.t@p��w�i����Y'�����^C%f5��	|��� �kB@��>��/R�M�OϪ����|���4��ʺ��K�*gi�V3ul~Nw9�:c5M��侳V�Դv��Ƃ{�^����ӍqwgZ�ZS���7�=�_Nu����t�s��R�JAQ8.Z��GXˏ�W��%s	��b�c�N�΁���n�q��HF�3:��m����+���-��+�i*��8���=�ԍ����z�^�YDS���0.�S�ك�v�mi�d(>�0b�
�.LU���ytu�(������^^Ñ�`͈����iP!�rӯ���T�u��,�ȟ(PA���FMt�/�F܅��n��������&�2��i�\�.öhu}�����]��ٚ��&�O
��V6�Z�Fc�]����l�$]R�j���`($�6m2caO��(�������ʲ�u�L�(�Y!�	캇�u4}B6�Ԫ#Q�q���%�=�V[�C��	RGьC���Sؗ���+�|����bS�+�&e,���֍�2�5��u�V��~�$��>6���?9w���cem����f��:����>���׷
xn�		Z� Y�:dP�tA�Xm�QA ���:(������X#[�L��Ul)��y�8��� ߭1�E6q;tJ�ۋtɀm~����k[o)P{��>�?��ְG�\8�_���� ��H�¯��Y���r�c��=\�Fdr�<�Y�r�(�j�e�z�۾K	�G�U�P1X�V2Z'����u�u���������P�����l3J����%�p�	��:�v,�ɾ��sZ�� ȓ�P���Lf��Z/�!5�q�)DCdr���L���g���n�E��?�r��|	�J�]~L�������:�r�`og�Bޢ������r��+�ٱF�V���	Y�ՖI��G�ԑ��) ȗ�+��j����m�n����?nG�N�f�j�@ϵ�poAd��)%�Co��P�>�w%�E8����*T�Z�@UL���H�_H!��5_�T�ԛ&��}3�@b	�4����I����"��Z�s��V�����x�
I�&���\,�@ �RV�W=�rF.����&N�L>�������MLY�0�
���X�1b�"�\m[�C�uR��i�T�jS6Oxh��Ո��5�m�1k�#� �?)k�w�ظ�XDH�M�쒫�7�u+�i�6��t���P���2����	,݈B�Z�tK��e��\=����ޣ�~Axo1S��4�
ÿ�����`;5�Z0 �R�̕�#}j�^����?a��~|��3��w~	�eс��c���ޙ����"�i�h2�e?0��
U����z�{s���P�)WX�n�1�,M�Ք7�ح������W�@�s�JY�(�d5�b;�7�yA����0�aPv90�_+�����W4������QN���R.c�� (�~�1�EKŘ���	�� ��T����vZ8�{�ps�]W٘�H�=zɣ�T	�?ۘB^�����m �nC%/�7�T>2|�V�`�L�+�p쭚�
Z+BA���+i�i[8U���n��?A0+d
��!�, i�q�e3�Y%ݲc�.��\�r����������O���g���WnA��m��lg5cCm��~�ys��!�kX;��p��BKC]9M�t�������䱙dpЭa:BO�A�:��D��b�rBc2^�T��8�=��k��j@����#��HmY,�����U=���9l�g�w���I.}"M����8�1���{urVv���)�S#�YG����1�����𰎔f E&*;�X(�P��, �������I~�����F���T&�|����b4Y��=1��o�Q{��/�n�����i$g�"Y��4 ��)�d�?����st $Ô"'�P\�(*`u����x�!=�����z�oG̡5�F�
x ���)u�G/���+Qۂ�ާy�bO�N���piWTtSNk�Rf�:�c�y3��x�x��/��x����,bR���08��>��|�_�`b;pD|��}/��W9�H8J��r����]8��眼��. ���qL�~��ZW�TR���WI���*"��V|���~(ޅ�H�`B(�9%g���n�t�vLZ8��'�n��� L���S�$��;&dF)������>f{o�`\\Rzh>,@-hְ�K��v1&��m�d��/�$�2����?݃�e�J�geM�M�d��<�Sk�� ~�.��������ٷv���(G�7�ەڧ��-�-Z�!P�l��-���4�m�����c�r�� �Hry3!��j�<W7#D�.�v�|s��1stF���ט�3��CǹN��� ��zz�p^B�Q���{��^E�S�U]�u\���')�$/�}�Rk��1���Nd�/����K�պ'���D�J�{��.$�6�4A��n���v����׀P��[YN���Bf6ӈ`]H��#+�UN-l$G#9�;҅Gy��u�}��ŕ�XB���{�(�	�#7���]��i�+�]�y8�NW�?���>U�ӥ�h�}Π�P���Y�eغ�wbp����}M����6)�$�ĭ����A���Jr:d<��;YN̼2ZނD/�_L^i-7j�v���/���^ҽ��n�W�0�cX��&����}�
c^�2p�ہ�K�Hn����J�h��������1ܮC�&(e3�>ɑ�Ho�L�Cƚ��RC�U�zp��Rf�H��2��������9����G$�"b�AϺ ]�O�����~t��8ݝf3A�Їt�V�<��J�ifc�x�Ǣ��]��͐A�e���a��#�tl'��,b���a����݅�;y���{,�	z����KQrӴ��}+�]���..���;����rs���8#K�jm5\ea 䐍��6����Nm.o�ܼ�݅4�����4�l�t�\�ZLWϧ��?��r�
.��^����%���	�}`�	�lt�e!Tl�w:r���E��V�.~�qeLD�� ��H�!7 ���N��.�{+�v���л��Π�G���\ICDٌ5����w7j�##�܉7�%ɨʩ&��l�f��{�~M\���|$̷�-����f�;'�
]B�U� 2   ���\	��ٛ���<�ږY
K֊���ej�|��:�:���>|��葝�      C   �  x��X�v�6|���`8�_������k'���Аx4"�3����-ΌlG;��4$��n��L�]|����*2�V7+kс}��v������ϴ����|��<��i�.h7/��n(�m��n��'�ؚt�Bq0�_z�(ᥕ��)��Mۋ]�+�邟����]O�����˞Ɗ�3�]"����=�!\��p&�,G�*s΂}L��eݏ�e���4�aɞ6��_�v�0O?O}e�}1���G���~��[��հ�ڑ�~�O1X�*(誅	i��)kaњ����ծb�2��[���%��O���e�嶺mA�#�������6ܼo1�\6�$r�J�`# ��u'�X�y�
�R������,��Ł���A��d���a7o�|~���yx�ޙ*�� �1s�,�$)�
i��L=0r�~�����j�,�qQ���1Hġ�s̖�`��}(��u���Ѣ�ja�ϛe�t���a���=��M<���ZY�h��E([R	Nd��P�9�m����W���l���>sX���Y���ͻ�������'�5�/�V����-E}��H�!,Ŋ�b�l[��te3 �]�#���p�~q���Bi�_�P�j	2EA Sl�NzUL׆�n�!]� ~3�c��,v�L�<��0w���z�����o����7��R��q~�_��l) �� ��0��, �7�?��l&:����V6�l�����E+e�"�䱗�R&I{m\�t��,�z���� 4F�Q��G�yQ�y����s-�C%�C&"%OB+� R6)-�����_�N��������iR�#��� �1�#hw��/h��pu�~���wL ��v`-�j2CiE
�5Z��B���R�����x;�[�M�{>t?��zHX��$������j��Р�����T�c���j�����$ps�>�@��E}�w�cj_��!V�؄����ǫ(L� ��*�ڽ�O��u,@B[ˉER1�X�V�
tZYJ����\v�����勷�������qy�~JC�]�.z�k`k.�/��S]����h,5W��89��h_ݟ�S��^���'o�[�`s&�D�*�ȭ�0�>��B
*vg3�N9�͆�S�4qق�����'�����_�w0y_�����_c���_h'��؉�M�\p���pwg�7�z�3|,���H�+9
��I�(���ӥ��}1�����Ŵe����^�z��\ ��#��ᖘc��Ii�׮z5�v�nW����,L�ً�Y�ϏhJ� /(@HQ��4�T2��
[��+�&�Z�@��Պre���
%����[�)�	��r��`�<�l��ѕaI����\]�7���Ԭ0h�D�8�b3������{���$�##UҰ#T �C*5	�3=�݉΅o�Vs�Յ�t���i��"p��MӦ�G8�W�)�E���a�(L����R�|#8�/���o�4���M+B��m�n �����b'�)�]3��gN����Q)�]Z�XS#�-U��]��XZ{���}�u8�AbT��zN�|;��@5�rTJ�MXoX,�C�$3Z��������u8�h�j�'B��A4�)�%wm���g��21芆��^�#�cm��Uxd/���,F:�������y&n���Q�P��-���ʲnhp����l�ZB�%��X��*��Eǧw�u؈^	�&wf�3"�˛��$n�=⻎Յ[�(7Մ�(�����%��./��W6	��~{��ɓ��i�@      B   �   x�}�1N1��z}��� {<{kn@Mc���JI��O:$$�^���"���	݌D5Q�R)T5-�o:x�����c�'�v\��������,*�x��J�gO�o�>x�b���~�?b�R$��;i!�PK���8���Q��������5�(�~������jVڈ�C?��s��U�      E   �   x���An�  �s�#0��_zq�DH�dY���C���H���&΂�R��l��p�Tm�ˣ���}y=��j��j�Ps���1os\{?W�HJ�l�@R�������K�c�2����[�9�Q͟,��a��}�C�~�+ł��
\��ZJ�����t���?W}D	�f�� �6C��n^���5����2����h*      _      x������ � �           x��U[�G~�E�TP=ͭoM/�����RB�H3�S{7�{
%�wv}i;{N���#�>}�$Y�X�	 �`lA�l�5D)�Ű��-���Nh�]����/�o�N���xtz���ɺ.�f-� {�;����h[�)�DbD��cQ��Hm";S��}7,�!�jB�_������3���t���:��೷L��]�|��紗��ͻ�;��т��6Ħ�ΐ��c�<���a�F�ml�Kh�9 �0�[1SP�z�6O������Pٮ�1��ș��������|8�5v����X��� �t˧h���T1��Sr�!�f}JaB����o�<:�XKk�s1!�H	�	!֤����6~5���џ��n�����N�q��_�!�ɳO��R��.HXZ��t"�B?_
g�j����#���J��4�9�R�D��ƬLzB\�s����9��SY\Ue��8����V�Q��^���xX�r
���Z�Û�W�M�is��۸AO1��"��������Z�q�Y�T!�7`�U�j0q2>39w%��nJ�"&F[i��U��؋<�K����z�v��T[�����hM� ���Ue�����G��\[�UF���դ�m?����༮�?5�g#}�f�	{0d."�c�X�v!�ㄻ�{炚�~�3�k`;*��k�� ے*;��~��?�ؽJ?���������?�{�q߿�m��hwd���I?�����r�/�0�      1   �  x���ݎ� ���w��=Go+E�0$(R��n��8�{��T1��$r">f�p�`�jٲV(̈́���Jt��c���j�ݏ��w�3G���	�%w$>S:y�o*��@Ġ��VF!�@����n�!������l52э�MB)��TOЏYV��������l[b�.kj٪Iˎ���RXh'�y�sd��G�$)F��k1�6�4�x���Ľ��8�)?�X0[!��4Nw,D
W
<�����6����8�9����ČKk���֐K� ���zyB��N.&H4g�˽�dfZ�:���kJ!����L�֧ʕ̋M�
v!Ń�T>�7���S�I/h�����j�u����:��],�_W6\��de��7�f� 9�����(�h$<������@:���D��(�&�,�rǞ�d�qpu�6��\��)��O�{�J~Y��s��?)�"�������&��s�<�����{���-72<Ct��@9�N��D=5(:5��ײ��I<J�ƃN�����R��">r�`�v�@7���rv~�����W�(ٜ�%}�G0�������l���ٔ<�ۻZ����}� P��m�_<��W��_�߽����S�&ql��QP�����O���� �8�      j      x������ � �      i      x������ � �      3      x������ � �      S   �  x��UˮE]�|E��Q��P�!��.���������H�EMX���c���Kd*�cL�G���%�@�;�vX{��E�ckr:G<�e~������uY��G�4�g�����;�v����ebh��1f�t�AR���kr&J�a[gy?O���/߽�q�D�k���`�ɦ
��
�@�NЫ�^m_p���>Ͳ���웚�/�p� �$��*5f+�\��q�w�<�ޠ�Z��$� ��(Bf��u�q62o�G�}ˇ��>H����:T|��zI��w�ew߮�7(1"I2)�T�b�Uq�|�&��_cs}|��v�1~:�v��i<������ӟ�܂�Z��+��"���΍��mW��:�u�>L˾p��{�Q���RB�!��C�v���K�ѓ傦��8�m}��q���w_�G��כ�ߢ9�ɬN*V� �B@2���%���ެ��,8�j��|��aի�E��8��L����g��̌��ܡPWf�����n�R��qw3{q�r/�R���H�qj�2B��Q����.I�S�ͩ:=t���p�A�s=|ᑟkx�&���pO`�d}��Wy�VP����l���S���[k�F�B����*"�
)��*�1��c��61w��L7�Ԉ�9cX��؟�s7�+J���Vʤ��~]@�\*�T�il�����N�|������p����      T   �  x���;�SA����H�hޏ�R%�=�EDHV�AE�w��B"���J�]���w�-35М$���j�!Q�!��������؝��q:.r��q9n�c{=��Gy3�,ˇqz���9����ӟ���>n�b�n$P�IJ��SϽ�%�ZuS��u��������/���\��ҡj4T�N��.��7��^��'��׵?��7���N������-�	Bw�A��Z�Ջ�0�)��*_q��5_�Y}�>p�H!@��w���V�>��^��<m���n���7'(Y��B,��(e����Ì��t���|U7d���d�b��]<���X��eM�c{=��Ovk��xXn겁����Ŵ���Z�������.�7ᶰ)�_<��ZJ�j(08e�+К��#yn�Z_0�g�cs�� ��_�Z�Aq�'���J�n��b<66�)��:�4b@�W
�ɇ�i0X�9$�U������s�c��>��g�<��E<�%dm\J���H!pbS�W�?EX�5�x,��m9D
X��R7b�jO%��$���v�)����h�\�jr@�F���2�V�^�zi��"\�0z�c@g9�R���F����m�"�(Va_��4Z�󀞑���WQ�^�<��E<�/�P[-:U��޶x �Z��Һ첧�C� �N:�@�*��n���h�Em      k      x����qm7�R.�ř`.� "p�e\GЋ������CR�L��#jޤ����$����iuY�9E�M�IYɤ�벼����3��e������H�EƝ.��%k�,��n�Κ��,[w�w��t�4-]t�ŝS���n������̷����sy+ݷ�U����j�lI#���z]��zV.��L?�����f�O��n����b��QK�(ky�~\%�zH��e��2u��ZK9���ɹ��d���FDIͤ���ޱ�~�S���.�Y��N�V$��V^z��/Ă~!���_��B,����Ŝ`~iO͛V)��p�<�_���fo���a��",�_�E�h~�/T�/��ޫ/�)׿��w����X��j1[��/Ă~!���_��B,����Ŝ`~��{�{źG���hIڶ�V��~!���_��B,�bA�X]�/��˖wm�K�����7�9�<=����2���՗x{]F��>�g��G����+g�����&�}�˖)�����!i�uy�'�[��v[��<�g�O�_��N.~��c��-e��(�ݓ�9O^Tޟ-q5����Ie<{t�K��f4�ψ�ΧV/#�{в�lC�ոB��Ţ�8�V{qq��ޛ5y���w���w'�<$��$[9�K>�}�J�y�y��G�Ꮶ�}���RM�R���X�/�#���_��B,�bA��R���w,|��6����>�?b�_��B,����X�/Ă~!���_�3��C���`IlƷ��ٹ�8S���_��b=2���X�/Ă~!�����B�$�$XnM4��2ڍ�˻�bA����Nm��:v#�(Ǣ��#y�4��<W�oĂoĂ�Ă�4ĂoV{+��������/Ă��X0�f��ڔ�w�Z	��@�yb9�)��b�B,8C�g��������!�ߜ!x>"<{��c��Ĩ���վi��Ɔ������GĂ�#��b��B,�_��B,���%"�#?������b�Q�y�|�owĂ~!���f����7���Xp�������
��      U   I   x���� ����D$��	�/A޻Ql���Ч�tC�H_kY��ƫFO��(u�O��|Z�+�-"?Oh             x������ � �      H      x������ � �      2      x������ � �      @      x������ � �            x������ � �      I      x������ � �      g   '  x��W�nG}��B?@a���EQ�M��_8CN"d�Uw�4��r�زl���
����,y�{�C��0y�@G��yÀ5�H�ldW8�>��i�k?����e����y����_��v=~Y�<|]U��[�f7�ոp��7�m߭���j�s�h��~��:n��ݺ�焥(V*�$��b�osê��>ή��(�����j`�7S�0ܯ_���E�rqJ3C���D�hγ_n�n�G����y5b�P�i���Zr�)
��(p%e�Q{`�y�]���o���q��j����Y�78���6��Pp�Fp�RrN�蝏*x�m�S��?���}�x��-��w[~`'���!X�]|C���؃�����h��샍�fTx��v��v��K��:H�7'4���%d#�n�[�����>ˁU����9b��Bk��p�K�e�j��D��a���ԋ��p�xȦ0p�����lgÈ��7<L���9]<A)��7��?�uE���r�~X�h�:Z-:	��@�R�e��ߝ#�M��y��R�E��El��=�*�j�R�8
��d��}^��OV_�1�UIj�馆�P��C��jt3�����Gֵ��yJ|��D�R\L��n=W��~�k�n}A�:�8f|N����xQU)S�AA�����y�{�?2{���$}��F(�cvvj\d]�� ���������E�\�cKF�%A*��3H�횅�1�Z�;���Ͻ�9�F5�����r�U�˪�l�ڥ���t�\)��Ť�&�V+�!�p�$��Ȫ��(����)E9N�QZqm�̢i�Fi�+���G3�����hg�2�C���'�&Ws*Ho�)�m�dށHS��$�#��V%TRRdڹy��[���d�+í��8�Vݓd�v�o,������8��b�J;��b�`�>1��3�	Yj���m�V�O�W��+� YG��V�()-�T0O:�S��ɫ+�y,	b��L�i3E��7VJs{*�G��N���\VT�d����@	�ٛ�d�8U�G�yE7p��f9���K�`�      f      x�ռYӣ��.z]�W&1]��`��0�8��dl0�������k��V�ٵ/NTT���F�Rf>��R2aV�GH���fxB� M�iNdy*�d��Z�$p"�\Ȉ<�<d2$���='b�x��D<�)�~LÌ~R� 1�(�a)����HY�bQY������#��	�gI���iH��{�_^3����EOP� �Ȅ� Ĝ�R����?�4���-
 �`^Dʉ!�)�p�xV���m���b%�G�_epl����RP|JH�GD��L��r�SD�t��������� 'P<��2$�����k�L����
�j��GQ��~oz���~B@K�X�� '@�A<ϗ/$H)E귩�B8�q����@ ��hl؂b�LJ!0yF�ش�)~��bn[�>�H�i� 6��oa�X:�	6ϳ��DXH��>����4u6O�[�E)�b��t�} p���Oi�2����U�p<ѧ���#"�9��K!d<���8���^�'�T�wi��=�s)��)�Ł��S��!��L$D���3�Ȃߦ�е�h�?b��v)�7���A bcH� 4#�GLNg���3��r��2�D���Ȋ�2�2�+M�4懀��
@ Hc�)�Ǐ	kQd���������L*��} ŘW����c<bq(p9@o��?l|z�`�9�
<�L����%N�r1�m��3P8�%�
D.����y(4�h'�߻�9N$x�"�¹E�00P,���9�!	������!M1��&:�� �%�~sG㜐	%~�����I�8ER��rLh�"��8I�DS�M��Ǧ��2Q8"��,]N$	�����'h"�X̶D���@d�F��]�M
�!��1�����`�0m��/�CN,8	�<ҍ�+�0�Q�H�v�ޞ~	LNH,~�N��By�K?p:��.��2F�����4����B�3����
�#�_\
B�#K��6�A!b�	҂�@�㍡0�`��� / ����^����"�/�YHH�Ud�T�f	H?-r%
8\1D�0�Y���o>ai���e�&��n����V�c(�A�
�3Hl�׍����4�kÎ(��CZ��oI��=S����w(�� ]'���|5Z��zau[2螁�ȷ7*�wF�3���7eͯ*
�����h�| 
��;}{v�LY^JY���L��;���������##O���m�D�	Q ��
�m��9v%��#�v\&CYHC�s8����ҹ����nD��ؼ���$�u��a����:`'`�k��K ;+�H8�@�9.P8N��As�uQ��~ا���(���ʾ<hp��.��}yU�� ��^�F]V�퉫�%���TU�MI�P����ܱ��fe��42}_���k����~���j[���:���U=�e���*�7��_S���75�ej�j�=L$Ig��<�٫\n���BWZ�QҺ,��f�l|K��f��{
�[U]�2T�.����6��~=X'O��vTεG���-o�|�Gt�>#��kcȆ�y���@K"u�Hh�l��3�)���R>�rjM+J����w��sr�϶r��@�B��en|<���~<_ArS?�)�3���s��"���\����ܗ�y�Mͨ>�J<)>F�6���Z���fW��P�Q������l�dr/���pXr���\o�vd�r'�v	X�v�������}mc���T-�#{���d��^ޏ���#�l��t�b�����g�ʚ��Q�E���7	y6����Ky/n��"��φG��qy�j[`;0�:�
3���������FR�G�݃���3�⯤ɒR�[�-֩�g��<��rU*��w0�iU����-�w��t��H����ʣK~R��K�l�w�(6y�d�F��OWhCԢ���J��~F�� ���E��}Yz���~��R)+��$+����*��2�Z@�����:��ڷ�'��㑜�Z{�Ql<G���b�ߎ#�v�_~��Y��,�o:YB,pndS�
W���2-8�M��F���8ZdS�V���es��%� $�)[�����9i�����w���Q\]w��E�&���R�4v&I��qW+�.8&�M�$&����'>���6��sp��I�Hٱ�s�m�����=�ٸ<;�'���ϸ.��Z�n^�vF�Y7������x�;hC#WU��.���n���1z��<qB��s����K����ʟ=&xU�Xw`*��$�B��k���N����#~�g&W��3�1��̶��$r����6��EN��x�h�#���|P�I�=y�*)dndis�>��"3o�����έ�dJIb� t%�0;%�K �[�Z#zLH�p��L�RE�5{�n�)�{�z@��P�T���c�A4��DkgÑ��!�1y��5t�:b�	�ܧ3m��'Tows��Կ^y���}��0��E|{O����n�������5֮W�	����n��/�/�iW��F҈�p[�4�}�q��L�Vg/��(���k&j�K�f��W"Dx��L�O/׺�2=X�vHw�u�HIb��;��b◆-�h�R�j>,Д2�daؽ�9x'��=��g��<u��K��(�����m�%�5��3:$[9}�>�p��%c�Ѧ�9��q���${��]8�7��dkv8�Xqwi��v����I��cv�{Vw���C�2��z����>mS�G!���֬�*+����W�0�nͺ�["+�e�gҧ�+�42ie��f�\���[h���#ɓ'��\[�n���}��(��K���w�1.�X��Td�jO1����MK�Z+?�r~������[�^���3��.�Bv��Z��@����U=����q�^�Fм��$�y��@m�������(��?��X�8i���@	�IW̵P�%�̦����6|�!��H�}h�ݵ���驵�wJ�� ���e]-ﹷ*�P����>_>����5��>��)T��\��>mR�7����y�CZ�`|���=�'�5�{�<����̠�0�,�e597���.mOA%LT��
f�6|#v5�̡�xt~VS�4k[Ys<��j?]]pnŻ{��]�Ș�^Y����S��j<��~�����ۨߦ�~ax<ѳ��?�s����c��F'�����d��3�7=��l?W�G������<�e��z�w2��5޽O�^<k�Gm'�ٟ/�?��=ݑ����m��qZ{��A�n0�W[���[�.�/�)��8E,M������_B��1e�u�x�����Ԙ�q9�ݽ�T��zS��2Qп"�B���L� ��o"��V̼�7�>�}G��i.W��c����\Fm>�L�I�hC�u�(�k�YZy���@�Țj�Z�OtPv/�	�����5��w�����ݎr͌R��!k��eI8`�rbSss��M5��||"�^��U�AX4`��iHч?8PW�@n�Z/ّ��0_�h׿��:9
�+���`ceW25��eP����+�Q���N��v���"�Z��WEʒ���
��ٔ1H=k��]�P�{rX�̇Ҟ�զ�\�k��?�c�(ww	��_�L�.�gE�M;��J�O�>nq
2{��<�|�K�]����z[�;{�:�	��1�+��ɞb��2��fi�!j��ܔ��jg��WŨt��U��O�N����"�<��`B^���K���7Ay��'���ch��~��'3�+6�l�̭���3l1�^eS�J�`�W$�+����f_W&�l�öRg���n��/n��齀ㄔ�_]�!�ɺg��i�]v�bnHW�{ȉ&�~"!pޭ-��8g�Y��f�d�ᬳ�;F��\�0*���=���̾m��F)� ��a�����`��"͊����Hf��'ɬ�Ga.����C�͝��X�\���`U���`*��eS�0��q���m�=�5�~��{0v��]�E�*�W�;VSO�_�|WW5�^N�Lj���2�@��� �Ѷt��0��8�ޞ�    ���]5�{3��`gE�Z��븫���5��g��U�R-"s�L_^i�������A���$P �;L����UCE7����ϓ���s>=���i�l����T �-s
o�<��y�N�@W��:}-xQ�FioP5գF�kzAK��`Ɠ�������<�H�`�Gf_��A1�Dy�J��M�WV�t X���7�����:���$�YL�e�����{m�"2.�"�!-��4f�����T�BBÝ��%�(�t���͋O�~�Qr��]=
ܹS>mʛa�:�e�Pd-�z�]^��'� 5�w�z�6a�+�i�� ҏݲ-oM-����s��EF��X�)3�O���u��Oi��?�;�+��t���f�\+��ն���T�:<�ȭ>Ӵ��>�k�^��$�D\�t�>��+Ї��Ar��mL'x�eMv<���6�f�P�̶�(��*��X_��H����?�����҇�dz���9(_��2m*������(���;�e�o�'�{c*@Kޜ�#���^eԙy�pq�{S#�q-N�i�
�y+J~W�}_�,q}|��u㵎�Q�>��_1���	~�R�L��tI�W\�B/ۙ���p9�fR����L��z7n�6!�`�S�t뗵���tfԸ��Y�k����T��]���O�S�������Һ�V�v��O���/�x�X_�ӑ�Y�2�{n��,jD�m�yM���4n��-��ѕ�s�s�9A��9Y�g����T����{ �����������nv�.���ӋfR%ƨ�[�6�2N�f�5��5/q%%+~�h�n����*WL�0�=qd2J�t�����:O�N�Ўo�����A!������y4�,���`(��x�&���A=�d�D�(e�\�$����)��m�Ҟ�e�M�P�ٶr�<3�����<>��9���J��C�j�|qʘ��qᰗ-�k�K>�e��zP/,m��q�X�q������"�/,P�p �Q�V`J�=�õ��r4Ns7<�{���O;*n˵�-�
/��"k�'����G���r{ӭ1
G's�= ^>5�`������7�����\�a�T?!��4EIķ3F ����Sٔ�@*B������}kTs��8�9ǤD���T����0_�<�$Z�����۸,�R,~���d�+B�c͋L&J`�_�?��/�L��v�����lNT���)��Y,�(b�(���-2DΣ����h��%rEA�)������������'Y&_�S�?1L��|��Y�� J1��R�ɹ��<�59�v��-���}�Wx520'B�*8��i���!���HH�o[/��&E����4�G��D�}��"-!����Hؼ ���8.�xQd���D(�4��з��D�<]^ę9�*�a��yQ�v���WF���~���/0ǥ���ߜ��(�+����׊)�m�K�=��b��o��ٿe���`	&gD�{�SH���bs ��o��?6�YA�)>#r�a_)h<,]H�P�\���-�{g�Ot�)��3�� f�4�k�0�a#0
�I�
���r�H��r���D1DJ�ߖ6�x�H��{��_�p��@��&(W����\�"���ќ��_P�̂xQ�Sf��@VpD&9F  씬Dq?2P�"�X�X�m��?#A���L<��P��,DO�)c�=pH���^�x��
Q��6���E*����ů	1�e"��phgB&1+�_��X���r���X���ڗӪ���?Ҫk���Ze��Y�݄��g�o�j�������4� ��M���T�[�:�r��L�&��]<|_��$�"�~'�e⟳}���~Rd����?�S�:��D�����J.�%���?t`(װT�l�,�����nǕ-����"������Z�,��VU7�Y��,�Mk���B�!;|0��c0h��om�T�S�V	^��p���|�_�g����%/����ݩ.�C��ɧ�x�ed�p%?��V�a�/#��K��<���Z^^�j�1m�Nc���QrJ��`�a��>%�����(��_������������Xz���;\����Wz�����d����t���C�<���#Ҷ���2l�ޜ�}�k\�p�u^q^<���ӕ�߆�:8��3��."CP��g�!R��v��]Dϟ���9\��/Wm�Uǀ�Y:�����T�{EG��^㢶���8!�3U%���z�\�d;�։ϭ���*�y�</����ѭ�f�p���{�C*��锚 쏝_���ɗ����c����\��5���D���OV�~ͬ<��H����q]$������=�f�"/A.��L!)�H�=�EK�0\�_����k)�������mv[<����U��c��1aPޏ�[�W���﬿�#Eru;��B�K��cHgf_�;��U���u(�$�ς��a����z���C� �e"�91⧷?L�y%��D��<��$�7���(;7�O;Ml��c{l��<t��ܴs(>�{�s)�ޝ|�Gz�?h�j-�P߿����r��{5	�4~<����F�>�Bh$Q�_�:�����K�����@�y|��1Q��C9ȯK��������,�#X��m���b�\f��굫�߽D5E� �{M*�~��a�R�>�]i@���PW%�t�Я{�$���>�h3{t�X^���7/���&��:iYn���y<��լ�����A9�nH-7/�+.�ˇ�S˵��ԃ�Zڱ��5�,�q���c8~|nR�}šp�am[*ktI�U�T� �����6=Gmc �)�r{Y�v�w�e�ʪ���/��;>0D�`7 (�nƜ~sYQ���OW	��Gb@�A����s�Ʃd{�3/�>�r��kC�D���ּ��7`��"XI7|8¼�EU��ۂz���8?�=�^Wy��/�J�%@�&�������A��g���K?�C�e�q<���g��g�[�"��;O_���=m�Ka_�ɏ%�o����Gq[R�y��L=\��C�$���YB�ň�c9)��J�l�S�������S��r�o��̣�S�m�[�/�>/�4ȌT�Pe��zb�u1N�ȵf�k��?�F����s�P�J�qF\su��r�-�w��R��Ղ�k9@ŻdBy3��w�%Q�-vfad{�c��P����`���wS���'E����tmb��<a�o������Z��mw��H����U����a��g�ڝ�F��G��rQ�n�k��i��	y���j����2�n]~N�c�5�U$�Kφ��Z�l�0P�NJ�Q� �R�l-C�p[\^�9��e�4��%2&K2zXҕ���'L���U?X��(%��z{p"_��5t̾�^s+�}�z���A��V�D�>y(f]�y<�~H1�ƞ�x���>�C=�T��>�]��Av�������G�s�kTx:��̯�m1:-�?:v:����C�pA�E�8���e�o� �`�k�h����;�^蹞L�|+��]��_� {Q��5:֤��xX�p<�[�L5����Nz?��\���f��EC�<S-"�/Igq�	Gp\�B�*�c~p,`��� }O(s�w��{P��CG��?��̸�/Dd��A�=���`�Bb�<E,d��r)O���S׬lN�J�p���@��s�T��{����{��#��I���m���Ӵ2���%��nѰ�.:hW�̿���^��M�6X5�\�G?��y3�_�F�.WI=��v�Y#O�Z�����x��9\�h(�BR�]�������V^#�n�����B!w.xF!�v�8��{�igQ��A���$�n{��m�3��K��ai����Y�,_������	�>^�	�s5�ɛ��s��r�l�1w6[�z�w��J�R�a�w��Ix�/y�rNF|��p_�]�ƛ���	���2üg�4���m'x��� Sw�v�Kg+��*�#[�IG\t.}�U���v���at�c����&����4�L�����z>����,�c�Z��N�����nw'���:��S��	��K{��re�3������] 	  -\+s�ܕW#)�h�=O{����&��,c^�e��0z�p�������ӭ��u5�(�B���{.v��˥��C�N�3�ù:�1'�te�_�^�i�<�GBY����W��g`Y�)�K��۾5�P�#���l��I*]�ܝ�k'�� ��l���In�g3Z�ѣwl�x;;��p2v��x\�%T��bm�-]U���x ���'�9����R�p�=�ˤ�N�C.��_�?9��y_��fg���Uy�e�����h��۶�4�P��ZR9���A�߶nk�E�r��d+��b�7&ѯ��ޏ�:��e�0N�36���-Cw/*��cH�sw8��wny��s�Ԣ� V�8���{�1��2���]�Y�̭�9�M�2������5�y�#��(��8,����dU<�ei�3.��Fn�u��^Q��n�ş_�9Q��2_.c�/�.�M�fYg�c���G/��1�:Q�*�w�:]�U��}<_��/\��(�Y���z�_%޽�-M���r�;z;�B���O�JZָr|ܦ����D�l�l�����.�%����=v��bo�3su˝'���E�?��e<!�av��*k�W���SwC��UP3�o��z}l����F��@y�5%����eleiv5�f?3�^�W��W^gRz4��{\M{Ew��;�)k�֙&��b��v�R%=��ϛ]c��B�ޥC�Dn��/�F�N�q����,��!��j�"f���5`���"vG�cy�����jf�8Ram\9bOtZ���4���׶��鳊�f��"=��l)����ݱ�H
�29��k*����lN{�ӃU��<3��p�o�y8�~�$7�~����l¤�����k�R�_�w�^�]�F;���~O����p�x� f�_�dQ��Z6��h�	
�k��}<��y�U�Er�mo�ӓw��]����Dߡ����~+��b��)r�ր֚�0�0Ҁ��K���5��Ho�*C�Ym��w��Ih��.��I+�W:��Lj�v2����VZ�>>�/�h�J�jKC�����>�e���K����G�y]��/gg��f��(�ʢ�}~���o�BR�V!��$�&J,(F�ZC>�1z~&8_(�F:B~�v�e�bYP���S��}��ӹ� ��&�I�f��}R��t'�ip�|aV���WZ.%~<g�gUF�YX���G2G����|��u�hsF^�̔����pP/F~ ]~|�ڡyQG��
'J��nz����i:5#G��m��#I?�Gd^�2�̶W��,��"�����O��f�噯96m�"��0��8��:#��Qf��9hm!S�t���x���M��hIf�S�=v'x������w�;1�ts�ԯO��,!�i����N[R�+�簞�ͣ��=QeZ6��6(��&��q�sA��H��>Mt�ܽ�H\�n{��,`��B�����yJ�y�D�oo�{�&M�9�Qŋ���l�7Ă��o����|/��T�~"繴 H��4���a���^�3L�)����dL��w�)��$��2��n|G4��XZ�@���oS�z7�DCD#����%#��	��$B������!�Oz7�H@Md4�s ���V���d<F��T���!E��@)����ؿ2�͈����9����.�?5k(��)�G�7��;����⟿=1�����u�g�$r������!Ѩ�A�H"
;����'/ �lV�����ۨ�!Nq��)$~���cpE^�M0��z#�G�r�f����E��d9ྍs��^L�X�4 �!��F�W��F��8(bF	8�\���@� ����L�k���y���n�f��Ïѫ�;�7��>���y�������$E��c���o�I�������%ԓ
����yzʟ8�b(����㷢��c�)�yI�_��{A�@�幈���F勜���^���2�� �#��	T`�|τ|q� ��Q.���_����H] ��<IL	\J��k<��EH8��f���UD���"��@�鬀Q8�������"�R07(���&a�$�4�������פ�Ͽ7�� }�� �^X�\H����3�����,���Y��8j2��pJA.�Y
�d�'�� �-H�U�����K@�J��N3���߂g.%�{�'_�	J)+q�(J����k!d�� �sD��A}/ئ��'��ڰ��^�)zN�7�Or�	�O�1pza!�=Ƀ� ~O�p<��C��0E�&�6�e�I���AJ�x	�
9@J�����������R6         �  x��X]��+{>�FHH�2/���/a�ݹ��>R�8.H۩;NH7nR���2��i�ݧ�?�9��[����Ц�6��dL���i��X��MJmN��t��ku}C2^���v)O[}������+h��;�>�g�-究���Kf�w��>�n�!]��q(�N���Զdq�f�3ސ�k��-{:7O��mǸW��N(o_I�h��6�84k��h�;�!�K6X0�E���w>Ȧ)�u]~���e� !��@��|n��u��N:P�Q��1^�͚IF�l���w�G�C�̨S8>2[�Ht1#)��8oH�t֜�i����[ľM�*9|ҟ{'FLh���Ku�@/���H�P%W��^��N�m�a��c�$fyd���h�Hxǡ��;�.&�Ȃ�7�&h`j6W��h|��K�uZ��.jv��S��߹}�$ǘ�X�������?�Q�Ƭ���1Ͽ�1{݋��U�	��u`J��������jZS�t��O��C��H�	�n��V�q �oH��W�.�҂�qS����c̢�ˡ�	�-x�����y��fԣ�����{��!6ìh���m���Ѥ�>t��H��yn���~���Z���p��?�Bo@o��I��<�;P�v��,!bY�K�Ck�:>���tV��>�`�q�O*�:%�ߐ�z�v�q7SJ�Lx�ޟ��� *ŨݎYoHO,x�x�	�q�v�ж��HK=<;���*%�����;�����!�{�}C��Xܭm�ϥ.&x.i[7~��f=f�=!��F�g���\_�(���e�������W�'���(6u�`���u:`A`J@/��QK磛C��1h檎L8��pÜ�{�BwRN�>�C��2B����|�}�Ӊ���}�|wr�ɽA!ؓ���⾆���տ�a8t5^6���U%blW�v
����K�1d���>9�A����i_e��nh ��c�x��՗��\��ς�����Uj����/LUW@�l}lU�hl{us����(w��"@À�"t�;?Νaܲ
�\�6��}�"�n�����C���
8�_vŸah���{�׽H�۝���z�G� }׀����CT��Ǯ�� ����W�BcK��ߐ&-�'X~O��0�D�.#��2�G$C����:	�\*N!�ot�������(f}���؆K�o��!��X������;dm�Y��C�7m����y���| !�xD�w�`e��X�����:@E�7$l���N�Yd�Ygh&��#a<!�ow�6V�O��T��g�o��7$�b�$�R�0��`��Ĳ���k���m�Է#�%�<�ݵ�oH��Կ���`��50߷,��R}��X�e�(�XZy����;����\k���m��c$�~�1U�	�aت' ���PVӇ����<J|d~�4q�0���C���uöҕ��~�D��'��8^_�>�{�0+�k��ߗ_�Q�ݰ�L⻖g�9�F�b`��wf���O�b=j��-�)6! !�6`� A�8�9~Q삙ѿ��h��K�`W�k�nu�{������|� �Ob��?N0s )!��r&��	
�� �w��^���NOHOwzi��^�o�~�#��?ŧ����fӄe�����X��!�}HX�TF�sz���ƟBo���AC}���#���]��S�;}A�R>�����+���!��������?���         J  x��ҹr�@ �Zz��ƻ˞�q���E�u��=@ ����{p�"jR�����7�J�P�� �j�pcBfA�^�L�i���YLB�	 !�q�C���L�bLT)�$����qT�!h�7�F��n��bq�w��O?ǩo9�[O�)���Y��0/Z�K���Yf�y���N��KRW-wѱ�X���.{ݺ�o�B�e�aL�E��ԋ�����Bǿ+��q�_U:R��e��������HQ�
�ς*�9��jI7�<.�]59Ӊ1("�)��8�VI�e%�B��,P�
�,QH�q���a��%H")�Y�	�B�[Yϐ�����]ڍ{sv1}��KQ�8�%Ͼ��~�����<:-�t�l�lU&����^�Hoyȯ�]�-���n���[�Ǆ���坑7	���:i�_.���W��A��"(�<!
y�cod!�ZC	���
4�~�R����W�!D`�oe�IJ�ҝS�������G��h&]x����c3:ML9%���1�Hǝ�졽�g����Λ�x�'k����_����\��=�f{��X�O_.��^�� �@l            x��]�rZI��}�)� F����!��*@v��D(r�iKB���r?��$�p7���f��[�����~N&����ٍ��|���;u?v8����:_|	��-��j����8�O�������qk:���_:�y��߮�
��`����A�/�)���.�?�{��q!�D�H���*���JF���bY�E0�aj�Uxs����������A�;����������r<:�O���|B�t�N�߽��'X�ݨ��U���&�i�~Ը+��;#�����?�=�G,� c\pN���3oI���8�?^��C��Y,$a\Ѡ��c��Jr�Y$�O�*pK�.ܛ=��iZ%J�`�iA7�Q��U� �X0��f������*�7�Uè����%,��t<x��O�4M+���������d:^r,l��ͯ�oVc[����Q��%M�и`�(qO��4�r�P"cT����aR,��&�&���iIp�Sښ�������o��z�ykV#�N�'�<������ӊt����	�8)�&�N��
�*,3JQL{]��������t��^����-�]�FÓ���э�
�2u�'.�.Ħ�'a�D	Ғ9����L�[�'N58�{���a�-���޸,%Һ����H�������6*8�� |�i�����J�_���ߵ��a�㕚�<|���#���ڔ!#e0`x	�2�J{*D�����V��[����[���Y�פЛ�c(�����j�,s�9���í7%���7��QO(=B�(
^I%E�b]`�i	����ۀ�.���`!@a ����I�>i�?:�v�������#�'�΢`*B�:x.��H"A�p,D̈��w/�.'���bҼ��{P<�2�]�H1�B]��}n	��Im$�F�t0�P������'5��� �Ŷ.bb�R�`8�$b��e$��(���0��q1�Ƽ����A��.y���p8�je�ĩ������D����#ǌ#]l��K������N��|�1͵��lH}�htrr:�/�X�Ǳ�`���/f�f��c����o��fvs�NS�a �|��4���#ٌ���#:���I�
@}C�i�k�P�PpT;c�:���$N�xU;S9ps����DSt8�f�!I���Dq�I�����b�gձ�߶�yE�귍��ڽӚ�KtG,ʟc�C��a�ׄFJ
.j�z��r^�� ��X �h����E����^��r?�#k�G��6Qc�gHi����t�����"����ޏG�U�g��R�-��`X�zX�|ʞV[��{�?{�O>*?}�~���Y��ӭ�m<����k����=�I���9G�OIn.�2�R�$�HX��)!�6=ퟝ�v�w|kX����Iot�|R��������&@c<�x�58�T;�.��@�!-��zD��N&�QYG0"Ұ(���((cAi�,5�q�������z��uOߏƃ釳M�6k/�A�ӛu䚇�����e$���"��.t��◰��~[�ܹ5�{\|�2��g�o_��쪎c���)uD���,K�Ô�qC9�L��h�ƃe���_��.�=�������t���\d��>��n��5��p���f� x�vG���8a��ZP�4�!K@�}�S����Aa ��c�?���#����5�Q�.H�O��Qj��6�q����L��!���zˍ��͆�pw����r+W7��W�����QH$00buB<ý�ɽ7T��"��������,~?6�f��6c����S�Pp���X3��(ݽ������$5C�w�d���~���� Y<�6�'��q���Q)�"E���;l�!���e�Q�{��L�
"6Y�*��LqRT؀�!:a�tl��n|���,���1?�"��Ywp�I��եz4��7=��5�ʕ�>�RUA�r�Q�H���TA��6&U�����8Q;��"�`J�W^ 9���W�my5�:'���m�B7��z�ϖ��xٽPө�J�&�G�.��<���v�V����� �=�;6&U�D�������fB��Y����Sd�q�[�|�5)�g�("��f��u�\IFR��'Y���r�W#
6_���"�	K����n<������<��D�1���&�=���mgp��n�3n`<�*�� C�!Z
V�,��+�h�p6b'�(��[�pi`�����֨枿v����6�����*�d��/7��6�5w����F`��:���3 ù� LV��	
Ӹ4�� !!pÔ�Z�yV!1@MN���Zi��|�ۚ����hz^i���5��R�6�Wՙ�6A��%Y�5g^ ���{�#���%1j/6���Gݫ�GjJ}�Q�0�fa���v&rA��6*��/E���j1[���*���y������¸�P|���1�ٷ�ɗ�)ZP���dP��#��{���*0���-?�Oz��yj��$:?�{�ONG�붭b��t��+T%��-�(BR�_â����E��fy<��N���u vDL!c0�� �'V5X��۫�k�	)�ڹ{���/+���z���76|;���_�&
T�">"lt�I�"hLD$.HD���yU�!@}�>
:_��Nz��d?����"#��!�ш�#���0��TʢE�2����r�=�gaO^�j�~/O�.� ���ETF���`.�E��,bƈ�QbY�ڶ�[G]Ʋ�I��Q,!�i !&05�� b�3��0�@\!�'�$�$��i G�g�5fJh��M(�m�%��E$��r������
"v�������ޘ��Ǆ�p��b{=0ɭH��:���y�BA,��PF
�U 5�)b��`��w�D�����r�ey��Y�K�I_�����uI��=\;\�1^�nR}��n$<i���h�2gV��W�!��<F,bR�R�[;�O��Aܣ��R<n�y�xE*����%_�{�b^)D1�k�ګu�o��i)�k�Z��烚����=��0����4�]�"�`Y�@��c�.j���l����?������
��9�%����	m�%��2�'f�w�$C$ �r"p�Ձ;�Yk�ُZ��W/�S$xxLfUc�\D�i��A�O�2��q�!\���w��&g��6Nq킰^��s�r�E��W��K6V�_d�f��p�l�*�$��,s Sgx|�C,��X+�u�t��͆3ߙ�Z{M���/��d�t�5�����Ͽ��ε�^y����鼀nR�)E|�$Jp�7�:'���e���aZ���<��`����JY	-�������c-����[�g�wʟ�G�ۮ��bϜ����m��eM�;��h�YV��pb�V�К+V�<��
�j��{M����#$��\�TqO.�S�o�bǝ@�*��t���M�
��Cy�	�"-�ڣ4�^	�DT���3G�aι�t�1I����Z�U]��n�d�
�&Қ��j(�Z��g.=�4��0�//Q�Nik���[郩�j|�y�������%(5$`�4�����9�y�Vs�"0��"����u4$�ݐyA)o�La5ɔD�� �<K�z��J;�4F�E#�AAg� W�����C�4PJ�^������6���el��d�v�N����y�b~ܙvߝ�_m׈�Z��KE��~��v���r`9���KϸbϲL�c��>,A�z5�$\<˅:�E9��v� u�����J�$�E���?^|��t��h8}?��0z�.���ӝ�ߓF~Ycg�Fe�9�%��`�`�\�u��G3e\:��@�<s�gJ�@��P�]��:�8���5\-
����o�w��c�@,G.��~��Օ++��	���6�mi��K���Z5�Dv�K����~���oc���J�g)3�u^��E�,��{�F@tM3�d�������r:�}�O���:?��i[��`��%ʸ�d<L���>?��+2��c�V�������j�ф"]�߲��H� �
  f�I��ZJ���p�^������Q��m�0>��-HY i.��������
������3�-)@�"�_�1�-���yn�3�ʐ5���ǋ�`����Ie���q�qm��9���!^�n�u��#-��iן�Xb����� T�~Y���Ӂ+�8�Z�b��P��A��=2i�{�u4íޠ��������l1o�ﰚ*G"^�&�0�A�ͭc1`-�Rr�� GE����b ��e�7]��o�o�����3�e���L#M�J�a�EN2� \ J�C����%��K�9U|��������Od���|��e�9���z�ͩ���F�����J��nS8^OCr���S���L����{F��	*$��g��H촖�l޶��.�Fg�J�q���a,S�ٕ	�>����̇���|o#I�8�
$�2��Вb���S�ڨU �D�!����-Ә�u��R�.�?��f:��)
�I4N-�w_fW_�M+I�>;Ds�!Y��$�u�<�C9B�x��5�1.;,^��ޢC���%���UJ"s�-A2��-�$3,������WuU����~�Z��*O���{V�'�J>4_��T���k��4!wb�Q�T&Z������8& �F����o�6`sI4��}4)��,xʎiB+c���������?9�&\Vg�.�vOi5�����J���.���5�w2�O �l�0J֦'����\�dNP��cn�s�c+�w`]��ʕ�.�e(�SK�`��͗�7�3�`Wy�(Ѫ�$N'�'2sR���� �ZDH#�(5��
����l�L��kuLwE����"^1�����ɺeSN�6���Mf�*�X� `+<h��,i�)�N����:e[�u�9� ^
��Y�;76����<aF�'�Fq������Mɿ
����uv�є��</])o���P���^X�S��)���{���4?f��uS����Kf��ǃ��Kf6^3���h��+���b�͗�N�A
a]H��R�5�ʄ�h<*r'<w�I�K�t�5���{ϏS�z�����C�,�կ��]���n��w`��q����#�Zy�»�ˮ���:�� C(%`��7��`��"qA�9����bm�;����w�`���]d�+��t����	���(k[�J9ѝ���������[�l�DDq�#0�@���	�
��x�w��HJ��C���c��Vp���
3�SS{�Di�o���q�Uo��v���X��T�5�<̵��}2zZ!�+������ᵅ�c��qAe'0���
-A%e"��Z��N*� �X�]�X3 [�����/���VlNJgiA:��?Z�w9k�R�kT�E)e�P��q�-��Q�8������02(2�6k(��h&t#1�J�ۖ�`RaQ]��"%�!ӆ���J!Q�M$aQ[Y�W8�U�	��� �llġ��h��S��\c���(䉌&#Oq���h˩j���8�$���LmL?g��'g_��8�W"���
4K��P��Y��{��[��<�Z{W#�_��Lgۯ��6� �����Y̚����Fa���d.<��a1ckEN#6�8D&R[%�v��Oe�V���0�>~?�?�M䐋���|}��ҙ�P���a�O�����S�ONU�L>��_qk�n�G\c\#�>��$�`"8cɎ��R�D�;mλ� #��>����Xw|���}>?��ه�ht:�h�Y�������V�����9I�A���;Wsg�f�4���Mg)CÕRm W^ xl��kA�W���L�[%Ig�*��李z���l|��FQ;�n+�*a�Y̯B�b�u�|�Rp`�.��Z���p�<�.�/���5��Ck*3GSC9f��Yu���Z�i���h����H��@ɖ���h��-�F�22ݪx�`�9=^�#�E�@�X)�|�hx@3#���O�դ����z�$�V]�r8ɒa 9?UKqj�46���"��Cm���;�Z��G47�'K�K���W����T|멫_J>��&�͓�h���1M%'�n��)H5	�Y��\
�*d�I�m��~co*��7���Xb��q�K<�ҰD(�D#��@����:��`*�<b���Z�jK�u���`��P��U���K|��m��B���:�]F*�O�J��L��q�Z�tP��,IS����v������UnP��?�����MU<��Xd�Ե�"5!�0���yxC�?�y�RK�Z򈌌�y#jqnvG���Q�5�s,lg^M_�zrޒ�|�r��\�j��l���8Uuw��Ȅ�B@����'��|H]�E���#�&m��\�>I��')���&'���;W��}�N��ҬC��\T�8��(tV�A�{�B��ȴ��	�L��Tp-S��h�씼�<��c)ՠ�	-�M�s�$0�ΈLkE'@|�z����4FM7��ޤ�k��/o�;t4��\.=R코a���BX��㞂��?����+o��6dw%QO,�H���Q"k�D�Rl�#�r6�"d��|�����i��$�7C���"}M�fO<�C�bT^NM�Jj��wj

��^��~ߴ;�[��L,���\_u��c�3��0[v��YX�� O�T��,��H�#��͌"Nh� �v�J��h}���|�DsG�jV�3k�g�|j�§j��(8GL��ĸ�Z�g+gU��l���e��Ӵ䖈��5��z��/�O/�;;���-/���ϣ~���=c            x�3�L��".Cd�!����� �p�      l   �  x�UR��0����*����?��L=U���U����ml�6~�_���E}�����:���C�e����_4��3��HX��&A,��4v.{��=�#+�R�e� V�#KQs�'t����t,N����`���h�[��`$X����EB����#���՘�J�`�����S�k�Ý��xkw�D���x�968�X�*Ĉ�� |N���΂���ѲV�C7�n'�A�vl:��m'_�練o/��t�ci3���Y�R�Y��j��a^�b��	>�g�˛}==O�h�@���;<��s�:��O��eQ��ҍ�O7���������[} 5��=��
���,:n���D��q�`��ZK�b���D�x=�T��1�qA�9 ��"e�D�9e���w�x��W	<�����k�L�5��=�� K4@�8N�Ԅ�_^__� �.�            x������ � �      `      x������ � �      a      x������ � �      n      x������ � �      b      x������ � �      c      x������ � �      d      x������ � �      e      x������ � �      6      x������ � �      h      x������ � �      P      x������ � �      O      x������ � �      7      x������ � �      8      x������ � �      =      x������ � �      >      x������ � �      N      x������ � �          |  x��ZMs9r<����_����}�y#&P���(S�8֎��N<R)Qd�G!=����BUVf����E��T�T?����9�������˼�����~�߇����=�ŗ?//������������&�5�<4Q��9
ik��P\l�����ӟ��//�%�1j����T�qz�=tS�ܧ��rzg���>�yy�zy�F�4MmX�R�{�ESr��������e����.��[q��n�n���ӽ��n~芀�8�2s��(��a\I�+eH(���?n�����׻�B�^�+��V&y��r�2S��|S� ����<�~�l�^T�O�D�4��c���\U��3������.�}�=FR�����Aݸ�s�|*j��3l�]h�z�4D|d���E����Bzg������}����������m����D6��m��\B���4�T4���������~s������ݍ6:0����8�z�2jI:fa7'?�O�O��|��z� �������B����_,��=����68�������^�Фu��A���9pO��r�еG�FU��R&UK#���~���_,��:�A::���@�5
��j<	ﵺ�巶�:����ٕ�ֶWjM�MDyD���j��w�i��:�e' ��@݁9gQ�Ct�e���_��_����b�xV�J𔛠��*��w76K:C<��z^,�ۡ�RS�f}e�p$�q����v��ϕ��=�v�����p�<�X(�J�5ס�CV����ۯ���=�N���݄����
4�U�!i��x�	%t��]�� ϊc�{�#����;o>�c�{\}w�z+r(�&��vW�C��k��R��q�Mp��T����/׻ G�ҥdl-*"��Qk4
Cɺ���	 }����/?�|xw,g�[-�z{�̉ &�k���G�-��ZI��Ib`�dmu�(��f	02�5㡫���3X���\%b�i�d��1l�^~rf�s"נ���q�����;S?�9�����Y�60ظ��|�����z��m8Bb@{��@��B� W:6T�$�Vl�b���W�&[�>�@�<4��pMӰ��¦�P.�����gw���'ç&�dR�`U�y��G�i5���K�#��h��82�O\�i��^�A�yɣ��Lf����uHb�P��$�DG�)S�ez�Tu�3�~in�+ZƆ�/`����j j9W +g��in��p
�=>��i(Vq^����j�g��p�G!C�Mk�Gi8�pH`Y4�Y2[�*����p�T�l�Z��1��Lpm��>wc���<E�`��b�v�ܠ2�Zj����?��k��m��v��J:�q�B�u-x����,/y�˕���5S��"$	�B�<���S�1W��n?'I��\���)�^Q/ъ��FC�L�47�`��D���6@��biFa��A��V=CB4�Ke�v^#���Jn���6)ό�/������P�߿~v�Z��;��J�����Jp�r���F���g����G~y������	a���2�:��29x8��e:uh2�8�Ⴘv�^�\���@v�ۗ��;�S¢�=E��A{��|N�%� +o@Xj-���y<��1q}�KL�'t��	��]4Qv{���Tۓϥ"5ܚ���  95�G�h���w�aG���k����Iz��yv��w5ݑy���E��P��k ߖZ���]�0��9x��aGas�5U�z��q�D��2`�]nb�Ĩ�����H���SN0bZ�I�AZ}7�n��G6ب(:h�%�0�r$�����e�>6�2�1B=�`�e|nM�4Ȗ�]�z.6&�G�$m=�,��&�#���/�h��]��M�B�A4T�ꆔ����h�1����x�*�0����th��MFikܓD��H�S�ޚ0g�9p���% ��:�i��G]�(���5a<L9���i���y�.�	�D\��}��Q�;�G1�����i@��pMI4�CC��'"��<?��V�z]T�O]��2N��vo��J��!��m 9֨�J4W}@�ʛX�����1� �7�Br��$�5?�.6���M��J�ǇA�-N�k���P�K�dzs!���$I:�#b��g�f����3�{�C��N'�M�o����]i��q�3x Rp\��)z�ǹl"|s���p�A*�̯vTX����'�����nF�b���>v�l9B���&#���&��1���k��$��U�B�~�3
���9���v�^y"~ά� ,��.#ئ��t�����zjo_;�G�[�af�-�A1@���x�c��X	��{�Y�#��hM��A�5��U
�x��՝��_H�3Uz�̔vTuAz�2�R��}콏��9@�J9����:u���:K�]]��tvߔ�s��ŭ�)����h�l@<��+�MS~�p���.K�+���d���Fw�/�>:fI-v0��d�Z"��D���|�_�'�N�byb/Њ�	��:��2��9�E�86��a=���:�T5�\ZH����wl�.����<�:e��&"ǆ��N��]���W0��]�����
Y��z�a��]���m3|��@g~8b���tYrv��8��7&���y�G½%�I��!��[g�w���4g�ۀ�Y���T�i�V5������~�Ɋ}��}��sd`�ٱ���Ҭ��!z�D���h��5�8�A�q]��*u���Rp���3w��Ω�>F���RK�sk�Bfn4씛?��:����hOp�W�'a��Μ�dxþ;j9rsxj��|�,�IKpA�8����%�����d
]�~׾��'�G��6[|� �{�]x�������h��e      <   #   x�33/4��44�3�3Rf&&�ff&\1z\\\ \��      M      x������ � �      L      x������ � �      Z   �   x���Kn�0D�p
/�H��?mc�-�,��M{��!���Yd[z�ҫ�"�40��6�ZY�F�0j��iUE����*�!Na�Wq[ô�C,�~�R�<�P�L9l<����v�E,���'�
����֟_����$%A9V��i���N�[$U��}�2�+�Ǳp��SG����HK����c��� �5���	���;)��bc���O��SK	>�䤉�"ω���_���J��      4   �	  x��YKr[�\?��(G�?K���7>�6U���A�����٤d�Ò�7��ήOfVÚ�G��}���R+����4�E�v�(�l�<��8H/���v9��G��_������Gy~2���n���jF�%S�s��M���Ȍ�}���M���)y)��2q%�Zf-:%��z9������=������h��e��l~r�NM?_V2a�@#��Kp��Gv={�ұ�TG-�ǡ}���T��|:ݝ����^Oi=��ޮ�T|�Tg�i�5�B�;��w����ٜ1u�R�I"��,�g�e�����������5�W<�>���0R�÷�)�(�\H\��4�,�¼}<~��{��>k�����ݠV�P�:��ko��q$��)��8fj�S��P�	�A���Ғd�����|Obn�=E.�E٨�6�K��$9��}�1!e2��'�\$&h*�J)�3��o��y�q>��!�Ѭ���P��a(Ң�x7l�R���>=_�CO��#	�A#	�7����)[�~3y<>����r�d`XLC% 2�,&�i�h��|'>��U�V�q4�u�G���x}�u��"X��P�>ao$ã j��ךG���]�v<���Ue�G6a:�������y��F���l��1jDc�Q)R�[7������R1����"G�^̐ c��JR�Zq�w�}����x�q��Es!�L5_�]�'i=Wo^��C5(EFj ?%�ς��4|���+��Ov=Σ�wB2D�O�F6�]"(�*�K��>��c\���>?�þ]sc�\񨳐���JF݇���C0]#�Z��w��R�>o��%�����&��l�k%Olo0*=$�XrC����Y*�8��A8���a(�P2l_����ތ�Q?��"�t�����D�ϻ�R����t��������W���2'��bJ�0���1sf���<��fL�
�dF�ʆ$��Q;oz:��i�ץo�b2���"5q���2��2׳�Z7~�@�y9}�6�}YD��(� 鄦5���-PM��
�V�Ƨ��7P���r=~<���<����?`q�#���m��Ny��ѳ��00{h<V�`�Y"�0�&�}Htz�q���3�B:�����U�ŏ�c��p����}X�{�q�8 u�l���7��.��1�VZ(���Ag�r˱[`��0j���U�mR�D�(���0�'u��!P,h@���aM<��D��R�[�d��k������#��x9���|�J�!���iu�_�`�\C�ʔ�kO�0i�1匄$������h�X���<~_doF���h�yq|Au���G�At�?��ݟ����<:�)�Wsc��	%F�L����?��C��Ձό�}�*\XTGƦ@*P�\+�w`�ni�S�r��iN"ز����. �a����h��4�à�QK�mL2x����=�h M6�ɣ{�?ć������sV,!{��Ź��u���$�0`VJ�!�iRJtώ�{N��Q�o5��X<�IM&r��'G�Tb�p�p���R�Ķ&�ӊ?�G�� �ͦp�%P�lZ��=��#"R�)x�1I`�f4Ji�8���La4c�����f�["�=���R�4���5���@vA��{���S���)7��~�r�م$0i�W�
��"X�ʰ!#T�CXl�m���I\���B��V1Z
a�C��P��ۺKج�
�5'�����%ԓ�1�����#��z�Ơf�J�PgȌ7Đ�$�&��]C���}�.�va NF�+��Tx�$�p�DL�|���P�`�F�JaO4�za�RHV���v���.X�@"�0�S�N���
-������]�a�n+�0�vQ`�#0J��:��k�] DʈZYs�+�.�|0814%&����](�҂�$a #f�<*E��Y�����=wa���`�BU֭��+i�e6�.S�:��ľ,�(�\x\�38��*
b.DL�~��ª���Pڗ���#ko�I����~��We���Is��E�Ղj��c*�Ft7� �/~��01���c�)$D�ZЖ�Q�|���.�YB��׀����%	���Zo�m��R>9�C&k���H����6Zl9����xآu	�z�Y�e�!88����
À#bo�������b8y��O�����uWe��ܱ�\����Fx�xO8�iΆ@ed�7�4�O��6��0}ǉ�%b�� Ks)�"h��.Ɨ�T-�VѥE`x"^1j� ��^���F�Ȟ�x���S����ZG|Jk�>d�\���s�#� ��*�K�PuLh�n�)9x	�t����!F��KC��_B�(�p+)�H{�ݟE���n
�")uD�P(���08�������O�)؋�ß�ÿ�$��      5   }  x���Mo#�����ȵ���8ڧ��C�@��5c�Hj�M����l��=�w|YhI<]�w���z�[(����Gi���)8��)k�vR�n����vm�é��n�_�����!��\��� O�v��ۭa��C�o�L����;�N<���������<��z>���k{:�܎�����ddvd�O�L.�cqݻҳu=������aď�z(����f?_^���z�_��Q'���"��
�H��Ru�V%oL_<Q<��b�%�-z2�tʹF�NH���Mn�`?���'Vh9�qۋ_�����r8~{���|"C�x"��ޒ2U���Q�R(V+Ռt)m��p+�_(���!���k;�	�+;��E�΋��B&�J��LZ��ǰ!4��j=��Ҹ���88Pz��wRC�X�n���ҾY2E)�IW�1����6��!�t(��B�B��@�}.�T���ʹ�n�����d�mM�$�.>d#Z݌+>�#�q�ˠ��!���z�\Z}������c�]O�Db'�y-��J(9�sN�����7��^��p���r��@�]�4����![mQ�D��{�~���x'Em�;��v ����.�Ylz�u��(����<�@����4a�0�u��;��b �+���Զ4���|=��4�M/4���ƻ<�iq+k~)t�� 1�%�<�@M��M�fKc��N�]�$�-/%����;�+�`+霕F��HǙ����O�b�EW_Et[y3�����sM��7���`p����y��!�Xg�T��woi�E y�񆬶�x[c�[3��s>��\ʌ�^Ȍ����<S�➋>(A�Nu������J��I�j�q��F�廰��ð�;�)��X��j�q
�^s��V�Vc4��u�-�*�֑���N��p�;���/O�`pt*����t�t2��+SYW�����]�i;�ԂJ�"c��0 �����n&Æ�3G3�w>�j��o\�[��^qbmJ���n�i�v�pʆ����?��V�:�,t���θ��_u|&8������i�x͹��5�m"N�?6/����	����S�۝\O�}��S�o����r����1^��[:>�s]n�O�����g�_o�֖����Ow8��Ixi_�����Ow��E~�^��ݓ���G�����\���5�����+����3�)?����B7���^?���=[��r$�+�/'ȋ`�8))yWI����u��3���N܍��$�N'a�?Dn��(+[h�l8F���(yŨ�'���ۤ0�d���x;|M�7�0!������� �/-_�?�����`��rK�m	���XM/�4�d�
���KL�BA�@(�ڨNB�K���.���՟�[��v�=���gE�5%I>VCF�@�;MBU[�l�s���p��bU��@����\`��_��e�f��A�3�([�G�r�&a��̄���ĭ-$������r~{�4m!l�%�*�VIN4�KS/�1$�K6�xW}��d��M��5�0O�������A�ዘ=^z��+܉DHd-�k���WK�.�P��6��I�@+h�a���Q����<�"�J����{�)M��s\jNg!VUU��?��P+��ׁ`� �JG��~��B��p]���"�Te@e�\Ro���
}��wc����h냽���QVrD�=G��)3Rs�
�W*A���}��oEpߨ�p�� �� {=�� x<ׅ��4yC1e�ZR����!ە*�MV[�O |-]�m/����Ҙ˟�%�Y�L��v��B4���$���;��;��~�.��xB�Q��]n908�rx�m!�JT��ˊ�I�����A)�d���V� �ói��2���(����#(B�d��:o:-s"���T�!i]T��0��/�o�M�,�a�ð�à	�kA�k.�8�1y*褦�[!^	Y��r��!n5h!��	4�J��>�Y}6��Z�i�wMpS.�,Or�j�I&GBA��D�}G$А+��S��i�9�����ȳ3II٧@���{�`�}��N{�uڇ���b
SÎb�	OB���(V����w��^�}�����].�_@"��4�ʦ�U)]35�TJ�r5/�
�R�[G���:⶗qG����N�!�zלD��Q򊗃k�'��bM�9���_���۾{C����k �rbW&�W-q��ѷI�.NPt��W���ci~sb#�J�)nz9�ap4��x<���҆j��f
�X2�
Z
*�Ѭ
9m�� �J�)n��j
����xށ�pk�d]���*��h�������Z�n���Z�p�w�d(8l'���2 \�u���KC�:?= .C��T�I\Bi#�V��6��Ɨu��}>�K�\� �e}S�RV�QՖ���t�7��Y��r�r�7�����q{<�iq+��!Eݣ#�����#��Q�������G'r0<^A.ɚ���r'cc��U�TnB7�7�?!��g��\}08Z};�/=[��9�tS�8�/w͹T���H��ȏo�D�W��Ɨ��08:�@���T]��\OE�H�~29s5�y��"R�շ������wSq��mG����5`�]�ӲW�����3��t!�8�K�}�ٜ�>���[^NhM��'3��ܓ�)e��x��.RhFp嫊ѭ�T��a@�j�=n|ySG7%w��贇Е<_�%��|"#�&N�e�B:X�җ��;}��`_24�F����}ɸ�"7��qӣ2��/ٗ�m��\�<#�����8r�F/d��K��q^�[^�����d���C[���M�5k�f:����![2Y������V��������.�gJA�X)����"��ɫ�N5C%ڐ[w�8����0ls��Q��N��M��y}��p�UO�>k̐ ���-�.��ݦ/h�a��Q���<�"�X�>=>>��ʚ�      !   �  x����n\1�מw�o˨��E�E�Eـ�W�J��U�Lz��Et|l�0���Y\�5UL�x,Ϗo�v���[�u�߾��_��>���W���{ߙ�ei^�H2MB&���vf��.|q������]N����46O�u�Z��L���\�"}KKG���p�82�Y�*6��1M�ShpG�����w�m�4,+]m5q .dv����v�n�Ή���k�J��u
���r�G�A7IḞ��j�gM�*�v0Y��z�Ɯ�*&��ԬD\Y�b��%s%Gc~����O��ο���������&�s�Psl�^	��&܍�����O��9Hh �y�`͞�V�#�d,L��xm�-�G�=�i���|8�F��9p��\E�"�J%���å�W����N����k�Tq1pA��Bm���(y�5`3?�c� �T�,Qu�A���s7��a�:f������t�	�5�@      "   �  x��VMo�6=�~��KNN{�ǀ�Iv��ש�m�E@Q#�E�$�X(��w$Yч��c�7��ސ�yo�'G�g�i�uF�0 �h���%g4�C(��	��6��YO5�v��q��0)t�R�y���t��K�*��a�������n6�|�|��7� �yI��V�s��{�םl�
�H�_֥�7P�A�s�^�����QI�8<[���u'�.�8\R���b�,:�i~ʜ�m���qٿ�m�����ȹ�aB[���KEa�9�/�#\��
��<�	dd�Q��0)���� R�/u�ٶ��	D�/���\1р���g\�� Ȫ]��B���S�9��.�d7��nȒP�����e��'������2r���_ �\��l��.�t('Zߜ����Jvl��p�C"�9p���#~h�����[	b�$#��سu���/z�W��<��AkTÔl�I�;A^�Q+:�]^��>��A�.t,́��0��lZ�Щ��f-���_�]��l�?ֵ�{6�h�n���}h��+��L\*_��H���h��E`JVb�ܳs�{�48��A84���!��8qgH�f����׌\$<���ƴ۹@掦���N��CR�j�k��|9hV������i[$5�R� >� EP�㑋�j�g�m�|C5P�H�$2��-l�1��vU��x�ӯ&83Ԇ�upi=�3B����N4iMO~�@T���(k�.�D=��,�Ztd�� 8r7'��Q�
�2GMG�@����g�Ol�݂)	]'F=�=4o��E>m���

C4��.��+��7��v��d�;T��V,}�k��#���R��>��-	�:��
Z���#2���$�(�lմ�ߦ��$��(s�GB}�&B O>`l*��8*B;)�n�����ߡg��ơ���%�A-����3�8�'�������b��Њ0������(���0�}f�r	�=�O>����}��J�-f�?�,��H�@�      R      x������ � �      ;      x������ � �      #   -   x��M,.I-��J�/.���OO��K�r�/JJM��E����� �'?      s      x������ � �      $   /   x�+H,..�/J�,�1J�07��$��� ��s~QjPjbN.W� 1Q�      %      x������ � �      9      x������ � �      &     x�}��n�@Dk�S0ڃ{0m� u�p �
,���.�rǂ3�7���WoPY��TsP(qe�H���x=�˙��]V�~.��2'ZJk�I u�8|�����G�����.���ok��ԡ
ABπ�p�^��.��i�1I�H	��mX�d�Y��z5����]��m����K���MT�	��^Sw���� yΒIGIV�IhZ��:����Z
^�x�x#��Fa�%uI�S�N����,림���v�$�^S-��D	�s8{T�i���y�_=��      K      x������ � �      J   t  x��T�nZA|>�+�W�]��R!���R%��
	8U���6@I�j�ֲ���*Mhtʠ��@9��#T�⬯�(l�������Ct�<�͢��Wa�lVa�+�f���$����J��H� 1	T�Ϣ� km&7��p>��oGw���[�қl��X���/	[_���YH������	JD�1����oG����l<�4�n]_���;�N����u�!&a�P$� _Q���3U����xz�g���~�6��ߩ
[�E�$��{eD�
$�ً��o�~���u��n��E��6�C�����9�Ԭ�Z$yg�<j�t0
 c0i-tPXum�G���l��.&�	��zw�B'ЮDlS�!�q��:! �@U���.[EM.���!�n��57�k��t=�t�h��]	�B����j���2I)�S1�+`�mʴ���P�SV�P*@�3C�* �,�b���C��^#ɐ�Mw4��\t���EWx�o*���94��maHlJ�мR�5�`]$_�{^���P�'�����B9i���p��y�o9��{)loULF���Ǯ� K�e�j��:��o}5��@Yɚ�\�a��r���s�9����]۶?V{��      p      x������ � �      \      x������ � �      [      x������ � �      V   O   x�-ʻ�0 �:삏��.6��	���x�5M�Y�n�h���<�ή����˅K��T7Z�c�f�.���� ��      o      x������ � �      Y   (  x���;n�0Dk�)t�P�TH� ۈ4�8�چ�E���6?�L�0f�G�2$N=�5�3$�m�����󴫧e��ݫ�cQ�K���罪�,��e�.�,�:W٪z��qnƱ�M�t�^k����x4�$Y� �Q�B��	���XvF�	b )4_o#`�T(!{��'�i�u\�+�����:�Rվ4-j��٤.�E�U�oՙ0f��g`���9�A
�hMZ�[d8xkȒiߜ@#�E��T�KI��'�1��Y�ǖ��"����p�·��ǻ���N��      W   �   x���1�0E��\�(q�6�����%v�	Q���(������9O0��#Bf$Ѐ\T$d��b�����f�u�Ԇ}{̺n6o��9�/3,סy��(tg`�b�BP�c�1LL��sF=sBh^����U#���4�H�N�	������%��Eb�&��c�g�rvν2�^E      X      x������ � �      q   N   x����0����*4ЋI�%8�{�za2�Vk`s(��#���Ν�Jw����U
��������=��z��      r   [   x�%�9�0����(�&����l0t��`�i֪.[&^K%�;G&�a$[��jK�(���c#I������y������?���i!|��|      '   H   x�ɱ� �:����K*D�!��D���b˸�b����<�4�Lc��m��w���jd:���>2�      ]      x������ � �      )      x������ � �      ?      x������ � �      m      x������ � �      *   �  x�}��n1���waAJ�(�{��\DJ�	�}��v���(������'���u�t,z�QQ�4��ӗc��q�Cg����d�����V�x����.ǘ�痃Z�ټ5S���x�A�wS��l�УW���Y6������v�Q#�K,Zs���K'���|]o���]����Ka6I�,{����}���c7&����[�\~;R�ZŶ����DL��)�?���.?�o���_�������9�@��7Y���
ƶ���a�ꎆ0fE���ۂ��"�l7ak�FW/� G��Z
e���{�?�����Ʒ��U�M�qe��aj�)`U"�7�.]u߽�k�0P�ښWos�,ԑ��e�/��x�T$��)��8�ךs8r^GF���xdm�I���t:�ܫ��      +      x������ � �      F      x������ � �      G      x������ � �      ,      x������ � �      Q      x������ � �      -      x������ � �      .     x�����!�ӹ0rً���2�M}e����#X���Wa��j.:3�|4j�e=���!]�){�����]`UrC̰�HwjZq�}g�o:�w)��`i�x����i�>�P�Z<��(*b^�:�ܽ$R�w���ѝI��1}���3ɱ���Ǆ.�������Ӝ��!��&Wvqn�J�B$���$.Q]�Ix�/.�uri/v{kzթI��;��|J��db�W�H<c��n�SK8&����qԙ�L��y��!��      /      x������ � �      :      x������ � �      (      x������ � �      0   u   x��;�  �9\�r��;g�bcP�H�T�fz9ZomP2�頌صE)�f��+P�jU:�:;�CgI��9b}�SN�-��2 ��y3�Zq�FcJ�ε�Ǿ_w��+|�!�?��$)     