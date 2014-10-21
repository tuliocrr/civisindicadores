PGDMP     "    *            	    r            indicadores    9.2.4    9.2.4 �   �
           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            �
           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            �
           1262    97938    indicadores    DATABASE     i   CREATE DATABASE indicadores WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C' LC_CTYPE = 'C';
    DROP DATABASE indicadores;
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            �
           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    6            �
           0    0    public    ACL     �   REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;
                  postgres    false    6                       3079    11995    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            �
           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    258            �            1259    97939    acao    TABLE       CREATE TABLE acao (
    id integer NOT NULL,
    titulo character varying(255),
    data_inicio_previsto date,
    data_fim_previsto date,
    concluido integer DEFAULT 0,
    data_conclusao date,
    status integer DEFAULT 1,
    observacao text,
    lembrete date,
    andamento character varying(255),
    responsavel_id integer,
    acao_id integer,
    supervisor_id integer,
    prioridade character varying(10),
    anomalia_id integer,
    objetivo_id integer,
    projeto_id integer,
    marco integer,
    ordem integer
);
    DROP TABLE public.acao;
       public         postgres    false    6            �            1259    97947    acao_id_seq    SEQUENCE     m   CREATE SEQUENCE acao_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.acao_id_seq;
       public       postgres    false    6    168            �
           0    0    acao_id_seq    SEQUENCE OWNED BY     -   ALTER SEQUENCE acao_id_seq OWNED BY acao.id;
            public       postgres    false    169            �            1259    97949    acao_plano_acao    TABLE     j   CREATE TABLE acao_plano_acao (
    id integer NOT NULL,
    plano_acao_id integer,
    acao_id integer
);
 #   DROP TABLE public.acao_plano_acao;
       public         postgres    false    6            �            1259    97952    acao_plano_acao_id_seq    SEQUENCE     x   CREATE SEQUENCE acao_plano_acao_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.acao_plano_acao_id_seq;
       public       postgres    false    170    6            �
           0    0    acao_plano_acao_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE acao_plano_acao_id_seq OWNED BY acao_plano_acao.id;
            public       postgres    false    171            �            1259    97964    anomalia    TABLE     !  CREATE TABLE anomalia (
    id integer NOT NULL,
    causas_internas text,
    causas_externas text,
    data date,
    indicador_id integer,
    status integer DEFAULT 1,
    data_conclusao date,
    identificacao_problema text,
    estratificacao_problema text,
    concluido integer
);
    DROP TABLE public.anomalia;
       public         postgres    false    6            �
           0    0    anomalia    ACL     �   REVOKE ALL ON TABLE anomalia FROM PUBLIC;
REVOKE ALL ON TABLE anomalia FROM postgres;
GRANT ALL ON TABLE anomalia TO postgres;
GRANT ALL ON TABLE anomalia TO PUBLIC;
            public       postgres    false    172            �            1259    97971    anomalia_id_seq    SEQUENCE     q   CREATE SEQUENCE anomalia_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.anomalia_id_seq;
       public       postgres    false    172    6            �
           0    0    anomalia_id_seq    SEQUENCE OWNED BY     5   ALTER SEQUENCE anomalia_id_seq OWNED BY anomalia.id;
            public       postgres    false    173            �
           0    0    anomalia_id_seq    ACL     �   REVOKE ALL ON SEQUENCE anomalia_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE anomalia_id_seq FROM postgres;
GRANT ALL ON SEQUENCE anomalia_id_seq TO postgres;
GRANT ALL ON SEQUENCE anomalia_id_seq TO PUBLIC;
            public       postgres    false    173            �            1259    97992 	   auditoria    TABLE     �   CREATE TABLE auditoria (
    id integer NOT NULL,
    alias_controller character varying(255),
    alias_acao character varying(255),
    usuario_id integer,
    created timestamp without time zone,
    elemento_id character varying
);
    DROP TABLE public.auditoria;
       public         postgres    false    6            �
           0    0 	   auditoria    ACL     �   REVOKE ALL ON TABLE auditoria FROM PUBLIC;
REVOKE ALL ON TABLE auditoria FROM postgres;
GRANT ALL ON TABLE auditoria TO postgres;
GRANT ALL ON TABLE auditoria TO PUBLIC;
            public       postgres    false    174            �            1259    97998    auditoria_campos    TABLE     �   CREATE TABLE auditoria_campos (
    id integer NOT NULL,
    alias_model character varying(255),
    valor_antigo text,
    valor_novo text,
    auditoria_id integer,
    tipo_campo integer
);
 $   DROP TABLE public.auditoria_campos;
       public         postgres    false    6            �
           0    0    auditoria_campos    ACL     �   REVOKE ALL ON TABLE auditoria_campos FROM PUBLIC;
REVOKE ALL ON TABLE auditoria_campos FROM postgres;
GRANT ALL ON TABLE auditoria_campos TO postgres;
GRANT ALL ON TABLE auditoria_campos TO PUBLIC;
            public       postgres    false    175            �            1259    98004    auditoria_campos_id_seq    SEQUENCE     y   CREATE SEQUENCE auditoria_campos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.auditoria_campos_id_seq;
       public       postgres    false    6    175                        0    0    auditoria_campos_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE auditoria_campos_id_seq OWNED BY auditoria_campos.id;
            public       postgres    false    176                       0    0    auditoria_campos_id_seq    ACL     �   REVOKE ALL ON SEQUENCE auditoria_campos_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE auditoria_campos_id_seq FROM postgres;
GRANT ALL ON SEQUENCE auditoria_campos_id_seq TO postgres;
GRANT ALL ON SEQUENCE auditoria_campos_id_seq TO PUBLIC;
            public       postgres    false    176            �            1259    98006    auditoria_id_seq    SEQUENCE     r   CREATE SEQUENCE auditoria_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.auditoria_id_seq;
       public       postgres    false    174    6                       0    0    auditoria_id_seq    SEQUENCE OWNED BY     7   ALTER SEQUENCE auditoria_id_seq OWNED BY auditoria.id;
            public       postgres    false    177                       0    0    auditoria_id_seq    ACL     �   REVOKE ALL ON SEQUENCE auditoria_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE auditoria_id_seq FROM postgres;
GRANT ALL ON SEQUENCE auditoria_id_seq TO postgres;
GRANT ALL ON SEQUENCE auditoria_id_seq TO PUBLIC;
            public       postgres    false    177            �            1259    98008    cargo    TABLE     �   CREATE TABLE cargo (
    id integer NOT NULL,
    titulo character varying(255),
    descricao text,
    status integer DEFAULT 1
);
    DROP TABLE public.cargo;
       public         postgres    false    6            �            1259    98015    cargo_id_seq    SEQUENCE     n   CREATE SEQUENCE cargo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.cargo_id_seq;
       public       postgres    false    178    6                       0    0    cargo_id_seq    SEQUENCE OWNED BY     /   ALTER SEQUENCE cargo_id_seq OWNED BY cargo.id;
            public       postgres    false    179            �            1259    98017 	   categoria    TABLE     R   CREATE TABLE categoria (
    id integer NOT NULL,
    titulo character varying
);
    DROP TABLE public.categoria;
       public         postgres    false    6                       0    0 	   categoria    ACL     �   REVOKE ALL ON TABLE categoria FROM PUBLIC;
REVOKE ALL ON TABLE categoria FROM postgres;
GRANT ALL ON TABLE categoria TO postgres;
GRANT ALL ON TABLE categoria TO PUBLIC;
            public       postgres    false    180            �            1259    98023    categoria_id_seq    SEQUENCE     r   CREATE SEQUENCE categoria_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.categoria_id_seq;
       public       postgres    false    6    180                       0    0    categoria_id_seq    SEQUENCE OWNED BY     7   ALTER SEQUENCE categoria_id_seq OWNED BY categoria.id;
            public       postgres    false    181                       0    0    categoria_id_seq    ACL     �   REVOKE ALL ON SEQUENCE categoria_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE categoria_id_seq FROM postgres;
GRANT ALL ON SEQUENCE categoria_id_seq TO postgres;
GRANT ALL ON SEQUENCE categoria_id_seq TO PUBLIC;
            public       postgres    false    181            �            1259    98025 
   comentario    TABLE     �   CREATE TABLE comentario (
    id integer NOT NULL,
    mensagem text,
    arquivo character varying(255),
    usuario_id integer,
    acao_id integer
);
    DROP TABLE public.comentario;
       public         postgres    false    6            �            1259    98031    comentario_id_seq    SEQUENCE     s   CREATE SEQUENCE comentario_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.comentario_id_seq;
       public       postgres    false    182    6                       0    0    comentario_id_seq    SEQUENCE OWNED BY     9   ALTER SEQUENCE comentario_id_seq OWNED BY comentario.id;
            public       postgres    false    183            �            1259    98033    comunicacao    TABLE     �   CREATE TABLE comunicacao (
    id integer NOT NULL,
    titulo character varying(255),
    status integer DEFAULT 1,
    tipo character varying(45)
);
    DROP TABLE public.comunicacao;
       public         postgres    false    6            �            1259    98037    comunicacao_id_seq    SEQUENCE     t   CREATE SEQUENCE comunicacao_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.comunicacao_id_seq;
       public       postgres    false    184    6            	           0    0    comunicacao_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE comunicacao_id_seq OWNED BY comunicacao.id;
            public       postgres    false    185            �            1259    98039    departamento    TABLE     x   CREATE TABLE departamento (
    id integer NOT NULL,
    titulo character varying(255),
    status integer DEFAULT 1
);
     DROP TABLE public.departamento;
       public         postgres    false    6            �            1259    98043    departamento_id_seq    SEQUENCE     u   CREATE SEQUENCE departamento_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.departamento_id_seq;
       public       postgres    false    186    6            
           0    0    departamento_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE departamento_id_seq OWNED BY departamento.id;
            public       postgres    false    187            �            1259    98045    dimensao    TABLE     �   CREATE TABLE dimensao (
    id integer NOT NULL,
    titulo character varying(255),
    observacao text,
    ordem integer,
    status integer DEFAULT 1,
    empresa_id integer
);
    DROP TABLE public.dimensao;
       public         postgres    false    6            �            1259    98052    dimensao_id_seq    SEQUENCE     q   CREATE SEQUENCE dimensao_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.dimensao_id_seq;
       public       postgres    false    188    6                       0    0    dimensao_id_seq    SEQUENCE OWNED BY     5   ALTER SEQUENCE dimensao_id_seq OWNED BY dimensao.id;
            public       postgres    false    189            �            1259    98054    empresa    TABLE       CREATE TABLE empresa (
    id integer NOT NULL,
    matriz integer,
    cnpj character varying(45),
    inscricao_estadual character varying(255),
    inscricao_municipal character varying(255),
    pessoa_id integer,
    empresa_id integer,
    status integer DEFAULT 1
);
    DROP TABLE public.empresa;
       public         postgres    false    6            �            1259    98061    empresa_id_seq    SEQUENCE     p   CREATE SEQUENCE empresa_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.empresa_id_seq;
       public       postgres    false    190    6                       0    0    empresa_id_seq    SEQUENCE OWNED BY     3   ALTER SEQUENCE empresa_id_seq OWNED BY empresa.id;
            public       postgres    false    191            �            1259    98063    endereco    TABLE       CREATE TABLE endereco (
    id integer NOT NULL,
    logradouro character varying(255),
    cep character varying(45),
    bairro character varying(255),
    cidade character varying(255),
    numero character varying(45),
    uf character(2),
    status integer DEFAULT 1
);
    DROP TABLE public.endereco;
       public         postgres    false    6            �            1259    98070    endereco_id_seq    SEQUENCE     q   CREATE SEQUENCE endereco_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.endereco_id_seq;
       public       postgres    false    6    192                       0    0    endereco_id_seq    SEQUENCE OWNED BY     5   ALTER SEQUENCE endereco_id_seq OWNED BY endereco.id;
            public       postgres    false    193            �            1259    98072    esqueci_senha    TABLE     �   CREATE TABLE esqueci_senha (
    id integer NOT NULL,
    usuario_id integer,
    hash character varying(255),
    ativo boolean,
    data timestamp without time zone
);
 !   DROP TABLE public.esqueci_senha;
       public         postgres    false    6                       0    0    esqueci_senha    ACL     �   REVOKE ALL ON TABLE esqueci_senha FROM PUBLIC;
REVOKE ALL ON TABLE esqueci_senha FROM postgres;
GRANT ALL ON TABLE esqueci_senha TO postgres;
GRANT ALL ON TABLE esqueci_senha TO PUBLIC;
            public       postgres    false    194            �            1259    98075    esqueci_senha_id_seq    SEQUENCE     v   CREATE SEQUENCE esqueci_senha_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.esqueci_senha_id_seq;
       public       postgres    false    194    6                       0    0    esqueci_senha_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE esqueci_senha_id_seq OWNED BY esqueci_senha.id;
            public       postgres    false    195                       0    0    esqueci_senha_id_seq    ACL     �   REVOKE ALL ON SEQUENCE esqueci_senha_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE esqueci_senha_id_seq FROM postgres;
GRANT ALL ON SEQUENCE esqueci_senha_id_seq TO postgres;
GRANT ALL ON SEQUENCE esqueci_senha_id_seq TO PUBLIC;
            public       postgres    false    195            �            1259    98077    faixa    TABLE     �   CREATE TABLE faixa (
    id integer NOT NULL,
    titulo character varying(255) NOT NULL,
    limite_vermelho double precision,
    limite_amarelo double precision,
    status integer DEFAULT 1 NOT NULL
);
    DROP TABLE public.faixa;
       public         postgres    false    6                       0    0    faixa    ACL     �   REVOKE ALL ON TABLE faixa FROM PUBLIC;
REVOKE ALL ON TABLE faixa FROM postgres;
GRANT ALL ON TABLE faixa TO postgres;
GRANT ALL ON TABLE faixa TO PUBLIC;
            public       postgres    false    196            �            1259    98081    faixa_id_seq    SEQUENCE     n   CREATE SEQUENCE faixa_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.faixa_id_seq;
       public       postgres    false    196    6                       0    0    faixa_id_seq    SEQUENCE OWNED BY     /   ALTER SEQUENCE faixa_id_seq OWNED BY faixa.id;
            public       postgres    false    197                       0    0    faixa_id_seq    ACL     �   REVOKE ALL ON SEQUENCE faixa_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE faixa_id_seq FROM postgres;
GRANT ALL ON SEQUENCE faixa_id_seq TO postgres;
GRANT ALL ON SEQUENCE faixa_id_seq TO PUBLIC;
            public       postgres    false    197            �            1259    98083    grupo    TABLE     q   CREATE TABLE grupo (
    id integer NOT NULL,
    titulo character varying(255),
    status integer DEFAULT 1
);
    DROP TABLE public.grupo;
       public         postgres    false    6            �            1259    98087    grupo_id_seq    SEQUENCE     n   CREATE SEQUENCE grupo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.grupo_id_seq;
       public       postgres    false    198    6                       0    0    grupo_id_seq    SEQUENCE OWNED BY     /   ALTER SEQUENCE grupo_id_seq OWNED BY grupo.id;
            public       postgres    false    199            �            1259    98089 	   indicador    TABLE     1  CREATE TABLE indicador (
    id integer NOT NULL,
    titulo character varying(255) NOT NULL,
    indicador_id integer,
    faixa_id integer NOT NULL,
    objetivo_id integer NOT NULL,
    usuario_id integer NOT NULL,
    calculo integer NOT NULL,
    desdobramento integer DEFAULT 1 NOT NULL,
    projecao integer DEFAULT 0 NOT NULL,
    tipo_calculo integer DEFAULT 0 NOT NULL,
    tipo integer DEFAULT 0 NOT NULL,
    ordem integer NOT NULL,
    status integer DEFAULT 1 NOT NULL,
    anos text,
    unidade character varying(255),
    projeto_id integer
);
    DROP TABLE public.indicador;
       public         postgres    false    6                       0    0 	   indicador    ACL     �   REVOKE ALL ON TABLE indicador FROM PUBLIC;
REVOKE ALL ON TABLE indicador FROM postgres;
GRANT ALL ON TABLE indicador TO postgres;
GRANT ALL ON TABLE indicador TO PUBLIC;
            public       postgres    false    200            �            1259    98100    indicador_autorizado_visualizar    TABLE     |   CREATE TABLE indicador_autorizado_visualizar (
    id integer NOT NULL,
    usuario_id integer,
    indicador_id integer
);
 3   DROP TABLE public.indicador_autorizado_visualizar;
       public         postgres    false    6                       0    0    indicador_autorizado_visualizar    ACL       REVOKE ALL ON TABLE indicador_autorizado_visualizar FROM PUBLIC;
REVOKE ALL ON TABLE indicador_autorizado_visualizar FROM postgres;
GRANT ALL ON TABLE indicador_autorizado_visualizar TO postgres;
GRANT ALL ON TABLE indicador_autorizado_visualizar TO PUBLIC;
            public       postgres    false    201            �            1259    98103 &   indicador_autorizado_visualizar_id_seq    SEQUENCE     �   CREATE SEQUENCE indicador_autorizado_visualizar_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 =   DROP SEQUENCE public.indicador_autorizado_visualizar_id_seq;
       public       postgres    false    6    201                       0    0 &   indicador_autorizado_visualizar_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE indicador_autorizado_visualizar_id_seq OWNED BY indicador_autorizado_visualizar.id;
            public       postgres    false    202                       0    0 &   indicador_autorizado_visualizar_id_seq    ACL     *  REVOKE ALL ON SEQUENCE indicador_autorizado_visualizar_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE indicador_autorizado_visualizar_id_seq FROM postgres;
GRANT ALL ON SEQUENCE indicador_autorizado_visualizar_id_seq TO postgres;
GRANT ALL ON SEQUENCE indicador_autorizado_visualizar_id_seq TO PUBLIC;
            public       postgres    false    202            �            1259    98105    indicador_id_seq    SEQUENCE     r   CREATE SEQUENCE indicador_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.indicador_id_seq;
       public       postgres    false    200    6                       0    0    indicador_id_seq    SEQUENCE OWNED BY     7   ALTER SEQUENCE indicador_id_seq OWNED BY indicador.id;
            public       postgres    false    203                       0    0    indicador_id_seq    ACL     �   REVOKE ALL ON SEQUENCE indicador_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE indicador_id_seq FROM postgres;
GRANT ALL ON SEQUENCE indicador_id_seq TO postgres;
GRANT ALL ON SEQUENCE indicador_id_seq TO PUBLIC;
            public       postgres    false    203            �            1259    98107    indicador_meta    TABLE     �  CREATE TABLE indicador_meta (
    id integer NOT NULL,
    indicador_id integer,
    janeiro double precision,
    fevereiro double precision,
    marco double precision,
    abril double precision,
    maio double precision,
    junho double precision,
    julho double precision,
    agosto double precision,
    setembro double precision,
    outubro double precision,
    novembro double precision,
    dezembro double precision,
    ano character varying
);
 "   DROP TABLE public.indicador_meta;
       public         postgres    false    6                       0    0    indicador_meta    ACL     �   REVOKE ALL ON TABLE indicador_meta FROM PUBLIC;
REVOKE ALL ON TABLE indicador_meta FROM postgres;
GRANT ALL ON TABLE indicador_meta TO postgres;
GRANT ALL ON TABLE indicador_meta TO PUBLIC;
            public       postgres    false    204            �            1259    98113    indicador_meta_id_seq    SEQUENCE     w   CREATE SEQUENCE indicador_meta_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.indicador_meta_id_seq;
       public       postgres    false    204    6                       0    0    indicador_meta_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE indicador_meta_id_seq OWNED BY indicador_meta.id;
            public       postgres    false    205                       0    0    indicador_meta_id_seq    ACL     �   REVOKE ALL ON SEQUENCE indicador_meta_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE indicador_meta_id_seq FROM postgres;
GRANT ALL ON SEQUENCE indicador_meta_id_seq TO postgres;
GRANT ALL ON SEQUENCE indicador_meta_id_seq TO PUBLIC;
            public       postgres    false    205            �            1259    98115    indicador_realizado    TABLE     �  CREATE TABLE indicador_realizado (
    id integer NOT NULL,
    indicador_id integer,
    janeiro double precision,
    fevereiro double precision,
    marco double precision,
    abril double precision,
    maio double precision,
    junho double precision,
    julho double precision,
    agosto double precision,
    setembro double precision,
    outubro double precision,
    novembro double precision,
    dezembro double precision,
    ano character varying
);
 '   DROP TABLE public.indicador_realizado;
       public         postgres    false    6                       0    0    indicador_realizado    ACL     �   REVOKE ALL ON TABLE indicador_realizado FROM PUBLIC;
REVOKE ALL ON TABLE indicador_realizado FROM postgres;
GRANT ALL ON TABLE indicador_realizado TO postgres;
GRANT ALL ON TABLE indicador_realizado TO PUBLIC;
            public       postgres    false    206            �            1259    98121    indicador_realizado_id_seq    SEQUENCE     |   CREATE SEQUENCE indicador_realizado_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.indicador_realizado_id_seq;
       public       postgres    false    206    6                       0    0    indicador_realizado_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE indicador_realizado_id_seq OWNED BY indicador_realizado.id;
            public       postgres    false    207                        0    0    indicador_realizado_id_seq    ACL     �   REVOKE ALL ON SEQUENCE indicador_realizado_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE indicador_realizado_id_seq FROM postgres;
GRANT ALL ON SEQUENCE indicador_realizado_id_seq TO postgres;
GRANT ALL ON SEQUENCE indicador_realizado_id_seq TO PUBLIC;
            public       postgres    false    207            �            1259    98123    indicador_responsavel_meta    TABLE     w   CREATE TABLE indicador_responsavel_meta (
    id integer NOT NULL,
    usuario_id integer,
    indicador_id integer
);
 .   DROP TABLE public.indicador_responsavel_meta;
       public         postgres    false    6            !           0    0 .   COLUMN indicador_responsavel_meta.indicador_id    COMMENT     B   COMMENT ON COLUMN indicador_responsavel_meta.indicador_id IS '
';
            public       postgres    false    208            "           0    0    indicador_responsavel_meta    ACL     �   REVOKE ALL ON TABLE indicador_responsavel_meta FROM PUBLIC;
REVOKE ALL ON TABLE indicador_responsavel_meta FROM postgres;
GRANT ALL ON TABLE indicador_responsavel_meta TO postgres;
GRANT ALL ON TABLE indicador_responsavel_meta TO PUBLIC;
            public       postgres    false    208            �            1259    98126 !   indicador_responsavel_meta_id_seq    SEQUENCE     �   CREATE SEQUENCE indicador_responsavel_meta_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.indicador_responsavel_meta_id_seq;
       public       postgres    false    6    208            #           0    0 !   indicador_responsavel_meta_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE indicador_responsavel_meta_id_seq OWNED BY indicador_responsavel_meta.id;
            public       postgres    false    209            $           0    0 !   indicador_responsavel_meta_id_seq    ACL       REVOKE ALL ON SEQUENCE indicador_responsavel_meta_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE indicador_responsavel_meta_id_seq FROM postgres;
GRANT ALL ON SEQUENCE indicador_responsavel_meta_id_seq TO postgres;
GRANT ALL ON SEQUENCE indicador_responsavel_meta_id_seq TO PUBLIC;
            public       postgres    false    209            �            1259    98128    indicador_responsavel_realizado    TABLE     |   CREATE TABLE indicador_responsavel_realizado (
    id integer NOT NULL,
    usuario_id integer,
    indicador_id integer
);
 3   DROP TABLE public.indicador_responsavel_realizado;
       public         postgres    false    6            %           0    0    indicador_responsavel_realizado    ACL       REVOKE ALL ON TABLE indicador_responsavel_realizado FROM PUBLIC;
REVOKE ALL ON TABLE indicador_responsavel_realizado FROM postgres;
GRANT ALL ON TABLE indicador_responsavel_realizado TO postgres;
GRANT ALL ON TABLE indicador_responsavel_realizado TO PUBLIC;
            public       postgres    false    210            �            1259    98131 &   indicador_responsavel_realizado_id_seq    SEQUENCE     �   CREATE SEQUENCE indicador_responsavel_realizado_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 =   DROP SEQUENCE public.indicador_responsavel_realizado_id_seq;
       public       postgres    false    210    6            &           0    0 &   indicador_responsavel_realizado_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE indicador_responsavel_realizado_id_seq OWNED BY indicador_responsavel_realizado.id;
            public       postgres    false    211            '           0    0 &   indicador_responsavel_realizado_id_seq    ACL     *  REVOKE ALL ON SEQUENCE indicador_responsavel_realizado_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE indicador_responsavel_realizado_id_seq FROM postgres;
GRANT ALL ON SEQUENCE indicador_responsavel_realizado_id_seq TO postgres;
GRANT ALL ON SEQUENCE indicador_responsavel_realizado_id_seq TO PUBLIC;
            public       postgres    false    211            �            1259    98133    marcador    TABLE     �   CREATE TABLE marcador (
    id integer NOT NULL,
    titulo character varying(255),
    status integer DEFAULT 1,
    descricao text
);
    DROP TABLE public.marcador;
       public         postgres    false    6            (           0    0    marcador    ACL     �   REVOKE ALL ON TABLE marcador FROM PUBLIC;
REVOKE ALL ON TABLE marcador FROM postgres;
GRANT ALL ON TABLE marcador TO postgres;
GRANT ALL ON TABLE marcador TO PUBLIC;
            public       postgres    false    212            �            1259    98140    marcador_id_seq    SEQUENCE     q   CREATE SEQUENCE marcador_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.marcador_id_seq;
       public       postgres    false    212    6            )           0    0    marcador_id_seq    SEQUENCE OWNED BY     5   ALTER SEQUENCE marcador_id_seq OWNED BY marcador.id;
            public       postgres    false    213            *           0    0    marcador_id_seq    ACL     �   REVOKE ALL ON SEQUENCE marcador_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE marcador_id_seq FROM postgres;
GRANT ALL ON SEQUENCE marcador_id_seq TO postgres;
GRANT ALL ON SEQUENCE marcador_id_seq TO PUBLIC;
            public       postgres    false    213            �            1259    98142    marcador_objetivo    TABLE     n   CREATE TABLE marcador_objetivo (
    id integer NOT NULL,
    marcador_id integer,
    objetivo_id integer
);
 %   DROP TABLE public.marcador_objetivo;
       public         postgres    false    6            +           0    0    marcador_objetivo    ACL     �   REVOKE ALL ON TABLE marcador_objetivo FROM PUBLIC;
REVOKE ALL ON TABLE marcador_objetivo FROM postgres;
GRANT ALL ON TABLE marcador_objetivo TO postgres;
GRANT ALL ON TABLE marcador_objetivo TO PUBLIC;
            public       postgres    false    214            �            1259    98145    marcador_objetivo_id_seq    SEQUENCE     z   CREATE SEQUENCE marcador_objetivo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.marcador_objetivo_id_seq;
       public       postgres    false    214    6            ,           0    0    marcador_objetivo_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE marcador_objetivo_id_seq OWNED BY marcador_objetivo.id;
            public       postgres    false    215            -           0    0    marcador_objetivo_id_seq    ACL     �   REVOKE ALL ON SEQUENCE marcador_objetivo_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE marcador_objetivo_id_seq FROM postgres;
GRANT ALL ON SEQUENCE marcador_objetivo_id_seq TO postgres;
GRANT ALL ON SEQUENCE marcador_objetivo_id_seq TO PUBLIC;
            public       postgres    false    215            �            1259    98147    objetivo    TABLE     �  CREATE TABLE objetivo (
    id integer NOT NULL,
    ano integer,
    ordem integer,
    titulo character varying(255),
    dimensao_id integer,
    status integer DEFAULT 1,
    tipo integer DEFAULT 1,
    objetivo_id integer,
    prioridade character(1),
    andamento character varying(30),
    resultado text,
    providencia text,
    restricao text,
    situacao character varying(100),
    situacao_desc text,
    status_medida integer,
    data_ultima_atualizacao date,
    pdti_prazo character varying(8),
    pdti_indicador character varying(255),
    pdti_valor_meta character varying(15),
    observacoes text,
    riscos text,
    data_ultima_revisao date,
    usuario_id integer
);
    DROP TABLE public.objetivo;
       public         postgres    false    6            .           0    0    COLUMN objetivo.pdti_prazo    COMMENT     L   COMMENT ON COLUMN objetivo.pdti_prazo IS 'Prazo do PDTI (Formato MM/AAAA)';
            public       postgres    false    216            /           0    0    COLUMN objetivo.usuario_id    COMMENT     9   COMMENT ON COLUMN objetivo.usuario_id IS 'Responsável';
            public       postgres    false    216            �            1259    98155    objetivo_id_seq    SEQUENCE     q   CREATE SEQUENCE objetivo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.objetivo_id_seq;
       public       postgres    false    6    216            0           0    0    objetivo_id_seq    SEQUENCE OWNED BY     5   ALTER SEQUENCE objetivo_id_seq OWNED BY objetivo.id;
            public       postgres    false    217            �            1259    98157    objetivo_projeto    TABLE     l   CREATE TABLE objetivo_projeto (
    id integer NOT NULL,
    projeto_id integer,
    objetivo_id integer
);
 $   DROP TABLE public.objetivo_projeto;
       public         postgres    false    6            �            1259    98160    objetivo_projeto_id_seq    SEQUENCE     y   CREATE SEQUENCE objetivo_projeto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.objetivo_projeto_id_seq;
       public       postgres    false    6    218            1           0    0    objetivo_projeto_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE objetivo_projeto_id_seq OWNED BY objetivo_projeto.id;
            public       postgres    false    219            �            1259    98162    patrocinador_projeto    TABLE     n   CREATE TABLE patrocinador_projeto (
    id integer NOT NULL,
    projeto_id integer,
    pessoa_id integer
);
 (   DROP TABLE public.patrocinador_projeto;
       public         postgres    false    6            2           0    0    patrocinador_projeto    ACL     �   REVOKE ALL ON TABLE patrocinador_projeto FROM PUBLIC;
REVOKE ALL ON TABLE patrocinador_projeto FROM postgres;
GRANT ALL ON TABLE patrocinador_projeto TO postgres;
GRANT ALL ON TABLE patrocinador_projeto TO PUBLIC;
            public       postgres    false    220            �            1259    98165    patrocinador_projeto_id_seq    SEQUENCE     }   CREATE SEQUENCE patrocinador_projeto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.patrocinador_projeto_id_seq;
       public       postgres    false    220    6            3           0    0    patrocinador_projeto_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE patrocinador_projeto_id_seq OWNED BY patrocinador_projeto.id;
            public       postgres    false    221            4           0    0    patrocinador_projeto_id_seq    ACL     �   REVOKE ALL ON SEQUENCE patrocinador_projeto_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE patrocinador_projeto_id_seq FROM postgres;
GRANT ALL ON SEQUENCE patrocinador_projeto_id_seq TO postgres;
GRANT ALL ON SEQUENCE patrocinador_projeto_id_seq TO PUBLIC;
            public       postgres    false    221            �            1259    98767 
   permissoes    TABLE     q   CREATE TABLE permissoes (
    id integer NOT NULL,
    grupo_id integer,
    descricao character varying(255)
);
    DROP TABLE public.permissoes;
       public         postgres    false    6            �            1259    98765    permissoes_id_seq    SEQUENCE     s   CREATE SEQUENCE permissoes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.permissoes_id_seq;
       public       postgres    false    6    255            5           0    0    permissoes_id_seq    SEQUENCE OWNED BY     9   ALTER SEQUENCE permissoes_id_seq OWNED BY permissoes.id;
            public       postgres    false    254            �            1259    98167    pessoa    TABLE     �   CREATE TABLE pessoa (
    id integer NOT NULL,
    titulo character varying(255),
    tipo character(2),
    observacao text,
    email character varying(255)
);
    DROP TABLE public.pessoa;
       public         postgres    false    6            �            1259    98173    pessoa_comunicacao    TABLE     p   CREATE TABLE pessoa_comunicacao (
    id integer NOT NULL,
    pessoa_id integer,
    comunicacao_id integer
);
 &   DROP TABLE public.pessoa_comunicacao;
       public         postgres    false    6            �            1259    98176    pessoa_comunicacao_id_seq    SEQUENCE     {   CREATE SEQUENCE pessoa_comunicacao_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.pessoa_comunicacao_id_seq;
       public       postgres    false    223    6            6           0    0    pessoa_comunicacao_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE pessoa_comunicacao_id_seq OWNED BY pessoa_comunicacao.id;
            public       postgres    false    224            �            1259    98178    pessoa_id_seq    SEQUENCE     o   CREATE SEQUENCE pessoa_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.pessoa_id_seq;
       public       postgres    false    222    6            7           0    0    pessoa_id_seq    SEQUENCE OWNED BY     1   ALTER SEQUENCE pessoa_id_seq OWNED BY pessoa.id;
            public       postgres    false    225            �            1259    98180 
   plano_acao    TABLE     �   CREATE TABLE plano_acao (
    id integer NOT NULL,
    objetivo_id integer,
    titulo character varying(255),
    status integer DEFAULT 1
);
    DROP TABLE public.plano_acao;
       public         postgres    false    6            �            1259    98184    plano_acao_id_seq    SEQUENCE     s   CREATE SEQUENCE plano_acao_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.plano_acao_id_seq;
       public       postgres    false    226    6            8           0    0    plano_acao_id_seq    SEQUENCE OWNED BY     9   ALTER SEQUENCE plano_acao_id_seq OWNED BY plano_acao.id;
            public       postgres    false    227            �            1259    98186    plano_acao_projeto    TABLE     p   CREATE TABLE plano_acao_projeto (
    id integer NOT NULL,
    projeto_id integer,
    plano_acao_id integer
);
 &   DROP TABLE public.plano_acao_projeto;
       public         postgres    false    6            �            1259    98189    plano_acao_projeto_id_seq    SEQUENCE     {   CREATE SEQUENCE plano_acao_projeto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.plano_acao_projeto_id_seq;
       public       postgres    false    228    6            9           0    0    plano_acao_projeto_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE plano_acao_projeto_id_seq OWNED BY plano_acao_projeto.id;
            public       postgres    false    229            �            1259    98191    post    TABLE     n  CREATE TABLE post (
    id integer NOT NULL,
    titulo character varying(255),
    mensagem text,
    acao_id integer,
    receber_email integer DEFAULT 1,
    status integer DEFAULT 1,
    post_id integer,
    created timestamp without time zone,
    modified timestamp without time zone,
    usuario_id integer,
    categoria_id integer,
    tarefa_id integer
);
    DROP TABLE public.post;
       public         postgres    false    6            :           0    0    post    ACL     �   REVOKE ALL ON TABLE post FROM PUBLIC;
REVOKE ALL ON TABLE post FROM postgres;
GRANT ALL ON TABLE post TO postgres;
GRANT ALL ON TABLE post TO PUBLIC;
            public       postgres    false    230            �            1259    98199    post_id_seq    SEQUENCE     m   CREATE SEQUENCE post_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.post_id_seq;
       public       postgres    false    6    230            ;           0    0    post_id_seq    SEQUENCE OWNED BY     -   ALTER SEQUENCE post_id_seq OWNED BY post.id;
            public       postgres    false    231            <           0    0    post_id_seq    ACL     �   REVOKE ALL ON SEQUENCE post_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE post_id_seq FROM postgres;
GRANT ALL ON SEQUENCE post_id_seq TO postgres;
GRANT ALL ON SEQUENCE post_id_seq TO PUBLIC;
            public       postgres    false    231            �            1259    98201    procedimento    TABLE     7  CREATE TABLE procedimento (
    id integer NOT NULL,
    titulo character varying(255),
    resultado_esperado text,
    passos text,
    requisito text,
    arquivo character varying(255),
    arquivo_dir character varying(255),
    usuario_id integer,
    certificado integer,
    status integer DEFAULT 1
);
     DROP TABLE public.procedimento;
       public         postgres    false    6            =           0    0    procedimento    ACL     �   REVOKE ALL ON TABLE procedimento FROM PUBLIC;
REVOKE ALL ON TABLE procedimento FROM postgres;
GRANT ALL ON TABLE procedimento TO postgres;
GRANT ALL ON TABLE procedimento TO PUBLIC;
            public       postgres    false    232            �            1259    98208    procedimento_id_seq    SEQUENCE     u   CREATE SEQUENCE procedimento_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.procedimento_id_seq;
       public       postgres    false    6    232            >           0    0    procedimento_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE procedimento_id_seq OWNED BY procedimento.id;
            public       postgres    false    233            ?           0    0    procedimento_id_seq    ACL     �   REVOKE ALL ON SEQUENCE procedimento_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE procedimento_id_seq FROM postgres;
GRANT ALL ON SEQUENCE procedimento_id_seq TO postgres;
GRANT ALL ON SEQUENCE procedimento_id_seq TO PUBLIC;
            public       postgres    false    233            �            1259    98210    programa    TABLE     �   CREATE TABLE programa (
    id integer NOT NULL,
    titulo character varying(255),
    data_inicio date,
    data_fim date,
    status integer DEFAULT 1,
    descricao text
);
    DROP TABLE public.programa;
       public         postgres    false    6            @           0    0    programa    ACL     �   REVOKE ALL ON TABLE programa FROM PUBLIC;
REVOKE ALL ON TABLE programa FROM postgres;
GRANT ALL ON TABLE programa TO postgres;
GRANT ALL ON TABLE programa TO PUBLIC;
            public       postgres    false    234            �            1259    98217    programa_id_seq    SEQUENCE     q   CREATE SEQUENCE programa_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.programa_id_seq;
       public       postgres    false    6    234            A           0    0    programa_id_seq    SEQUENCE OWNED BY     5   ALTER SEQUENCE programa_id_seq OWNED BY programa.id;
            public       postgres    false    235            B           0    0    programa_id_seq    ACL     �   REVOKE ALL ON SEQUENCE programa_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE programa_id_seq FROM postgres;
GRANT ALL ON SEQUENCE programa_id_seq TO postgres;
GRANT ALL ON SEQUENCE programa_id_seq TO PUBLIC;
            public       postgres    false    235            �            1259    98219    projeto    TABLE       CREATE TABLE projeto (
    id integer NOT NULL,
    titulo character varying(255),
    data_inicio_previsto date,
    data_fim_previsto date,
    valor double precision,
    descricao text,
    concluido integer DEFAULT 0,
    data_conclusao date,
    motivacao text,
    resultado text,
    risco text,
    usuario_id integer,
    status integer DEFAULT 1,
    custo double precision,
    moeda character varying(10),
    programa_id integer,
    email_tarefa character varying,
    email_acao character varying(5),
    gasto double precision,
    processo character varying(100),
    tamanho character varying(1),
    perspectiva_temporal character varying(30),
    complexidade character varying(10),
    importancia_politica character varying(10),
    saude_projeto integer DEFAULT 0,
    situacao integer DEFAULT 0,
    url_projeto character varying(255),
    parceiros text,
    patrocinador character varying(255),
    area_executora character varying(50),
    area_cliente character varying(50),
    data_ultima_atualizacao date
);
    DROP TABLE public.projeto;
       public         postgres    false    6            C           0    0    COLUMN projeto.tamanho    COMMENT     Z   COMMENT ON COLUMN projeto.tamanho IS 'Pequeno, Médio ou Grande (relacionado ao escopo)';
            public       postgres    false    236            D           0    0 #   COLUMN projeto.perspectiva_temporal    COMMENT     �   COMMENT ON COLUMN projeto.perspectiva_temporal IS 'Curto Prazo (até 3 meses), Médio Prazo (até 1 ano), Longo Prazo (mais que 1 ano)';
            public       postgres    false    236            E           0    0    COLUMN projeto.complexidade    COMMENT     C   COMMENT ON COLUMN projeto.complexidade IS 'Baixa, Média ou Alta';
            public       postgres    false    236            F           0    0 #   COLUMN projeto.importancia_politica    COMMENT     K   COMMENT ON COLUMN projeto.importancia_politica IS 'Baixa, Média ou Alta';
            public       postgres    false    236            G           0    0    COLUMN projeto.saude_projeto    COMMENT     Z   COMMENT ON COLUMN projeto.saude_projeto IS '0 - Adequada, 1 - Atenção, 2 - Inadequada';
            public       postgres    false    236            H           0    0    COLUMN projeto.situacao    COMMENT     v   COMMENT ON COLUMN projeto.situacao IS '0 - A Iniciar, 1 - Em Andamento, 2 - Bloqueado, 3 - Suspenso, 4 - Concluído';
            public       postgres    false    236            I           0    0    COLUMN projeto.url_projeto    COMMENT     b   COMMENT ON COLUMN projeto.url_projeto IS 'Url do Projeto (redmine, citsmart ou outros sistemas)';
            public       postgres    false    236            J           0    0    COLUMN projeto.parceiros    COMMENT     c   COMMENT ON COLUMN projeto.parceiros IS 'Parceiros (empresas contratadas, conveniados, parcerias)';
            public       postgres    false    236            K           0    0    COLUMN projeto.patrocinador    COMMENT     I   COMMENT ON COLUMN projeto.patrocinador IS 'Patrocinador (Nome e Área)';
            public       postgres    false    236            L           0    0    COLUMN projeto.area_executora    COMMENT     J   COMMENT ON COLUMN projeto.area_executora IS 'Área Executora do Projeto';
            public       postgres    false    236            M           0    0    COLUMN projeto.area_cliente    COMMENT     F   COMMENT ON COLUMN projeto.area_cliente IS 'Área Cliente do Projeto';
            public       postgres    false    236            N           0    0 &   COLUMN projeto.data_ultima_atualizacao    COMMENT     V   COMMENT ON COLUMN projeto.data_ultima_atualizacao IS 'Data da Última Atualização';
            public       postgres    false    236            �            1259    98229    projeto_id_seq    SEQUENCE     p   CREATE SEQUENCE projeto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.projeto_id_seq;
       public       postgres    false    6    236            O           0    0    projeto_id_seq    SEQUENCE OWNED BY     3   ALTER SEQUENCE projeto_id_seq OWNED BY projeto.id;
            public       postgres    false    237                       1259    98780    regras    TABLE     q   CREATE TABLE regras (
    id integer NOT NULL,
    permissao_id integer,
    descricao character varying(255)
);
    DROP TABLE public.regras;
       public         postgres    false    6                        1259    98778    regras_id_seq    SEQUENCE     o   CREATE SEQUENCE regras_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.regras_id_seq;
       public       postgres    false    257    6            P           0    0    regras_id_seq    SEQUENCE OWNED BY     1   ALTER SEQUENCE regras_id_seq OWNED BY regras.id;
            public       postgres    false    256            �            1259    98231    reuniao    TABLE     X  CREATE TABLE reuniao (
    id integer NOT NULL,
    titulo character varying(255),
    projeto_id integer,
    data date,
    pauta text,
    ata text,
    observacao text,
    convidados_externos text,
    local character varying(255),
    status integer DEFAULT 1,
    hora_inicio character varying(10),
    hora_fim character varying(10)
);
    DROP TABLE public.reuniao;
       public         postgres    false    6            Q           0    0    reuniao    ACL     �   REVOKE ALL ON TABLE reuniao FROM PUBLIC;
REVOKE ALL ON TABLE reuniao FROM postgres;
GRANT ALL ON TABLE reuniao TO postgres;
GRANT ALL ON TABLE reuniao TO PUBLIC;
            public       postgres    false    238            �            1259    98238    reuniao_conhecedor    TABLE     m   CREATE TABLE reuniao_conhecedor (
    id integer NOT NULL,
    reuniao_id integer,
    usuario_id integer
);
 &   DROP TABLE public.reuniao_conhecedor;
       public         postgres    false    6            R           0    0    reuniao_conhecedor    ACL     �   REVOKE ALL ON TABLE reuniao_conhecedor FROM PUBLIC;
REVOKE ALL ON TABLE reuniao_conhecedor FROM postgres;
GRANT ALL ON TABLE reuniao_conhecedor TO postgres;
GRANT ALL ON TABLE reuniao_conhecedor TO PUBLIC;
            public       postgres    false    239            �            1259    98241    reuniao_conhecedor_id_seq    SEQUENCE     {   CREATE SEQUENCE reuniao_conhecedor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.reuniao_conhecedor_id_seq;
       public       postgres    false    239    6            S           0    0    reuniao_conhecedor_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE reuniao_conhecedor_id_seq OWNED BY reuniao_conhecedor.id;
            public       postgres    false    240            T           0    0    reuniao_conhecedor_id_seq    ACL     �   REVOKE ALL ON SEQUENCE reuniao_conhecedor_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE reuniao_conhecedor_id_seq FROM postgres;
GRANT ALL ON SEQUENCE reuniao_conhecedor_id_seq TO postgres;
GRANT ALL ON SEQUENCE reuniao_conhecedor_id_seq TO PUBLIC;
            public       postgres    false    240            �            1259    98243    reuniao_email_externo    TABLE     z   CREATE TABLE reuniao_email_externo (
    id integer NOT NULL,
    reuniao_id integer,
    email character varying(255)
);
 )   DROP TABLE public.reuniao_email_externo;
       public         postgres    false    6            U           0    0    reuniao_email_externo    ACL     �   REVOKE ALL ON TABLE reuniao_email_externo FROM PUBLIC;
REVOKE ALL ON TABLE reuniao_email_externo FROM postgres;
GRANT ALL ON TABLE reuniao_email_externo TO postgres;
GRANT ALL ON TABLE reuniao_email_externo TO PUBLIC;
            public       postgres    false    241            �            1259    98246    reuniao_email_externo_id_seq    SEQUENCE     ~   CREATE SEQUENCE reuniao_email_externo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.reuniao_email_externo_id_seq;
       public       postgres    false    6    241            V           0    0    reuniao_email_externo_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE reuniao_email_externo_id_seq OWNED BY reuniao_email_externo.id;
            public       postgres    false    242            W           0    0    reuniao_email_externo_id_seq    ACL       REVOKE ALL ON SEQUENCE reuniao_email_externo_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE reuniao_email_externo_id_seq FROM postgres;
GRANT ALL ON SEQUENCE reuniao_email_externo_id_seq TO postgres;
GRANT ALL ON SEQUENCE reuniao_email_externo_id_seq TO PUBLIC;
            public       postgres    false    242            �            1259    98248    reuniao_id_seq    SEQUENCE     p   CREATE SEQUENCE reuniao_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.reuniao_id_seq;
       public       postgres    false    238    6            X           0    0    reuniao_id_seq    SEQUENCE OWNED BY     3   ALTER SEQUENCE reuniao_id_seq OWNED BY reuniao.id;
            public       postgres    false    243            Y           0    0    reuniao_id_seq    ACL     �   REVOKE ALL ON SEQUENCE reuniao_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE reuniao_id_seq FROM postgres;
GRANT ALL ON SEQUENCE reuniao_id_seq TO postgres;
GRANT ALL ON SEQUENCE reuniao_id_seq TO PUBLIC;
            public       postgres    false    243            �            1259    98250    reuniao_participante    TABLE     o   CREATE TABLE reuniao_participante (
    id integer NOT NULL,
    reuniao_id integer,
    usuario_id integer
);
 (   DROP TABLE public.reuniao_participante;
       public         postgres    false    6            Z           0    0    reuniao_participante    ACL     �   REVOKE ALL ON TABLE reuniao_participante FROM PUBLIC;
REVOKE ALL ON TABLE reuniao_participante FROM postgres;
GRANT ALL ON TABLE reuniao_participante TO postgres;
GRANT ALL ON TABLE reuniao_participante TO PUBLIC;
            public       postgres    false    244            �            1259    98253    reuniao_participante_id_seq    SEQUENCE     }   CREATE SEQUENCE reuniao_participante_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.reuniao_participante_id_seq;
       public       postgres    false    244    6            [           0    0    reuniao_participante_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE reuniao_participante_id_seq OWNED BY reuniao_participante.id;
            public       postgres    false    245            \           0    0    reuniao_participante_id_seq    ACL     �   REVOKE ALL ON SEQUENCE reuniao_participante_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE reuniao_participante_id_seq FROM postgres;
GRANT ALL ON SEQUENCE reuniao_participante_id_seq TO postgres;
GRANT ALL ON SEQUENCE reuniao_participante_id_seq TO PUBLIC;
            public       postgres    false    245            �            1259    98255    setor    TABLE     �   CREATE TABLE setor (
    id integer NOT NULL,
    titulo character varying(255),
    status integer DEFAULT 1,
    tipo integer
);
    DROP TABLE public.setor;
       public         postgres    false    6            ]           0    0    setor    ACL     �   REVOKE ALL ON TABLE setor FROM PUBLIC;
REVOKE ALL ON TABLE setor FROM postgres;
GRANT ALL ON TABLE setor TO postgres;
GRANT ALL ON TABLE setor TO PUBLIC;
            public       postgres    false    246            �            1259    98259    setor_id_seq    SEQUENCE     n   CREATE SEQUENCE setor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.setor_id_seq;
       public       postgres    false    6    246            ^           0    0    setor_id_seq    SEQUENCE OWNED BY     /   ALTER SEQUENCE setor_id_seq OWNED BY setor.id;
            public       postgres    false    247            _           0    0    setor_id_seq    ACL     �   REVOKE ALL ON SEQUENCE setor_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE setor_id_seq FROM postgres;
GRANT ALL ON SEQUENCE setor_id_seq TO postgres;
GRANT ALL ON SEQUENCE setor_id_seq TO PUBLIC;
            public       postgres    false    247            �            1259    98261    tarefa    TABLE     �  CREATE TABLE tarefa (
    id integer NOT NULL,
    titulo character varying(255),
    data_inicio_previsto date,
    data_fim_previsto date,
    concluido integer DEFAULT 0,
    data_conclusao date,
    status integer DEFAULT 1,
    comentario text,
    lembrete date,
    arquivo character varying(255),
    arquivo_dir character varying(255),
    responsavel_id integer,
    supervisor_id integer,
    prioridade character varying(10),
    reuniao_id integer,
    acao_id integer
);
    DROP TABLE public.tarefa;
       public         postgres    false    6            `           0    0    tarefa    ACL     �   REVOKE ALL ON TABLE tarefa FROM PUBLIC;
REVOKE ALL ON TABLE tarefa FROM postgres;
GRANT ALL ON TABLE tarefa TO postgres;
GRANT ALL ON TABLE tarefa TO PUBLIC;
            public       postgres    false    248            �            1259    98269    terefa_id_seq    SEQUENCE     o   CREATE SEQUENCE terefa_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.terefa_id_seq;
       public       postgres    false    6    248            a           0    0    terefa_id_seq    SEQUENCE OWNED BY     1   ALTER SEQUENCE terefa_id_seq OWNED BY tarefa.id;
            public       postgres    false    249            b           0    0    terefa_id_seq    ACL     �   REVOKE ALL ON SEQUENCE terefa_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE terefa_id_seq FROM postgres;
GRANT ALL ON SEQUENCE terefa_id_seq TO postgres;
GRANT ALL ON SEQUENCE terefa_id_seq TO PUBLIC;
            public       postgres    false    249            �            1259    98271    usuario    TABLE     S  CREATE TABLE usuario (
    id integer NOT NULL,
    login character varying(255),
    senha character varying(50),
    status integer DEFAULT 1,
    lembrete_senha character varying(255),
    foto character varying(255),
    enviado integer,
    pessoa_id integer,
    cargo_id integer,
    vinculo_id integer,
    cpf character varying(45),
    rg character varying(45),
    grupo_id integer,
    departamento_id integer,
    setor_id integer,
    chefe integer DEFAULT 0,
    imagem_perfil character varying(255),
    diretorio_imagem_perfil character varying(255),
    endereco_id integer
);
    DROP TABLE public.usuario;
       public         postgres    false    6            �            1259    98279    usuario_id_seq    SEQUENCE     p   CREATE SEQUENCE usuario_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.usuario_id_seq;
       public       postgres    false    250    6            c           0    0    usuario_id_seq    SEQUENCE OWNED BY     3   ALTER SEQUENCE usuario_id_seq OWNED BY usuario.id;
            public       postgres    false    251            �            1259    98281    vinculo    TABLE     �   CREATE TABLE vinculo (
    id integer NOT NULL,
    titulo character varying(255),
    status integer DEFAULT 1,
    created timestamp without time zone,
    modified timestamp without time zone
);
    DROP TABLE public.vinculo;
       public         postgres    false    6            �            1259    98285    vinculo_id_seq    SEQUENCE     p   CREATE SEQUENCE vinculo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.vinculo_id_seq;
       public       postgres    false    6    252            d           0    0    vinculo_id_seq    SEQUENCE OWNED BY     3   ALTER SEQUENCE vinculo_id_seq OWNED BY vinculo.id;
            public       postgres    false    253            �	           2604    98287    id    DEFAULT     T   ALTER TABLE ONLY acao ALTER COLUMN id SET DEFAULT nextval('acao_id_seq'::regclass);
 6   ALTER TABLE public.acao ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    169    168            �	           2604    98288    id    DEFAULT     j   ALTER TABLE ONLY acao_plano_acao ALTER COLUMN id SET DEFAULT nextval('acao_plano_acao_id_seq'::regclass);
 A   ALTER TABLE public.acao_plano_acao ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    171    170            �	           2604    98290    id    DEFAULT     \   ALTER TABLE ONLY anomalia ALTER COLUMN id SET DEFAULT nextval('anomalia_id_seq'::regclass);
 :   ALTER TABLE public.anomalia ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    173    172            �	           2604    98293    id    DEFAULT     ^   ALTER TABLE ONLY auditoria ALTER COLUMN id SET DEFAULT nextval('auditoria_id_seq'::regclass);
 ;   ALTER TABLE public.auditoria ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    177    174            �	           2604    98294    id    DEFAULT     l   ALTER TABLE ONLY auditoria_campos ALTER COLUMN id SET DEFAULT nextval('auditoria_campos_id_seq'::regclass);
 B   ALTER TABLE public.auditoria_campos ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    176    175            �	           2604    98295    id    DEFAULT     V   ALTER TABLE ONLY cargo ALTER COLUMN id SET DEFAULT nextval('cargo_id_seq'::regclass);
 7   ALTER TABLE public.cargo ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    179    178            �	           2604    98296    id    DEFAULT     ^   ALTER TABLE ONLY categoria ALTER COLUMN id SET DEFAULT nextval('categoria_id_seq'::regclass);
 ;   ALTER TABLE public.categoria ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    181    180            �	           2604    98297    id    DEFAULT     `   ALTER TABLE ONLY comentario ALTER COLUMN id SET DEFAULT nextval('comentario_id_seq'::regclass);
 <   ALTER TABLE public.comentario ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    183    182            �	           2604    98298    id    DEFAULT     b   ALTER TABLE ONLY comunicacao ALTER COLUMN id SET DEFAULT nextval('comunicacao_id_seq'::regclass);
 =   ALTER TABLE public.comunicacao ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    185    184            �	           2604    98299    id    DEFAULT     d   ALTER TABLE ONLY departamento ALTER COLUMN id SET DEFAULT nextval('departamento_id_seq'::regclass);
 >   ALTER TABLE public.departamento ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    187    186            �	           2604    98300    id    DEFAULT     \   ALTER TABLE ONLY dimensao ALTER COLUMN id SET DEFAULT nextval('dimensao_id_seq'::regclass);
 :   ALTER TABLE public.dimensao ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    189    188            �	           2604    98301    id    DEFAULT     Z   ALTER TABLE ONLY empresa ALTER COLUMN id SET DEFAULT nextval('empresa_id_seq'::regclass);
 9   ALTER TABLE public.empresa ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    191    190            �	           2604    98302    id    DEFAULT     \   ALTER TABLE ONLY endereco ALTER COLUMN id SET DEFAULT nextval('endereco_id_seq'::regclass);
 :   ALTER TABLE public.endereco ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    193    192            �	           2604    98303    id    DEFAULT     f   ALTER TABLE ONLY esqueci_senha ALTER COLUMN id SET DEFAULT nextval('esqueci_senha_id_seq'::regclass);
 ?   ALTER TABLE public.esqueci_senha ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    195    194            �	           2604    98304    id    DEFAULT     V   ALTER TABLE ONLY faixa ALTER COLUMN id SET DEFAULT nextval('faixa_id_seq'::regclass);
 7   ALTER TABLE public.faixa ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    197    196            �	           2604    98305    id    DEFAULT     V   ALTER TABLE ONLY grupo ALTER COLUMN id SET DEFAULT nextval('grupo_id_seq'::regclass);
 7   ALTER TABLE public.grupo ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    199    198            �	           2604    98306    id    DEFAULT     ^   ALTER TABLE ONLY indicador ALTER COLUMN id SET DEFAULT nextval('indicador_id_seq'::regclass);
 ;   ALTER TABLE public.indicador ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    203    200            �	           2604    98307    id    DEFAULT     �   ALTER TABLE ONLY indicador_autorizado_visualizar ALTER COLUMN id SET DEFAULT nextval('indicador_autorizado_visualizar_id_seq'::regclass);
 Q   ALTER TABLE public.indicador_autorizado_visualizar ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    202    201            �	           2604    98308    id    DEFAULT     h   ALTER TABLE ONLY indicador_meta ALTER COLUMN id SET DEFAULT nextval('indicador_meta_id_seq'::regclass);
 @   ALTER TABLE public.indicador_meta ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    205    204            �	           2604    98309    id    DEFAULT     r   ALTER TABLE ONLY indicador_realizado ALTER COLUMN id SET DEFAULT nextval('indicador_realizado_id_seq'::regclass);
 E   ALTER TABLE public.indicador_realizado ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    207    206            �	           2604    98310    id    DEFAULT     �   ALTER TABLE ONLY indicador_responsavel_meta ALTER COLUMN id SET DEFAULT nextval('indicador_responsavel_meta_id_seq'::regclass);
 L   ALTER TABLE public.indicador_responsavel_meta ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    209    208            �	           2604    98311    id    DEFAULT     �   ALTER TABLE ONLY indicador_responsavel_realizado ALTER COLUMN id SET DEFAULT nextval('indicador_responsavel_realizado_id_seq'::regclass);
 Q   ALTER TABLE public.indicador_responsavel_realizado ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    211    210            �	           2604    98312    id    DEFAULT     \   ALTER TABLE ONLY marcador ALTER COLUMN id SET DEFAULT nextval('marcador_id_seq'::regclass);
 :   ALTER TABLE public.marcador ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    213    212            �	           2604    98313    id    DEFAULT     n   ALTER TABLE ONLY marcador_objetivo ALTER COLUMN id SET DEFAULT nextval('marcador_objetivo_id_seq'::regclass);
 C   ALTER TABLE public.marcador_objetivo ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    215    214            �	           2604    98314    id    DEFAULT     \   ALTER TABLE ONLY objetivo ALTER COLUMN id SET DEFAULT nextval('objetivo_id_seq'::regclass);
 :   ALTER TABLE public.objetivo ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    217    216            �	           2604    98315    id    DEFAULT     l   ALTER TABLE ONLY objetivo_projeto ALTER COLUMN id SET DEFAULT nextval('objetivo_projeto_id_seq'::regclass);
 B   ALTER TABLE public.objetivo_projeto ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    219    218            �	           2604    98316    id    DEFAULT     t   ALTER TABLE ONLY patrocinador_projeto ALTER COLUMN id SET DEFAULT nextval('patrocinador_projeto_id_seq'::regclass);
 F   ALTER TABLE public.patrocinador_projeto ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    221    220            �	           2604    98770    id    DEFAULT     `   ALTER TABLE ONLY permissoes ALTER COLUMN id SET DEFAULT nextval('permissoes_id_seq'::regclass);
 <   ALTER TABLE public.permissoes ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    254    255    255            �	           2604    98317    id    DEFAULT     X   ALTER TABLE ONLY pessoa ALTER COLUMN id SET DEFAULT nextval('pessoa_id_seq'::regclass);
 8   ALTER TABLE public.pessoa ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    225    222            �	           2604    98318    id    DEFAULT     p   ALTER TABLE ONLY pessoa_comunicacao ALTER COLUMN id SET DEFAULT nextval('pessoa_comunicacao_id_seq'::regclass);
 D   ALTER TABLE public.pessoa_comunicacao ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    224    223            �	           2604    98319    id    DEFAULT     `   ALTER TABLE ONLY plano_acao ALTER COLUMN id SET DEFAULT nextval('plano_acao_id_seq'::regclass);
 <   ALTER TABLE public.plano_acao ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    227    226            �	           2604    98320    id    DEFAULT     p   ALTER TABLE ONLY plano_acao_projeto ALTER COLUMN id SET DEFAULT nextval('plano_acao_projeto_id_seq'::regclass);
 D   ALTER TABLE public.plano_acao_projeto ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    229    228            �	           2604    98321    id    DEFAULT     T   ALTER TABLE ONLY post ALTER COLUMN id SET DEFAULT nextval('post_id_seq'::regclass);
 6   ALTER TABLE public.post ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    231    230            �	           2604    98322    id    DEFAULT     d   ALTER TABLE ONLY procedimento ALTER COLUMN id SET DEFAULT nextval('procedimento_id_seq'::regclass);
 >   ALTER TABLE public.procedimento ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    233    232            �	           2604    98323    id    DEFAULT     \   ALTER TABLE ONLY programa ALTER COLUMN id SET DEFAULT nextval('programa_id_seq'::regclass);
 :   ALTER TABLE public.programa ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    235    234            �	           2604    98324    id    DEFAULT     Z   ALTER TABLE ONLY projeto ALTER COLUMN id SET DEFAULT nextval('projeto_id_seq'::regclass);
 9   ALTER TABLE public.projeto ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    237    236            �	           2604    98783    id    DEFAULT     X   ALTER TABLE ONLY regras ALTER COLUMN id SET DEFAULT nextval('regras_id_seq'::regclass);
 8   ALTER TABLE public.regras ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    257    256    257            �	           2604    98325    id    DEFAULT     Z   ALTER TABLE ONLY reuniao ALTER COLUMN id SET DEFAULT nextval('reuniao_id_seq'::regclass);
 9   ALTER TABLE public.reuniao ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    243    238            �	           2604    98326    id    DEFAULT     p   ALTER TABLE ONLY reuniao_conhecedor ALTER COLUMN id SET DEFAULT nextval('reuniao_conhecedor_id_seq'::regclass);
 D   ALTER TABLE public.reuniao_conhecedor ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    240    239            �	           2604    98327    id    DEFAULT     v   ALTER TABLE ONLY reuniao_email_externo ALTER COLUMN id SET DEFAULT nextval('reuniao_email_externo_id_seq'::regclass);
 G   ALTER TABLE public.reuniao_email_externo ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    242    241            �	           2604    98328    id    DEFAULT     t   ALTER TABLE ONLY reuniao_participante ALTER COLUMN id SET DEFAULT nextval('reuniao_participante_id_seq'::regclass);
 F   ALTER TABLE public.reuniao_participante ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    245    244            �	           2604    98329    id    DEFAULT     V   ALTER TABLE ONLY setor ALTER COLUMN id SET DEFAULT nextval('setor_id_seq'::regclass);
 7   ALTER TABLE public.setor ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    247    246            �	           2604    98330    id    DEFAULT     X   ALTER TABLE ONLY tarefa ALTER COLUMN id SET DEFAULT nextval('terefa_id_seq'::regclass);
 8   ALTER TABLE public.tarefa ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    249    248            �	           2604    98331    id    DEFAULT     Z   ALTER TABLE ONLY usuario ALTER COLUMN id SET DEFAULT nextval('usuario_id_seq'::regclass);
 9   ALTER TABLE public.usuario ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    251    250            �	           2604    98332    id    DEFAULT     Z   ALTER TABLE ONLY vinculo ALTER COLUMN id SET DEFAULT nextval('vinculo_id_seq'::regclass);
 9   ALTER TABLE public.vinculo ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    253    252            �
          0    97939    acao 
   TABLE DATA               �   COPY acao (id, titulo, data_inicio_previsto, data_fim_previsto, concluido, data_conclusao, status, observacao, lembrete, andamento, responsavel_id, acao_id, supervisor_id, prioridade, anomalia_id, objetivo_id, projeto_id, marco, ordem) FROM stdin;
    public       postgres    false    168   �      e           0    0    acao_id_seq    SEQUENCE SET     3   SELECT pg_catalog.setval('acao_id_seq', 22, true);
            public       postgres    false    169            �
          0    97949    acao_plano_acao 
   TABLE DATA               >   COPY acao_plano_acao (id, plano_acao_id, acao_id) FROM stdin;
    public       postgres    false    170   �      f           0    0    acao_plano_acao_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('acao_plano_acao_id_seq', 1, false);
            public       postgres    false    171            �
          0    97964    anomalia 
   TABLE DATA               �   COPY anomalia (id, causas_internas, causas_externas, data, indicador_id, status, data_conclusao, identificacao_problema, estratificacao_problema, concluido) FROM stdin;
    public       postgres    false    172          g           0    0    anomalia_id_seq    SEQUENCE SET     6   SELECT pg_catalog.setval('anomalia_id_seq', 1, true);
            public       postgres    false    173            �
          0    97992 	   auditoria 
   TABLE DATA               `   COPY auditoria (id, alias_controller, alias_acao, usuario_id, created, elemento_id) FROM stdin;
    public       postgres    false    174   2       �
          0    97998    auditoria_campos 
   TABLE DATA               h   COPY auditoria_campos (id, alias_model, valor_antigo, valor_novo, auditoria_id, tipo_campo) FROM stdin;
    public       postgres    false    175   �J      h           0    0    auditoria_campos_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('auditoria_campos_id_seq', 1603, true);
            public       postgres    false    176            i           0    0    auditoria_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('auditoria_id_seq', 1126, true);
            public       postgres    false    177            �
          0    98008    cargo 
   TABLE DATA               7   COPY cargo (id, titulo, descricao, status) FROM stdin;
    public       postgres    false    178   �M      j           0    0    cargo_id_seq    SEQUENCE SET     3   SELECT pg_catalog.setval('cargo_id_seq', 9, true);
            public       postgres    false    179            �
          0    98017 	   categoria 
   TABLE DATA               (   COPY categoria (id, titulo) FROM stdin;
    public       postgres    false    180   RN      k           0    0    categoria_id_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('categoria_id_seq', 1, false);
            public       postgres    false    181            �
          0    98025 
   comentario 
   TABLE DATA               I   COPY comentario (id, mensagem, arquivo, usuario_id, acao_id) FROM stdin;
    public       postgres    false    182   oN      l           0    0    comentario_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('comentario_id_seq', 1, false);
            public       postgres    false    183            �
          0    98033    comunicacao 
   TABLE DATA               8   COPY comunicacao (id, titulo, status, tipo) FROM stdin;
    public       postgres    false    184   �N      m           0    0    comunicacao_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('comunicacao_id_seq', 1, false);
            public       postgres    false    185            �
          0    98039    departamento 
   TABLE DATA               3   COPY departamento (id, titulo, status) FROM stdin;
    public       postgres    false    186   �N      n           0    0    departamento_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('departamento_id_seq', 17, true);
            public       postgres    false    187            �
          0    98045    dimensao 
   TABLE DATA               N   COPY dimensao (id, titulo, observacao, ordem, status, empresa_id) FROM stdin;
    public       postgres    false    188   �O      o           0    0    dimensao_id_seq    SEQUENCE SET     6   SELECT pg_catalog.setval('dimensao_id_seq', 5, true);
            public       postgres    false    189            �
          0    98054    empresa 
   TABLE DATA               t   COPY empresa (id, matriz, cnpj, inscricao_estadual, inscricao_municipal, pessoa_id, empresa_id, status) FROM stdin;
    public       postgres    false    190   (P      p           0    0    empresa_id_seq    SEQUENCE SET     5   SELECT pg_catalog.setval('empresa_id_seq', 3, true);
            public       postgres    false    191            �
          0    98063    endereco 
   TABLE DATA               T   COPY endereco (id, logradouro, cep, bairro, cidade, numero, uf, status) FROM stdin;
    public       postgres    false    192   SP      q           0    0    endereco_id_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('endereco_id_seq', 195, true);
            public       postgres    false    193            �
          0    98072    esqueci_senha 
   TABLE DATA               C   COPY esqueci_senha (id, usuario_id, hash, ativo, data) FROM stdin;
    public       postgres    false    194   �Q      r           0    0    esqueci_senha_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('esqueci_senha_id_seq', 5, true);
            public       postgres    false    195            �
          0    98077    faixa 
   TABLE DATA               M   COPY faixa (id, titulo, limite_vermelho, limite_amarelo, status) FROM stdin;
    public       postgres    false    196   �R      s           0    0    faixa_id_seq    SEQUENCE SET     3   SELECT pg_catalog.setval('faixa_id_seq', 2, true);
            public       postgres    false    197            �
          0    98083    grupo 
   TABLE DATA               ,   COPY grupo (id, titulo, status) FROM stdin;
    public       postgres    false    198   �R      t           0    0    grupo_id_seq    SEQUENCE SET     4   SELECT pg_catalog.setval('grupo_id_seq', 12, true);
            public       postgres    false    199            �
          0    98089 	   indicador 
   TABLE DATA               �   COPY indicador (id, titulo, indicador_id, faixa_id, objetivo_id, usuario_id, calculo, desdobramento, projecao, tipo_calculo, tipo, ordem, status, anos, unidade, projeto_id) FROM stdin;
    public       postgres    false    200   /S      �
          0    98100    indicador_autorizado_visualizar 
   TABLE DATA               P   COPY indicador_autorizado_visualizar (id, usuario_id, indicador_id) FROM stdin;
    public       postgres    false    201   �S      u           0    0 &   indicador_autorizado_visualizar_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('indicador_autorizado_visualizar_id_seq', 48, true);
            public       postgres    false    202            v           0    0    indicador_id_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('indicador_id_seq', 19, true);
            public       postgres    false    203            �
          0    98107    indicador_meta 
   TABLE DATA               �   COPY indicador_meta (id, indicador_id, janeiro, fevereiro, marco, abril, maio, junho, julho, agosto, setembro, outubro, novembro, dezembro, ano) FROM stdin;
    public       postgres    false    204   �S      w           0    0    indicador_meta_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('indicador_meta_id_seq', 19, true);
            public       postgres    false    205            �
          0    98115    indicador_realizado 
   TABLE DATA               �   COPY indicador_realizado (id, indicador_id, janeiro, fevereiro, marco, abril, maio, junho, julho, agosto, setembro, outubro, novembro, dezembro, ano) FROM stdin;
    public       postgres    false    206   �S      x           0    0    indicador_realizado_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('indicador_realizado_id_seq', 19, true);
            public       postgres    false    207            �
          0    98123    indicador_responsavel_meta 
   TABLE DATA               K   COPY indicador_responsavel_meta (id, usuario_id, indicador_id) FROM stdin;
    public       postgres    false    208   T      y           0    0 !   indicador_responsavel_meta_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('indicador_responsavel_meta_id_seq', 27, true);
            public       postgres    false    209            �
          0    98128    indicador_responsavel_realizado 
   TABLE DATA               P   COPY indicador_responsavel_realizado (id, usuario_id, indicador_id) FROM stdin;
    public       postgres    false    210   >T      z           0    0 &   indicador_responsavel_realizado_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('indicador_responsavel_realizado_id_seq', 27, true);
            public       postgres    false    211            �
          0    98133    marcador 
   TABLE DATA               :   COPY marcador (id, titulo, status, descricao) FROM stdin;
    public       postgres    false    212   dT      {           0    0    marcador_id_seq    SEQUENCE SET     7   SELECT pg_catalog.setval('marcador_id_seq', 44, true);
            public       postgres    false    213            �
          0    98142    marcador_objetivo 
   TABLE DATA               B   COPY marcador_objetivo (id, marcador_id, objetivo_id) FROM stdin;
    public       postgres    false    214   �W      |           0    0    marcador_objetivo_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('marcador_objetivo_id_seq', 139, true);
            public       postgres    false    215            �
          0    98147    objetivo 
   TABLE DATA               9  COPY objetivo (id, ano, ordem, titulo, dimensao_id, status, tipo, objetivo_id, prioridade, andamento, resultado, providencia, restricao, situacao, situacao_desc, status_medida, data_ultima_atualizacao, pdti_prazo, pdti_indicador, pdti_valor_meta, observacoes, riscos, data_ultima_revisao, usuario_id) FROM stdin;
    public       postgres    false    216   �Y      }           0    0    objetivo_id_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('objetivo_id_seq', 152, true);
            public       postgres    false    217            �
          0    98157    objetivo_projeto 
   TABLE DATA               @   COPY objetivo_projeto (id, projeto_id, objetivo_id) FROM stdin;
    public       postgres    false    218   �c      ~           0    0    objetivo_projeto_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('objetivo_projeto_id_seq', 122, true);
            public       postgres    false    219            �
          0    98162    patrocinador_projeto 
   TABLE DATA               B   COPY patrocinador_projeto (id, projeto_id, pessoa_id) FROM stdin;
    public       postgres    false    220   �d                 0    0    patrocinador_projeto_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('patrocinador_projeto_id_seq', 66, true);
            public       postgres    false    221            �
          0    98767 
   permissoes 
   TABLE DATA               6   COPY permissoes (id, grupo_id, descricao) FROM stdin;
    public       postgres    false    255   e      �           0    0    permissoes_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('permissoes_id_seq', 328, true);
            public       postgres    false    254            �
          0    98167    pessoa 
   TABLE DATA               >   COPY pessoa (id, titulo, tipo, observacao, email) FROM stdin;
    public       postgres    false    222   �f      �
          0    98173    pessoa_comunicacao 
   TABLE DATA               D   COPY pessoa_comunicacao (id, pessoa_id, comunicacao_id) FROM stdin;
    public       postgres    false    223   Zk      �           0    0    pessoa_comunicacao_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('pessoa_comunicacao_id_seq', 1, false);
            public       postgres    false    224            �           0    0    pessoa_id_seq    SEQUENCE SET     6   SELECT pg_catalog.setval('pessoa_id_seq', 191, true);
            public       postgres    false    225            �
          0    98180 
   plano_acao 
   TABLE DATA               >   COPY plano_acao (id, objetivo_id, titulo, status) FROM stdin;
    public       postgres    false    226   wk      �           0    0    plano_acao_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('plano_acao_id_seq', 1, false);
            public       postgres    false    227            �
          0    98186    plano_acao_projeto 
   TABLE DATA               D   COPY plano_acao_projeto (id, projeto_id, plano_acao_id) FROM stdin;
    public       postgres    false    228   �k      �           0    0    plano_acao_projeto_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('plano_acao_projeto_id_seq', 1, false);
            public       postgres    false    229            �
          0    98191    post 
   TABLE DATA               �   COPY post (id, titulo, mensagem, acao_id, receber_email, status, post_id, created, modified, usuario_id, categoria_id, tarefa_id) FROM stdin;
    public       postgres    false    230   �k      �           0    0    post_id_seq    SEQUENCE SET     2   SELECT pg_catalog.setval('post_id_seq', 1, true);
            public       postgres    false    231            �
          0    98201    procedimento 
   TABLE DATA               �   COPY procedimento (id, titulo, resultado_esperado, passos, requisito, arquivo, arquivo_dir, usuario_id, certificado, status) FROM stdin;
    public       postgres    false    232   �k      �           0    0    procedimento_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('procedimento_id_seq', 1, true);
            public       postgres    false    233            �
          0    98210    programa 
   TABLE DATA               Q   COPY programa (id, titulo, data_inicio, data_fim, status, descricao) FROM stdin;
    public       postgres    false    234   �l      �           0    0    programa_id_seq    SEQUENCE SET     7   SELECT pg_catalog.setval('programa_id_seq', 40, true);
            public       postgres    false    235            �
          0    98219    projeto 
   TABLE DATA               �  COPY projeto (id, titulo, data_inicio_previsto, data_fim_previsto, valor, descricao, concluido, data_conclusao, motivacao, resultado, risco, usuario_id, status, custo, moeda, programa_id, email_tarefa, email_acao, gasto, processo, tamanho, perspectiva_temporal, complexidade, importancia_politica, saude_projeto, situacao, url_projeto, parceiros, patrocinador, area_executora, area_cliente, data_ultima_atualizacao) FROM stdin;
    public       postgres    false    236   �l      �           0    0    projeto_id_seq    SEQUENCE SET     7   SELECT pg_catalog.setval('projeto_id_seq', 180, true);
            public       postgres    false    237            �
          0    98780    regras 
   TABLE DATA               6   COPY regras (id, permissao_id, descricao) FROM stdin;
    public       postgres    false    257   �q      �           0    0    regras_id_seq    SEQUENCE SET     6   SELECT pg_catalog.setval('regras_id_seq', 670, true);
            public       postgres    false    256            �
          0    98231    reuniao 
   TABLE DATA               �   COPY reuniao (id, titulo, projeto_id, data, pauta, ata, observacao, convidados_externos, local, status, hora_inicio, hora_fim) FROM stdin;
    public       postgres    false    238   Su      �
          0    98238    reuniao_conhecedor 
   TABLE DATA               A   COPY reuniao_conhecedor (id, reuniao_id, usuario_id) FROM stdin;
    public       postgres    false    239   �u      �           0    0    reuniao_conhecedor_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('reuniao_conhecedor_id_seq', 1, true);
            public       postgres    false    240            �
          0    98243    reuniao_email_externo 
   TABLE DATA               ?   COPY reuniao_email_externo (id, reuniao_id, email) FROM stdin;
    public       postgres    false    241   �u      �           0    0    reuniao_email_externo_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('reuniao_email_externo_id_seq', 1, true);
            public       postgres    false    242            �           0    0    reuniao_id_seq    SEQUENCE SET     5   SELECT pg_catalog.setval('reuniao_id_seq', 1, true);
            public       postgres    false    243            �
          0    98250    reuniao_participante 
   TABLE DATA               C   COPY reuniao_participante (id, reuniao_id, usuario_id) FROM stdin;
    public       postgres    false    244   �u      �           0    0    reuniao_participante_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('reuniao_participante_id_seq', 1, true);
            public       postgres    false    245            �
          0    98255    setor 
   TABLE DATA               2   COPY setor (id, titulo, status, tipo) FROM stdin;
    public       postgres    false    246   �u      �           0    0    setor_id_seq    SEQUENCE SET     4   SELECT pg_catalog.setval('setor_id_seq', 13, true);
            public       postgres    false    247            �
          0    98261    tarefa 
   TABLE DATA               �   COPY tarefa (id, titulo, data_inicio_previsto, data_fim_previsto, concluido, data_conclusao, status, comentario, lembrete, arquivo, arquivo_dir, responsavel_id, supervisor_id, prioridade, reuniao_id, acao_id) FROM stdin;
    public       postgres    false    248   �v      �           0    0    terefa_id_seq    SEQUENCE SET     4   SELECT pg_catalog.setval('terefa_id_seq', 4, true);
            public       postgres    false    249            �
          0    98271    usuario 
   TABLE DATA               �   COPY usuario (id, login, senha, status, lembrete_senha, foto, enviado, pessoa_id, cargo_id, vinculo_id, cpf, rg, grupo_id, departamento_id, setor_id, chefe, imagem_perfil, diretorio_imagem_perfil, endereco_id) FROM stdin;
    public       postgres    false    250   �w      �           0    0    usuario_id_seq    SEQUENCE SET     7   SELECT pg_catalog.setval('usuario_id_seq', 116, true);
            public       postgres    false    251            �
          0    98281    vinculo 
   TABLE DATA               A   COPY vinculo (id, titulo, status, created, modified) FROM stdin;
    public       postgres    false    252   ~      �           0    0    vinculo_id_seq    SEQUENCE SET     5   SELECT pg_catalog.setval('vinculo_id_seq', 1, true);
            public       postgres    false    253            �	           2606    98334 	   acao_pkey 
   CONSTRAINT     E   ALTER TABLE ONLY acao
    ADD CONSTRAINT acao_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.acao DROP CONSTRAINT acao_pkey;
       public         postgres    false    168    168            �	           2606    98336    acao_plano_acao_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY acao_plano_acao
    ADD CONSTRAINT acao_plano_acao_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.acao_plano_acao DROP CONSTRAINT acao_plano_acao_pkey;
       public         postgres    false    170    170            �	           2606    98340    anomalia_pkey 
   CONSTRAINT     M   ALTER TABLE ONLY anomalia
    ADD CONSTRAINT anomalia_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.anomalia DROP CONSTRAINT anomalia_pkey;
       public         postgres    false    172    172            �	           2606    98346    auditoria_campos_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY auditoria_campos
    ADD CONSTRAINT auditoria_campos_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.auditoria_campos DROP CONSTRAINT auditoria_campos_pkey;
       public         postgres    false    175    175            �	           2606    98348    auditoria_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY auditoria
    ADD CONSTRAINT auditoria_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.auditoria DROP CONSTRAINT auditoria_pkey;
       public         postgres    false    174    174             
           2606    98350 
   cargo_pkey 
   CONSTRAINT     G   ALTER TABLE ONLY cargo
    ADD CONSTRAINT cargo_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.cargo DROP CONSTRAINT cargo_pkey;
       public         postgres    false    178    178            
           2606    98352    comentario_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY comentario
    ADD CONSTRAINT comentario_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.comentario DROP CONSTRAINT comentario_pkey;
       public         postgres    false    182    182            
           2606    98354    comunicacao_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY comunicacao
    ADD CONSTRAINT comunicacao_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.comunicacao DROP CONSTRAINT comunicacao_pkey;
       public         postgres    false    184    184            
           2606    98356    departamento_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY departamento
    ADD CONSTRAINT departamento_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.departamento DROP CONSTRAINT departamento_pkey;
       public         postgres    false    186    186            

           2606    98358    dimensao_pkey 
   CONSTRAINT     M   ALTER TABLE ONLY dimensao
    ADD CONSTRAINT dimensao_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.dimensao DROP CONSTRAINT dimensao_pkey;
       public         postgres    false    188    188            
           2606    98360    empresa_pkey 
   CONSTRAINT     K   ALTER TABLE ONLY empresa
    ADD CONSTRAINT empresa_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.empresa DROP CONSTRAINT empresa_pkey;
       public         postgres    false    190    190            
           2606    98362    endereco_pkey 
   CONSTRAINT     M   ALTER TABLE ONLY endereco
    ADD CONSTRAINT endereco_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.endereco DROP CONSTRAINT endereco_pkey;
       public         postgres    false    192    192            
           2606    98364    esqueci_senha_hash_key 
   CONSTRAINT     X   ALTER TABLE ONLY esqueci_senha
    ADD CONSTRAINT esqueci_senha_hash_key UNIQUE (hash);
 N   ALTER TABLE ONLY public.esqueci_senha DROP CONSTRAINT esqueci_senha_hash_key;
       public         postgres    false    194    194            
           2606    98366    esqueci_senha_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY esqueci_senha
    ADD CONSTRAINT esqueci_senha_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.esqueci_senha DROP CONSTRAINT esqueci_senha_pkey;
       public         postgres    false    194    194            
           2606    98368 
   faixa_pkey 
   CONSTRAINT     G   ALTER TABLE ONLY faixa
    ADD CONSTRAINT faixa_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.faixa DROP CONSTRAINT faixa_pkey;
       public         postgres    false    196    196            
           2606    98370 
   grupo_pkey 
   CONSTRAINT     G   ALTER TABLE ONLY grupo
    ADD CONSTRAINT grupo_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.grupo DROP CONSTRAINT grupo_pkey;
       public         postgres    false    198    198            
           2606    98372    id 
   CONSTRAINT     C   ALTER TABLE ONLY categoria
    ADD CONSTRAINT id PRIMARY KEY (id);
 6   ALTER TABLE ONLY public.categoria DROP CONSTRAINT id;
       public         postgres    false    180    180            
           2606    98374 $   indicador_autorizado_visualizar_pkey 
   CONSTRAINT     {   ALTER TABLE ONLY indicador_autorizado_visualizar
    ADD CONSTRAINT indicador_autorizado_visualizar_pkey PRIMARY KEY (id);
 n   ALTER TABLE ONLY public.indicador_autorizado_visualizar DROP CONSTRAINT indicador_autorizado_visualizar_pkey;
       public         postgres    false    201    201            
           2606    98376    indicador_meta_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY indicador_meta
    ADD CONSTRAINT indicador_meta_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.indicador_meta DROP CONSTRAINT indicador_meta_pkey;
       public         postgres    false    204    204            
           2606    98378    indicador_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY indicador
    ADD CONSTRAINT indicador_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.indicador DROP CONSTRAINT indicador_pkey;
       public         postgres    false    200    200            
           2606    98380    indicador_realizado_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY indicador_realizado
    ADD CONSTRAINT indicador_realizado_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.indicador_realizado DROP CONSTRAINT indicador_realizado_pkey;
       public         postgres    false    206    206            !
           2606    98382    indicador_responsavel_meta_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY indicador_responsavel_meta
    ADD CONSTRAINT indicador_responsavel_meta_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.indicador_responsavel_meta DROP CONSTRAINT indicador_responsavel_meta_pkey;
       public         postgres    false    208    208            #
           2606    98384 $   indicador_responsavel_realizado_pkey 
   CONSTRAINT     {   ALTER TABLE ONLY indicador_responsavel_realizado
    ADD CONSTRAINT indicador_responsavel_realizado_pkey PRIMARY KEY (id);
 n   ALTER TABLE ONLY public.indicador_responsavel_realizado DROP CONSTRAINT indicador_responsavel_realizado_pkey;
       public         postgres    false    210    210            %
           2606    98386    marcado_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY marcador
    ADD CONSTRAINT marcado_pkey PRIMARY KEY (id);
 ?   ALTER TABLE ONLY public.marcador DROP CONSTRAINT marcado_pkey;
       public         postgres    false    212    212            '
           2606    98388    marcador_objetivo_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY marcador_objetivo
    ADD CONSTRAINT marcador_objetivo_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.marcador_objetivo DROP CONSTRAINT marcador_objetivo_pkey;
       public         postgres    false    214    214            )
           2606    98390    objetivo_pkey 
   CONSTRAINT     M   ALTER TABLE ONLY objetivo
    ADD CONSTRAINT objetivo_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.objetivo DROP CONSTRAINT objetivo_pkey;
       public         postgres    false    216    216            +
           2606    98392    patrocinador_projeto_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY patrocinador_projeto
    ADD CONSTRAINT patrocinador_projeto_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.patrocinador_projeto DROP CONSTRAINT patrocinador_projeto_pkey;
       public         postgres    false    220    220            O
           2606    98772    permissoes_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY permissoes
    ADD CONSTRAINT permissoes_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.permissoes DROP CONSTRAINT permissoes_pkey;
       public         postgres    false    255    255            /
           2606    98394    pessoa_comunicacao_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY pessoa_comunicacao
    ADD CONSTRAINT pessoa_comunicacao_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.pessoa_comunicacao DROP CONSTRAINT pessoa_comunicacao_pkey;
       public         postgres    false    223    223            -
           2606    98396    pessoa_pkey 
   CONSTRAINT     I   ALTER TABLE ONLY pessoa
    ADD CONSTRAINT pessoa_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.pessoa DROP CONSTRAINT pessoa_pkey;
       public         postgres    false    222    222            1
           2606    98398    plano_acao_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY plano_acao
    ADD CONSTRAINT plano_acao_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.plano_acao DROP CONSTRAINT plano_acao_pkey;
       public         postgres    false    226    226            3
           2606    98400    plano_acao_projeto_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY plano_acao_projeto
    ADD CONSTRAINT plano_acao_projeto_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.plano_acao_projeto DROP CONSTRAINT plano_acao_projeto_pkey;
       public         postgres    false    228    228            6
           2606    98402 	   post_pkey 
   CONSTRAINT     E   ALTER TABLE ONLY post
    ADD CONSTRAINT post_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.post DROP CONSTRAINT post_pkey;
       public         postgres    false    230    230            8
           2606    98404    procedimento_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY procedimento
    ADD CONSTRAINT procedimento_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.procedimento DROP CONSTRAINT procedimento_pkey;
       public         postgres    false    232    232            :
           2606    98406    programa_pkey 
   CONSTRAINT     M   ALTER TABLE ONLY programa
    ADD CONSTRAINT programa_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.programa DROP CONSTRAINT programa_pkey;
       public         postgres    false    234    234            =
           2606    98408    projeto_pkey 
   CONSTRAINT     K   ALTER TABLE ONLY projeto
    ADD CONSTRAINT projeto_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.projeto DROP CONSTRAINT projeto_pkey;
       public         postgres    false    236    236            Q
           2606    98785    regras_pkey 
   CONSTRAINT     I   ALTER TABLE ONLY regras
    ADD CONSTRAINT regras_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.regras DROP CONSTRAINT regras_pkey;
       public         postgres    false    257    257            A
           2606    98410    reuniao_conhecedor_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY reuniao_conhecedor
    ADD CONSTRAINT reuniao_conhecedor_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.reuniao_conhecedor DROP CONSTRAINT reuniao_conhecedor_pkey;
       public         postgres    false    239    239            C
           2606    98412    reuniao_email_externo_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY reuniao_email_externo
    ADD CONSTRAINT reuniao_email_externo_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.reuniao_email_externo DROP CONSTRAINT reuniao_email_externo_pkey;
       public         postgres    false    241    241            E
           2606    98414    reuniao_participante_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY reuniao_participante
    ADD CONSTRAINT reuniao_participante_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.reuniao_participante DROP CONSTRAINT reuniao_participante_pkey;
       public         postgres    false    244    244            ?
           2606    98416    reuniao_pkey 
   CONSTRAINT     K   ALTER TABLE ONLY reuniao
    ADD CONSTRAINT reuniao_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.reuniao DROP CONSTRAINT reuniao_pkey;
       public         postgres    false    238    238            G
           2606    98418 
   setor_pkey 
   CONSTRAINT     G   ALTER TABLE ONLY setor
    ADD CONSTRAINT setor_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.setor DROP CONSTRAINT setor_pkey;
       public         postgres    false    246    246            I
           2606    98420    terefa_pkey 
   CONSTRAINT     I   ALTER TABLE ONLY tarefa
    ADD CONSTRAINT terefa_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.tarefa DROP CONSTRAINT terefa_pkey;
       public         postgres    false    248    248            K
           2606    98422    usuario_pkey 
   CONSTRAINT     K   ALTER TABLE ONLY usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuario_pkey;
       public         postgres    false    250    250            M
           2606    98424    vinculo_pkey 
   CONSTRAINT     K   ALTER TABLE ONLY vinculo
    ADD CONSTRAINT vinculo_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.vinculo DROP CONSTRAINT vinculo_pkey;
       public         postgres    false    252    252            
           1259    98426    fki_projeto_indicador_fkey    INDEX     O   CREATE INDEX fki_projeto_indicador_fkey ON indicador USING btree (projeto_id);
 .   DROP INDEX public.fki_projeto_indicador_fkey;
       public         postgres    false    200            ;
           1259    98427    fki_projeto_programa_fkey    INDEX     M   CREATE INDEX fki_projeto_programa_fkey ON projeto USING btree (programa_id);
 -   DROP INDEX public.fki_projeto_programa_fkey;
       public         postgres    false    236            4
           1259    98428    fki_tarefa_pfkey_id    INDEX     B   CREATE INDEX fki_tarefa_pfkey_id ON post USING btree (tarefa_id);
 '   DROP INDEX public.fki_tarefa_pfkey_id;
       public         postgres    false    230            R
           2606    98429    acao_acao_id_fkey    FK CONSTRAINT     f   ALTER TABLE ONLY acao
    ADD CONSTRAINT acao_acao_id_fkey FOREIGN KEY (acao_id) REFERENCES acao(id);
 @   ALTER TABLE ONLY public.acao DROP CONSTRAINT acao_acao_id_fkey;
       public       postgres    false    2550    168    168            S
           2606    98434    acao_anomalia_id_fkey    FK CONSTRAINT     r   ALTER TABLE ONLY acao
    ADD CONSTRAINT acao_anomalia_id_fkey FOREIGN KEY (anomalia_id) REFERENCES anomalia(id);
 D   ALTER TABLE ONLY public.acao DROP CONSTRAINT acao_anomalia_id_fkey;
       public       postgres    false    168    172    2554            T
           2606    98439    acao_objetivo_id_fkey    FK CONSTRAINT     r   ALTER TABLE ONLY acao
    ADD CONSTRAINT acao_objetivo_id_fkey FOREIGN KEY (objetivo_id) REFERENCES objetivo(id);
 D   ALTER TABLE ONLY public.acao DROP CONSTRAINT acao_objetivo_id_fkey;
       public       postgres    false    168    216    2601            X
           2606    98444    acao_plano_acao_acao_id_fkey    FK CONSTRAINT     |   ALTER TABLE ONLY acao_plano_acao
    ADD CONSTRAINT acao_plano_acao_acao_id_fkey FOREIGN KEY (acao_id) REFERENCES acao(id);
 V   ALTER TABLE ONLY public.acao_plano_acao DROP CONSTRAINT acao_plano_acao_acao_id_fkey;
       public       postgres    false    170    168    2550            Y
           2606    98449 "   acao_plano_acao_plano_acao_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY acao_plano_acao
    ADD CONSTRAINT acao_plano_acao_plano_acao_id_fkey FOREIGN KEY (plano_acao_id) REFERENCES plano_acao(id);
 \   ALTER TABLE ONLY public.acao_plano_acao DROP CONSTRAINT acao_plano_acao_plano_acao_id_fkey;
       public       postgres    false    170    226    2609            U
           2606    98454    acao_projeto_id_fkey    FK CONSTRAINT     z   ALTER TABLE ONLY acao
    ADD CONSTRAINT acao_projeto_id_fkey FOREIGN KEY (projeto_id) REFERENCES projeto(id) DEFERRABLE;
 C   ALTER TABLE ONLY public.acao DROP CONSTRAINT acao_projeto_id_fkey;
       public       postgres    false    2621    236    168            V
           2606    98459    acao_responsavel_id_fkey    FK CONSTRAINT     w   ALTER TABLE ONLY acao
    ADD CONSTRAINT acao_responsavel_id_fkey FOREIGN KEY (responsavel_id) REFERENCES usuario(id);
 G   ALTER TABLE ONLY public.acao DROP CONSTRAINT acao_responsavel_id_fkey;
       public       postgres    false    168    250    2635            W
           2606    98464    acao_supervisor_id_fkey    FK CONSTRAINT     u   ALTER TABLE ONLY acao
    ADD CONSTRAINT acao_supervisor_id_fkey FOREIGN KEY (supervisor_id) REFERENCES usuario(id);
 F   ALTER TABLE ONLY public.acao DROP CONSTRAINT acao_supervisor_id_fkey;
       public       postgres    false    2635    168    250            Z
           2606    98469    anomalia_indicador_id_fkey    FK CONSTRAINT     }   ALTER TABLE ONLY anomalia
    ADD CONSTRAINT anomalia_indicador_id_fkey FOREIGN KEY (indicador_id) REFERENCES indicador(id);
 M   ALTER TABLE ONLY public.anomalia DROP CONSTRAINT anomalia_indicador_id_fkey;
       public       postgres    false    200    172    2585            \
           2606    98474 "   auditoria_campos_auditoria_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY auditoria_campos
    ADD CONSTRAINT auditoria_campos_auditoria_id_fkey FOREIGN KEY (auditoria_id) REFERENCES auditoria(id);
 ]   ALTER TABLE ONLY public.auditoria_campos DROP CONSTRAINT auditoria_campos_auditoria_id_fkey;
       public       postgres    false    2556    174    175            [
           2606    98479    auditoria_usuario_id_fkey    FK CONSTRAINT     y   ALTER TABLE ONLY auditoria
    ADD CONSTRAINT auditoria_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES usuario(id);
 M   ALTER TABLE ONLY public.auditoria DROP CONSTRAINT auditoria_usuario_id_fkey;
       public       postgres    false    174    250    2635            ]
           2606    98484    comentario_acao_id_fkey    FK CONSTRAINT     r   ALTER TABLE ONLY comentario
    ADD CONSTRAINT comentario_acao_id_fkey FOREIGN KEY (acao_id) REFERENCES acao(id);
 L   ALTER TABLE ONLY public.comentario DROP CONSTRAINT comentario_acao_id_fkey;
       public       postgres    false    182    168    2550            ^
           2606    98489    comentario_usuario_id_fkey    FK CONSTRAINT     {   ALTER TABLE ONLY comentario
    ADD CONSTRAINT comentario_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES usuario(id);
 O   ALTER TABLE ONLY public.comentario DROP CONSTRAINT comentario_usuario_id_fkey;
       public       postgres    false    182    2635    250            _
           2606    98494    dimensao_empresa_id_fkey    FK CONSTRAINT     w   ALTER TABLE ONLY dimensao
    ADD CONSTRAINT dimensao_empresa_id_fkey FOREIGN KEY (empresa_id) REFERENCES empresa(id);
 K   ALTER TABLE ONLY public.dimensao DROP CONSTRAINT dimensao_empresa_id_fkey;
       public       postgres    false    2572    190    188            `
           2606    98499    empresa_empresa_id_fkey    FK CONSTRAINT     u   ALTER TABLE ONLY empresa
    ADD CONSTRAINT empresa_empresa_id_fkey FOREIGN KEY (empresa_id) REFERENCES empresa(id);
 I   ALTER TABLE ONLY public.empresa DROP CONSTRAINT empresa_empresa_id_fkey;
       public       postgres    false    190    2572    190            a
           2606    98504    empresa_pessoa_id_fkey    FK CONSTRAINT     r   ALTER TABLE ONLY empresa
    ADD CONSTRAINT empresa_pessoa_id_fkey FOREIGN KEY (pessoa_id) REFERENCES pessoa(id);
 H   ALTER TABLE ONLY public.empresa DROP CONSTRAINT empresa_pessoa_id_fkey;
       public       postgres    false    2605    222    190            b
           2606    98509    esqueci_senha_usuario_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY esqueci_senha
    ADD CONSTRAINT esqueci_senha_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES usuario(id);
 U   ALTER TABLE ONLY public.esqueci_senha DROP CONSTRAINT esqueci_senha_usuario_id_fkey;
       public       postgres    false    2635    250    194            h
           2606    98514 1   indicador_autorizado_visualizar_indicador_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY indicador_autorizado_visualizar
    ADD CONSTRAINT indicador_autorizado_visualizar_indicador_id_fkey FOREIGN KEY (indicador_id) REFERENCES indicador(id);
 {   ALTER TABLE ONLY public.indicador_autorizado_visualizar DROP CONSTRAINT indicador_autorizado_visualizar_indicador_id_fkey;
       public       postgres    false    2585    200    201            i
           2606    98519 /   indicador_autorizado_visualizar_usuario_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY indicador_autorizado_visualizar
    ADD CONSTRAINT indicador_autorizado_visualizar_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES usuario(id);
 y   ALTER TABLE ONLY public.indicador_autorizado_visualizar DROP CONSTRAINT indicador_autorizado_visualizar_usuario_id_fkey;
       public       postgres    false    2635    250    201            c
           2606    98524    indicador_faixa_id_fkey    FK CONSTRAINT     s   ALTER TABLE ONLY indicador
    ADD CONSTRAINT indicador_faixa_id_fkey FOREIGN KEY (faixa_id) REFERENCES faixa(id);
 K   ALTER TABLE ONLY public.indicador DROP CONSTRAINT indicador_faixa_id_fkey;
       public       postgres    false    200    196    2580            d
           2606    98529    indicador_indicador_id_fkey    FK CONSTRAINT        ALTER TABLE ONLY indicador
    ADD CONSTRAINT indicador_indicador_id_fkey FOREIGN KEY (indicador_id) REFERENCES indicador(id);
 O   ALTER TABLE ONLY public.indicador DROP CONSTRAINT indicador_indicador_id_fkey;
       public       postgres    false    200    200    2585            j
           2606    98534     indicador_meta_indicador_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY indicador_meta
    ADD CONSTRAINT indicador_meta_indicador_id_fkey FOREIGN KEY (indicador_id) REFERENCES indicador(id);
 Y   ALTER TABLE ONLY public.indicador_meta DROP CONSTRAINT indicador_meta_indicador_id_fkey;
       public       postgres    false    204    200    2585            e
           2606    98539    indicador_objetivo_id_fkey    FK CONSTRAINT     |   ALTER TABLE ONLY indicador
    ADD CONSTRAINT indicador_objetivo_id_fkey FOREIGN KEY (objetivo_id) REFERENCES objetivo(id);
 N   ALTER TABLE ONLY public.indicador DROP CONSTRAINT indicador_objetivo_id_fkey;
       public       postgres    false    2601    216    200            k
           2606    98544 %   indicador_realizado_indicador_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY indicador_realizado
    ADD CONSTRAINT indicador_realizado_indicador_id_fkey FOREIGN KEY (indicador_id) REFERENCES indicador(id);
 c   ALTER TABLE ONLY public.indicador_realizado DROP CONSTRAINT indicador_realizado_indicador_id_fkey;
       public       postgres    false    2585    206    200            l
           2606    98549 ,   indicador_responsavel_meta_indicador_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY indicador_responsavel_meta
    ADD CONSTRAINT indicador_responsavel_meta_indicador_id_fkey FOREIGN KEY (indicador_id) REFERENCES indicador(id);
 q   ALTER TABLE ONLY public.indicador_responsavel_meta DROP CONSTRAINT indicador_responsavel_meta_indicador_id_fkey;
       public       postgres    false    208    200    2585            m
           2606    98554 *   indicador_responsavel_meta_usuario_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY indicador_responsavel_meta
    ADD CONSTRAINT indicador_responsavel_meta_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES usuario(id);
 o   ALTER TABLE ONLY public.indicador_responsavel_meta DROP CONSTRAINT indicador_responsavel_meta_usuario_id_fkey;
       public       postgres    false    250    2635    208            n
           2606    98559 1   indicador_responsavel_realizado_indicador_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY indicador_responsavel_realizado
    ADD CONSTRAINT indicador_responsavel_realizado_indicador_id_fkey FOREIGN KEY (indicador_id) REFERENCES indicador(id);
 {   ALTER TABLE ONLY public.indicador_responsavel_realizado DROP CONSTRAINT indicador_responsavel_realizado_indicador_id_fkey;
       public       postgres    false    210    2585    200            o
           2606    98564 /   indicador_responsavel_realizado_usuario_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY indicador_responsavel_realizado
    ADD CONSTRAINT indicador_responsavel_realizado_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES usuario(id);
 y   ALTER TABLE ONLY public.indicador_responsavel_realizado DROP CONSTRAINT indicador_responsavel_realizado_usuario_id_fkey;
       public       postgres    false    210    250    2635            f
           2606    98569    indicador_usuario_id_fkey    FK CONSTRAINT     y   ALTER TABLE ONLY indicador
    ADD CONSTRAINT indicador_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES usuario(id);
 M   ALTER TABLE ONLY public.indicador DROP CONSTRAINT indicador_usuario_id_fkey;
       public       postgres    false    200    250    2635            p
           2606    98574    marcador_objetivo_marcador_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY marcador_objetivo
    ADD CONSTRAINT marcador_objetivo_marcador_fkey FOREIGN KEY (marcador_id) REFERENCES marcador(id);
 [   ALTER TABLE ONLY public.marcador_objetivo DROP CONSTRAINT marcador_objetivo_marcador_fkey;
       public       postgres    false    214    212    2597            q
           2606    98579    marcador_objetivo_objetivo_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY marcador_objetivo
    ADD CONSTRAINT marcador_objetivo_objetivo_fkey FOREIGN KEY (objetivo_id) REFERENCES objetivo(id);
 [   ALTER TABLE ONLY public.marcador_objetivo DROP CONSTRAINT marcador_objetivo_objetivo_fkey;
       public       postgres    false    214    216    2601            r
           2606    98584    objetivo_dimensao_id_fkey    FK CONSTRAINT     z   ALTER TABLE ONLY objetivo
    ADD CONSTRAINT objetivo_dimensao_id_fkey FOREIGN KEY (dimensao_id) REFERENCES dimensao(id);
 L   ALTER TABLE ONLY public.objetivo DROP CONSTRAINT objetivo_dimensao_id_fkey;
       public       postgres    false    188    2570    216            s
           2606    98589    objetivo_objetivo_id_fkey    FK CONSTRAINT     z   ALTER TABLE ONLY objetivo
    ADD CONSTRAINT objetivo_objetivo_id_fkey FOREIGN KEY (objetivo_id) REFERENCES objetivo(id);
 L   ALTER TABLE ONLY public.objetivo DROP CONSTRAINT objetivo_objetivo_id_fkey;
       public       postgres    false    2601    216    216            t
           2606    98594    objetivo_usuario_id    FK CONSTRAINT     r   ALTER TABLE ONLY objetivo
    ADD CONSTRAINT objetivo_usuario_id FOREIGN KEY (usuario_id) REFERENCES usuario(id);
 F   ALTER TABLE ONLY public.objetivo DROP CONSTRAINT objetivo_usuario_id;
       public       postgres    false    2635    250    216            u
           2606    98599 #   patrocinador_projeto_pessoa_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY patrocinador_projeto
    ADD CONSTRAINT patrocinador_projeto_pessoa_id_fkey FOREIGN KEY (pessoa_id) REFERENCES pessoa(id);
 b   ALTER TABLE ONLY public.patrocinador_projeto DROP CONSTRAINT patrocinador_projeto_pessoa_id_fkey;
       public       postgres    false    220    2605    222            v
           2606    98604 $   patrocinador_projeto_projeto_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY patrocinador_projeto
    ADD CONSTRAINT patrocinador_projeto_projeto_id_fkey FOREIGN KEY (projeto_id) REFERENCES projeto(id);
 c   ALTER TABLE ONLY public.patrocinador_projeto DROP CONSTRAINT patrocinador_projeto_projeto_id_fkey;
       public       postgres    false    2621    220    236            �
           2606    98773    permissoes_grupo_id_fkey    FK CONSTRAINT     u   ALTER TABLE ONLY permissoes
    ADD CONSTRAINT permissoes_grupo_id_fkey FOREIGN KEY (grupo_id) REFERENCES grupo(id);
 M   ALTER TABLE ONLY public.permissoes DROP CONSTRAINT permissoes_grupo_id_fkey;
       public       postgres    false    255    198    2582            w
           2606    98609 &   pessoa_comunicacao_comunicacao_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY pessoa_comunicacao
    ADD CONSTRAINT pessoa_comunicacao_comunicacao_id_fkey FOREIGN KEY (comunicacao_id) REFERENCES comunicacao(id);
 c   ALTER TABLE ONLY public.pessoa_comunicacao DROP CONSTRAINT pessoa_comunicacao_comunicacao_id_fkey;
       public       postgres    false    2566    223    184            x
           2606    98614 !   pessoa_comunicacao_pessoa_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY pessoa_comunicacao
    ADD CONSTRAINT pessoa_comunicacao_pessoa_id_fkey FOREIGN KEY (pessoa_id) REFERENCES pessoa(id);
 ^   ALTER TABLE ONLY public.pessoa_comunicacao DROP CONSTRAINT pessoa_comunicacao_pessoa_id_fkey;
       public       postgres    false    223    222    2605            y
           2606    98619    plano_acao_objetivo_id_fkey    FK CONSTRAINT     ~   ALTER TABLE ONLY plano_acao
    ADD CONSTRAINT plano_acao_objetivo_id_fkey FOREIGN KEY (objetivo_id) REFERENCES objetivo(id);
 P   ALTER TABLE ONLY public.plano_acao DROP CONSTRAINT plano_acao_objetivo_id_fkey;
       public       postgres    false    226    216    2601            z
           2606    98624 %   plano_acao_projeto_plano_acao_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY plano_acao_projeto
    ADD CONSTRAINT plano_acao_projeto_plano_acao_id_fkey FOREIGN KEY (plano_acao_id) REFERENCES plano_acao(id);
 b   ALTER TABLE ONLY public.plano_acao_projeto DROP CONSTRAINT plano_acao_projeto_plano_acao_id_fkey;
       public       postgres    false    228    226    2609            {
           2606    98629 "   plano_acao_projeto_projeto_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY plano_acao_projeto
    ADD CONSTRAINT plano_acao_projeto_projeto_id_fkey FOREIGN KEY (projeto_id) REFERENCES projeto(id);
 _   ALTER TABLE ONLY public.plano_acao_projeto DROP CONSTRAINT plano_acao_projeto_projeto_id_fkey;
       public       postgres    false    236    228    2621            |
           2606    98634    post_acao_id_fkey    FK CONSTRAINT     f   ALTER TABLE ONLY post
    ADD CONSTRAINT post_acao_id_fkey FOREIGN KEY (acao_id) REFERENCES acao(id);
 @   ALTER TABLE ONLY public.post DROP CONSTRAINT post_acao_id_fkey;
       public       postgres    false    168    230    2550            }
           2606    98639    post_categoria_id_fkey    FK CONSTRAINT     u   ALTER TABLE ONLY post
    ADD CONSTRAINT post_categoria_id_fkey FOREIGN KEY (categoria_id) REFERENCES categoria(id);
 E   ALTER TABLE ONLY public.post DROP CONSTRAINT post_categoria_id_fkey;
       public       postgres    false    230    180    2562            ~
           2606    98644    post_post_id_fkey    FK CONSTRAINT     f   ALTER TABLE ONLY post
    ADD CONSTRAINT post_post_id_fkey FOREIGN KEY (post_id) REFERENCES post(id);
 @   ALTER TABLE ONLY public.post DROP CONSTRAINT post_post_id_fkey;
       public       postgres    false    230    230    2614            
           2606    98649    post_usuario_id_fkey    FK CONSTRAINT     o   ALTER TABLE ONLY post
    ADD CONSTRAINT post_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES usuario(id);
 C   ALTER TABLE ONLY public.post DROP CONSTRAINT post_usuario_id_fkey;
       public       postgres    false    230    250    2635            �
           2606    98654    procedimento_usuario_id_fkey    FK CONSTRAINT        ALTER TABLE ONLY procedimento
    ADD CONSTRAINT procedimento_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES usuario(id);
 S   ALTER TABLE ONLY public.procedimento DROP CONSTRAINT procedimento_usuario_id_fkey;
       public       postgres    false    232    250    2635            g
           2606    98659    projeto_indicador_fkey    FK CONSTRAINT     v   ALTER TABLE ONLY indicador
    ADD CONSTRAINT projeto_indicador_fkey FOREIGN KEY (projeto_id) REFERENCES projeto(id);
 J   ALTER TABLE ONLY public.indicador DROP CONSTRAINT projeto_indicador_fkey;
       public       postgres    false    200    236    2621            �
           2606    98664    projeto_programa_fkey    FK CONSTRAINT     u   ALTER TABLE ONLY projeto
    ADD CONSTRAINT projeto_programa_fkey FOREIGN KEY (programa_id) REFERENCES programa(id);
 G   ALTER TABLE ONLY public.projeto DROP CONSTRAINT projeto_programa_fkey;
       public       postgres    false    236    234    2618            �
           2606    98669    projeto_usuario_id_fkey    FK CONSTRAINT     u   ALTER TABLE ONLY projeto
    ADD CONSTRAINT projeto_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES usuario(id);
 I   ALTER TABLE ONLY public.projeto DROP CONSTRAINT projeto_usuario_id_fkey;
       public       postgres    false    236    250    2635            �
           2606    98786    regras_permissao_id_fkey    FK CONSTRAINT     z   ALTER TABLE ONLY regras
    ADD CONSTRAINT regras_permissao_id_fkey FOREIGN KEY (permissao_id) REFERENCES permissoes(id);
 I   ALTER TABLE ONLY public.regras DROP CONSTRAINT regras_permissao_id_fkey;
       public       postgres    false    257    255    2639            �
           2606    98674 "   reuniao_conhecedor_reuniao_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY reuniao_conhecedor
    ADD CONSTRAINT reuniao_conhecedor_reuniao_id_fkey FOREIGN KEY (reuniao_id) REFERENCES reuniao(id);
 _   ALTER TABLE ONLY public.reuniao_conhecedor DROP CONSTRAINT reuniao_conhecedor_reuniao_id_fkey;
       public       postgres    false    239    238    2623            �
           2606    98679 "   reuniao_conhecedor_usuario_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY reuniao_conhecedor
    ADD CONSTRAINT reuniao_conhecedor_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES usuario(id);
 _   ALTER TABLE ONLY public.reuniao_conhecedor DROP CONSTRAINT reuniao_conhecedor_usuario_id_fkey;
       public       postgres    false    239    250    2635            �
           2606    98684 %   reuniao_email_externo_reuniao_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY reuniao_email_externo
    ADD CONSTRAINT reuniao_email_externo_reuniao_id_fkey FOREIGN KEY (reuniao_id) REFERENCES reuniao(id);
 e   ALTER TABLE ONLY public.reuniao_email_externo DROP CONSTRAINT reuniao_email_externo_reuniao_id_fkey;
       public       postgres    false    241    238    2623            �
           2606    98689 $   reuniao_participante_reuniao_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY reuniao_participante
    ADD CONSTRAINT reuniao_participante_reuniao_id_fkey FOREIGN KEY (reuniao_id) REFERENCES reuniao(id);
 c   ALTER TABLE ONLY public.reuniao_participante DROP CONSTRAINT reuniao_participante_reuniao_id_fkey;
       public       postgres    false    244    238    2623            �
           2606    98694 $   reuniao_participante_usuario_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY reuniao_participante
    ADD CONSTRAINT reuniao_participante_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES usuario(id);
 c   ALTER TABLE ONLY public.reuniao_participante DROP CONSTRAINT reuniao_participante_usuario_id_fkey;
       public       postgres    false    244    250    2635            �
           2606    98699    reuniao_projeto_id_fkey    FK CONSTRAINT     u   ALTER TABLE ONLY reuniao
    ADD CONSTRAINT reuniao_projeto_id_fkey FOREIGN KEY (projeto_id) REFERENCES projeto(id);
 I   ALTER TABLE ONLY public.reuniao DROP CONSTRAINT reuniao_projeto_id_fkey;
       public       postgres    false    2621    236    238            �
           2606    98704    tarefa_acao_id_fkey    FK CONSTRAINT     j   ALTER TABLE ONLY tarefa
    ADD CONSTRAINT tarefa_acao_id_fkey FOREIGN KEY (acao_id) REFERENCES acao(id);
 D   ALTER TABLE ONLY public.tarefa DROP CONSTRAINT tarefa_acao_id_fkey;
       public       postgres    false    168    248    2550            �
           2606    98709    tarefa_pfkey_id    FK CONSTRAINT     h   ALTER TABLE ONLY post
    ADD CONSTRAINT tarefa_pfkey_id FOREIGN KEY (tarefa_id) REFERENCES tarefa(id);
 >   ALTER TABLE ONLY public.post DROP CONSTRAINT tarefa_pfkey_id;
       public       postgres    false    230    248    2633            �
           2606    98714    tarefa_reuniao_id_fkey    FK CONSTRAINT     s   ALTER TABLE ONLY tarefa
    ADD CONSTRAINT tarefa_reuniao_id_fkey FOREIGN KEY (reuniao_id) REFERENCES reuniao(id);
 G   ALTER TABLE ONLY public.tarefa DROP CONSTRAINT tarefa_reuniao_id_fkey;
       public       postgres    false    238    248    2623            �
           2606    98719    terefa_responsavel_id_fkey    FK CONSTRAINT     {   ALTER TABLE ONLY tarefa
    ADD CONSTRAINT terefa_responsavel_id_fkey FOREIGN KEY (responsavel_id) REFERENCES usuario(id);
 K   ALTER TABLE ONLY public.tarefa DROP CONSTRAINT terefa_responsavel_id_fkey;
       public       postgres    false    2635    248    250            �
           2606    98724    terefa_supervisor_id_fkey    FK CONSTRAINT     y   ALTER TABLE ONLY tarefa
    ADD CONSTRAINT terefa_supervisor_id_fkey FOREIGN KEY (supervisor_id) REFERENCES usuario(id);
 J   ALTER TABLE ONLY public.tarefa DROP CONSTRAINT terefa_supervisor_id_fkey;
       public       postgres    false    2635    250    248            �
           2606    98729    usuario_cargo_id_fkey    FK CONSTRAINT     o   ALTER TABLE ONLY usuario
    ADD CONSTRAINT usuario_cargo_id_fkey FOREIGN KEY (cargo_id) REFERENCES cargo(id);
 G   ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuario_cargo_id_fkey;
       public       postgres    false    2560    250    178            �
           2606    98734    usuario_departamento_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY usuario
    ADD CONSTRAINT usuario_departamento_id_fkey FOREIGN KEY (departamento_id) REFERENCES departamento(id);
 N   ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuario_departamento_id_fkey;
       public       postgres    false    2568    250    186            �
           2606    98739    usuario_endereco_id_fkey    FK CONSTRAINT     x   ALTER TABLE ONLY usuario
    ADD CONSTRAINT usuario_endereco_id_fkey FOREIGN KEY (endereco_id) REFERENCES endereco(id);
 J   ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuario_endereco_id_fkey;
       public       postgres    false    250    192    2574            �
           2606    98744    usuario_grupo_id_fkey    FK CONSTRAINT     o   ALTER TABLE ONLY usuario
    ADD CONSTRAINT usuario_grupo_id_fkey FOREIGN KEY (grupo_id) REFERENCES grupo(id);
 G   ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuario_grupo_id_fkey;
       public       postgres    false    250    2582    198            �
           2606    98749    usuario_pessoa_id_fkey    FK CONSTRAINT     r   ALTER TABLE ONLY usuario
    ADD CONSTRAINT usuario_pessoa_id_fkey FOREIGN KEY (pessoa_id) REFERENCES pessoa(id);
 H   ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuario_pessoa_id_fkey;
       public       postgres    false    222    2605    250            �
           2606    98754    usuario_setor_id_fkey    FK CONSTRAINT     o   ALTER TABLE ONLY usuario
    ADD CONSTRAINT usuario_setor_id_fkey FOREIGN KEY (setor_id) REFERENCES setor(id);
 G   ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuario_setor_id_fkey;
       public       postgres    false    246    2631    250            �
           2606    98759    usuario_vinculo_id_fkey    FK CONSTRAINT     u   ALTER TABLE ONLY usuario
    ADD CONSTRAINT usuario_vinculo_id_fkey FOREIGN KEY (vinculo_id) REFERENCES vinculo(id);
 I   ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuario_vinculo_id_fkey;
       public       postgres    false    252    250    2637            �
     x����n�0���S�ےHN'@��ڢ�v�c/��d*bɓ��6��v���J�r��00$��i���0U-�7Y�n\��ʦ��U��!o��?�Əּ`cK���l�Eg�d8���6a�t>LL�,�i���=��@���N�Bv!��׻Y�yTZEv4�ige*�P��;Ux��$$A�����ӏt����| tM�6�ui��A9��V��ڜ("Q��l%Iš��P��&�{Zbޣ��]�rL�=O}��[����E�_"n�\�wYD��%'�/��^R
t.�B��	Hm)'<��PKtt��1�����+���{����ؾ�f\/)Η�ԍjd���#l<��z����R�O��4��;�:�� ͼE���٤#�p��;�=A�1Vc����@���q�F���)-�=�E�ER�\�7Ez�n��ڨ�Y�5���[�"����.��(��dof]@Ĥ�}���\9\�UG|H�u7l\!�F�Ǥ2Z5����)x�[����>���;�C�      �
      x������ � �      �
      x������ � �      �
      x���K�%9����"7���M�YC-	=$�1�$TB��,DU5z?Z�6&������$���I�wx�4>�?�F���?�?���������ϗO/����~��/.n��ŗ��OH^�#���������?}�M�o����v����������۷�?�e��35�珴�����J�y]h��2
-:�lH��{��Q_��C>�/�����X����?�O������vn{��o�}���?�|����~f�4�MPq�_��O���/�N%_p)�F�
.�}ɂ)h���DZ%�'��_Ŋ?�,�U>\���S�M��hA��ƨ������QzG@�e��}�����7�����o?�q����]1aH���<a��Ƣ��(���~��	Y�%��xۗ/}YP)9=��1|~�c.x�_��g[{��&R��@��c{�ߞ^>7/�����f8�8�ݍq����0A��x�w�p���"ӣ�Pq�K����旊������[��3>x��Q�r��]�+зd�{ �ϔPr{G����s��cDǊ�=��gʯ�!��3>�44r4K��Y�I�yyՏ��DiǶ���pYP-�0e
������u���eF�����~i{H�D?�{J��?�e$��^��p�e�9��Q*�2z�+��铕�l�;�y�>`�
�ť��eRQ�LZ�����q2�T�>�L/%O�J�{r�F�f�%�.O�e��VX��JM��5��Y�ZV���2Ͻ�3�!��G�t����<UKW�#
^�U�e���t�����6��>��em:�9���M'ީ�����1�^�G7��/%ďw�f3��nM�R��y_V6��@o�\�.�|��R&ņ���d�b뤲(V��&�**nlZ�;��udc�p���ӌ��.��T���ΊW ������_�3��@�i1u��{N|��x���%X��'�l���'���`۾��2g'xGm{BV�ݛ[��?�B6�a�R:o�h����TZz�wԟd�Nꝟ���oH��������S����GkkP|�&{�mM�Cns�Nt��l�e`;��u+;��H�.��=�X�=���3��i����PI�G��"�.`�o����8C�)�g0&'S�XT1�s�5]Ⴍ�ۄ�����3�Yv8�{sn���PD���T��9"���kw���#�c巐�LV�������l��K<p�z���G&
}N|�i�����t~�V��Pd�
�W���R7�>���X����bኅ�EY�8/�p�!Ոh������}�}����+��֓���fH�sl�������o�4�+��xp��	HR߰�]�Z�J,l�Pa��--�k��ud�xf�x&�P��J_``�Y������+\Q��c�,}�w�i�1��1a���Ѝp2� ��������H�3��H6���2mę!�>C�m4�!昍J�|��3C*\!|��	�0$NTdrXZ/.�����Ȋ�QH^`ֹ �a������K��ҧ�M�d��+]��1�a�%�d�g�@�
�.�ǃ�`�������͟�k<م�
��z;,ǭ��m�������b�Un���Qyf�ʽWl|\��,��aGgJ�y��p���Tv6�v6i��٘S���wf��%�����t�ܰ>���b`d]G��r
�.`)���v��!�ٔ��\t /m��r�*K�a���
e$L�
/�� Kp��+�9�d��e���r�q��}-��X8�xaA��M׽���Ò�uKS]@�OTZ'f�~���/IVf�}uaH�#�mӵ�]�U��8��Ҕ�F��Ke]@���(�^A(�)�|{���zH�I�-�yVɵ�-�%\L�T�m1,)���^X�c<�@�-.����OZ%�ދ�����#�"{B����-�fDSӕF5C�N���	�����-l�� 9lV䟧jd�����>�h���V,И�e]r�?������󏑨�~7Si=��iٸ���I�߆ڤ�?��ۨ*de#)˴L�~ˋ^Ҡ-K+b�
�A��#�֣���=�d%?hZ��g6	~�Dм�B�q�D�[�I���*R}g�)d�;ÔФ�&�ꌰ�C��M<?�l��N	�'���"�O����i�6TBO
n�YX���i�]�z��=O�� ��q�����8!lΛ�����Ϳn�[�H^����e9x��aY��g�$��eJ_��ʐq	���ޱ�����֮�M���y���Q/d�Ӭ��~��8V��'.�?Vo���.�;q��y���'�����Z���y��X�pM�?����AG�8C��w}|���@j,�����sZ�ر�n������s�n��8�����d�X��=v�|���M�����|�Áa��X��a������|��i�w�^2�o8�{?�o�j�Q��+�nߍ��`e��n=�p�p���jo�Ҁ�ԭ�sb#���U�7VpΘv�^�����<-B%f֋{DG��ݏ�����pc	G�ʂU�c��SqW�X��a�(��oE��(�h��[��a?��cg�=c$�rF�9Ye�KrA���q����r,��L�����3R��f��\��#݀y��X�#�0o��;�]Cz��r,̸'h9~��_7z&8��"=t��(\0�pR�k������{�y8wA1��ek9;��Ņk9�>P�l|�pp�vn�X�9`:�΋��Z�WlE�	��!����0 H5�̂��٦M']t,�pw��(cGano����Tg$�z�Q�̂��C�X��,z�T��ՙ�c�%M������?�:��W��{s�J�f���g��G6�K�zЊ�<Y�h�B=�tbAw�Be]�&T�s�I�������x�'h�rB��+��*^^����~��&'$�'��F����'<���Mk�����#H?Y��?r�-��8��ʨ�1�������;3��d����߱p1��;;l<�<�J�=� ���b�\�����m��(���kѸ�۞؅щp4�~�Ȗ�o"�a�����Џ���?ҩ�;�w�nĉ <�u��� ?Z�Ý~���: ��#I$��:$����mh�����As��E��NܞH��Ԭ<]�$����	&IO�k>�q갂'�e����=7���4���#�V��ee�;X�E8?)rN~e�4�^�x�_��׵��<��+�.���3p�����:��,�!<2n�ͪ,�!<0.w�R����s��_�3��>{�P	^E���!�D�"���>yR�*�J����?R�"��KoP�C���%����}��:�����}����)��7>�/bP�;��G���y{U�o|d_셷W��G���%�b��Ⱦ��RU��"��t)��Ʒ"�F��F4*��l 6i�d�,�n����7�I#��Q�l��Lq.i�KG�\�u`���L�e��)9N�F82lPu5H�5���U�`�#�=*-��V%t�Dʮ��i����Y=���(��Gw�ӝI�7�r��=W�`�0ʑ��V��phq�b4*�)�V�}ݷ����}��<p*���kxo����*4E1�юt��F;2��ӹ$��hGw0��$C�hG��	�7X��>b�vd`��=���'k�_x����6ڑ�U��d&5ڑ��o��|��i��(���,H8��{�ю�[5�B�IG2�Q*o�~S�s0ڑ��vQ�F�5�F�Dig�w�1�B~F:2��'h��HGN:^���tt��T,a$�`�#kh	�'��N61?.�6��11?w0�Ϥk���2J�>�td��8��1F:�pc;c�g�}����0L��y�P8k�>�jAW=���`�W���c��%���h"~��E_^XQ�<�Y��3��J}:n2���//,��1T�(q[XP�3ϭ�f��������l�6Qo5*�1��s�&��6�48.n�]��dX���&�{����b@7��{,ئE>��X��ͣ_����0h#���&��{    C�nf��߅�~tƀ��	gљU�}�\��Y |��%���y6�e�W�]�M��C4w��B��磹�eYx&����eخCH�07��ذi��e���9�ʝ��t��LA�������M,����S�7�e�M���x�.�PQ�ٸS��_do�<;�hxx�q�s��GQ���_,D�L���W��4i��嫝�L��P��>^y�Y��I���"]5��=|��A�.���.WE6���e�_��h�wn�X�mD�sڊ*��J5�;�e��SM��e@Jۙ�D��r�o��f��
G�&p���Ez��۱,���o�aq-��Űܒc����+�R\�h�v,[0�]�j�l^�_.,}M���bYf��mm41;w,�{i_+���~	�f">ҕ�h�"��)�!�	���[e�DFuF#�ܱ���.�FV�!� 2�:�Ef�D��ܰP�Q��j��P3�OZ�Ŕ�n	�/Z�Ű�⊴�U[�,#�8��@�k}�Rc�q:�e�&�f�t���.����]'E#�X�Q�Y���YL|b��(��b�@�mfU�k4�_B�Fd1�F���9�����Xl}���q��fg#O˱j���2[#٥ݠn8I�V^y�/�rJ�Ѫ+�e��W�]�l�v��rǆ���Vn�S���V,�Twy��e��!kKA�.vLD�y�&]Ű�y��YŲ��"��b�1?dR���*��x�FS1l����m$�2�����Q�ɆvX��#�˫�ܥ�z��&���boĤ/�/l�5uU� m�k�{24o��v����$m�'K���1A�[&���w1YQ冕� �Z���a��J\�4�T.Uv��u��R%��ܱ�A%A�����)�e
Hq���S����2ɪ)7,�d'a�vc�Lq}��R�X�?�듬�rÊ�3갶[�i�am7U��=��8P�@Ǜ�Q�
�J,Zm�Ά��.�Y�)����E2R�aerC�Li��t��g;�5;�@ ٿ'��X�0E�4��R,[�ʘ��bY60�ɬ��̰� Ƙ�v�E(�5Zʻ��Jx�JQ�5Z�{WˋØ"��bʍ�u![�d��"4Bىw�Y[$���cc��5��/�`���0rBa�YD^��T	�1X^�~bY͠.�`��x����~bX��sZ��'�m,W�k��2�'��|�Y�g"Ӫ��dY�6L�3��`�7��:SO:�����M�iu|�IX������ ��<�0b0�\2���T�|�S`��YkN�K�o�dR��Wyw��Ȁ"�(M/�W�n=�3.�4��}�z�՞"���� 6�����9�čM�NĬ�O�P�C�4�<�7bq�w�f�g�G٢�|hfy�Ok�_�]��ᑹVx��.�����X��-�/��^�N��<���5H�ξ���"}��}-_�v"�G��D���##I���a*�,�~#4�3�M��#�b����z��1!����\�^)�G�� nf�����,�2��̃c1U1���y���H2�dD�P�OF���q�J�:����#�x]0QƲ|m#I�F�1l`�_Frr��KK�f3��+�9Yso_��mN�~gTS0.�9��F�1l�υ)ר2�,�����*cXf��*��*���lb�,����n��-Y�R��\Y�b2��e�}/�ܰX	��� F�1�#��7�̅eF�c��v1,7լ��z�ĉ:H2ڌa����P�h��D�X���/�@�r8�⒍ cX�O���6���^t���4�\�Ȫ$Teo���1�5�*�x���D�f��X8���Ԅ7ܲ�f����ٙ��;�7��Ŧ3ꌥ���k_�xkE��`�P*M���h��UB�0�<v9`͂����`�NQs�I߰�kZy�c�ЧM�˥�صT�&�	w��W�si:#�X�2)�04*M�o0_K�fTZΨ4�MܦH�m����&�ܴ7۔�f��?�UiN�cV����n�{����f�Ӽí�5���V�y��U��F�q����0RM�W�� ��0RM��X�F�Ui��]�����]J�Wck�%5ͥ"��kN=��g���a|����#ԇ�����Lׄ��XOճ�l�Q��#��Ն�f���F���$�;Nz���pa�����誹0P�l��'�i��re��\٨o �Ba��ܰx}L�:��憅D�Go�G��X���	�O�Ԁo�X\	��9N8����� &��t� ��I7����,�����������$d��gت	>�p+��x���&�b���A��e60ս����s.�W�Zx��"��GګG��b)��8�p�ih�Ĕ�٦�yg�l�?e3���Ez��<lX��7�F���&�m6�R�:�c
1���'��&��;n%���fj>��y��n��S����lޗB��ذA�K�
����_~��Ҏ��6-9,a��I�l&�}��7FiW1��3(9w���W`�N=�2�0C:��T#Ü��F��Lb_2̰d�Ed�M6:^W9Å�Ey잍caz��Ҙ�E���"lÌsS��`���'s� 
7)8,�)J����YƱ��Tlm�c�,�mʚio��A/���ה�*����S�J7l9�_A2c��ȭ�%ǌa�"Ѝo�H�k���,=��%�5��A��m:���/8�m:K��� Z��!X�a�ӗ�MY-�9��6�>#�����Mx�]��kF}�/�mk�v�d^���
��Vă�z-�lk+Ʋ�e[�Q��v�Uo�E��nz��
��drZ�l�6eҗO�R�[��Qi�cŭl���c���V�dJ||���[���܋�zV�ʖ��8�ŭl�����+[�u?�F��lɻ�]�deK�8��W�t�N��iA��%��z�6��
-�r�kK�<ܤA�ڐ^{C�gB[�/!��0z�_���]F��b�[td*:xmF��ұ�fR�#�����V�z�2������0sYcaz��&���	��h5%^a&����b�k,\T�N�F�WS,����amC���ń6��Z�!yB�6���6���á�3�C���s��҄H���������Y���H�k�I�/x 6���GO�����=�D�W����7�4?D�w���J�������]h�K�=�ww��۫$Ò��{�w���O.	���G٩���ĝ�t.�V���
3�p��&��Xc;P��B�<���t�N�~�mP��[��7ӥ��F��Pդ#���Y	<z�3���2-����|z�2�r�9W����zQ�4JΫ�({ụ7x�*�N���EcB\��yvV��W\��飁ž�}�;���M����h�������p'~w�o��ʠ�R���������
���^=���dP�]ʳ_=V�]�>��H�yD��=�'fS�_�g�І°�OL�����R��&r���|�Q����v�=�Z��������H>p�y��;��%�����_P۪JLIŐ�R{bd�4b����k���4�^�7��np��?Ϛ�&�r���E�6�퉩ފ�A�'�Z�C �㙵��xKҽ�k�~u�%?�ɨf "�G�u{bp}�_^�nգ���!���*��*��c��YM6'�0���j�z,���&c8ئ9�P�0�F���k�[���;U�)��C�7��0(��3тT�=�ha8��Cy�_<����-����ó|�{2�˞M,�;��b�2�/�b�d끣����OF��/��6��
{��-��=�G��,��=���.�pqO�|��,��6��/4��I��g=���;��)���T��b�"}�?�!L���!}j�T5>���
�,mՏw��T�D����'��� �G��1�@U�N�*�yE��A�ǃ���A�d�U���2M��;-�k��2H]��e�����������-���0��NS듞��ܟ������t��47�2넩)w���T'�ՉN�7�Ԕ���;�qjʝ��K�8�O4Do'sF���5O����D� @��2���Lt�����5>��� ]
  z�N|`�BO->���U���[���^���R]j/�Ik[��2�X'�m�Cg}����-�nh��2�m���>���-q�I_q�imKߟ=[��-��=ŖimK��l�jZ���qR���%�!��z�kS�}� �$�-�#K&��ymH}�7H�HX'X�-J�k3�,�٦j^[1R��A�ڈ�I$e�^�چX�"�Jj^�P��G�em��)�Ăej����yn��$�Hi*[��O��﹤j���x�1autt��3��I��3M�pj���8ٖE�ej�N����������k��Pa&E��}�+������	+_��~WXP�����ro�}s][���pa�ֵ�"��ֵ�Mqq�ֵ9="�NNp�#uvt���d昄0�Ka�8	;:`�RD$Q��0�`�F\���`ّa+7�::�8��L��N00�L����vb�y�-�$���EK�h���,Sc���$�h�5Wz��-/�)O�$�耱�#�T��0������|WM�=o��M�=E��^[�W�>�M����$�耙���Q&�F
�%��yK�$���V�oL"�N0�ˊQ&�F�]TsO�N�f�j�0��}�&�Dp��A�W&dZ�4mdt�emb�I��3�w{OB�N0��'!FL����'!F'y��s�&��/�%O�ͅ��S& �4�$���9P�ʆ���LN����V���m.��4�M,>�m�VeT���V�z=N���f�|.�t��6;M)[��\���RS�����N���q�N@�\��{�	}��͕�سL��P�d���oP'js%&����%�\���\p^��J�N� S�9m�����
ʎ���:�kpj�g1P�o�͕����lL�+1J����m��_���lщ�=im��ϛXtC��xxs��&�^�ԌGv���S3*�������m=��ţ�����Re9f�Vxxy]a=�r:혋_� �0Mt�7>��T5��Zޮ���w�ދ��f?��p�]t���o`�F2^l�c��)���:��6<��������p�	���ۻ_�mL� �R��:WW:
���OW���h������d�<������J���W�6�FXJ7w�.,.�3�#��8X���f��<Ȗ�_�^���;�e*�}6�vǰ�΋8B&�a#ߘ��d3Iw�l����@��e/�ƞO��S�,����M�+�����7s���Ics���檗��}�4m�u�'nD�U/�2e
v�ץ��
OE�8��{����]����2u����N:�I�c
���|��+S\8B��������J^X�i���Qm����3�NF�����s�8l�W��)�:ߝ���֯zA�����0�As��Ѫ��5x`X������-�;�R��q[�"Pt�m���μm��ݳAH{n���p���Os�/4r���0��O아_�<��[��X��y"���g�_�Y%�&���M�ˁ���_x}���.2����g]���]d��"�t�S�y ��5�LF��F�_D��*��I�sv[�糙��|=;��*��B_����A�]�@�'_�g�My��qƞ�f�	��5Nٳ�H�Vy�,�|��HҤ'�B�ǽ�|��Ya o��p���􊯴��.{2����^4ә����,����1��&J�������M��Kj~0}O�-��C�-l��G������N�A�[��a|)�y�����(�`8^_qP����a�o�sP�p�ӑ
�� О�g�B��N�k����I�&�9`^$<~����`�h"_�t���|��v<��7t�8[M<�	f�8@,���`��;�*��QŽ�z��q��v��}�lȺ�u��u�-��￢s��@�q�l�P���*���~��V�1'����*rtTj������)-�ڪ�����_[5P�(#�ʪa�;�eVV%� ��.�VV<)�ru�T��xջ�(=����58C�+��)n|e��SD�|eհ���ʪ��~a���+�J���_[�k�{d^[��M?m��U}�gP#}�9S��hN�2F��y7����~nx&o��X�۝�ɽ������;�/���N_��l-eQ ��2]Kc�ޢiS���3��[c���3~%pA���S{�8��u:J��E5b���4� �>�9�^�x�G�z�������LGi����dZ��4�Q�z ,�t��8\݂�UWVelŶo��ʪ�y0ĖYY��jz�h�����	�������O�meUwg�h+������k�b��	����9jz2meU��͹�ȶ�*�M�NaC����3��Ck+�z���|�ΙDα�Ѽ��D��&󚁣f���M
=C��l����eh����r�Ɨ�����hg�|]��p �S���203�q���/C�Șӝ}���ܠg�l�0ΚDIƾ�/��!���/�_������qnv��m����m8�shnwR.R���%�,Ig��*ܕ��b͇��5����v}5呇�Ӽ%�I�����ܩ��_6܎�%�څ�Q_�xt��3�{'c�튍O�y��[
6X7e�V��_�z��lX�N�V��+�y*�l��>X���Б�dN��������o7�      �
   �  x��U�n�0�N�� �m���fj��f�*U�n*EƘ�S�ȘH��G�S��v0&	i�mդ\��9>���}����5cY��h3����2�x�f4�4�F���#k��n�f���.�`?9�o_0���x�aL���v���^v(⋢ ErQ�C�^EhQP�.�"r(��N��b�&����q�3��Q�U��Z�P��厽��e(�U�
�e���G���brc���2��[�.���E6Ea_h�l�H�����Z����>�Ӳ�
��H4��QkY�����V+�Gf��Δb��($eJ�8䂢����<.(%4���4OO(Xa���r-�X��:v!W����1�Qo%+�:���ʼ:�r���Űcc+k<D(lʑx 0o�CD�z�gF8� r<�{{�L���B4LV�ڌ�p(o�Qڅ�:�(JѯQ�`Ȋ�E�j�.���a���Ƃ PTHݷ������hDԅЂ� d��c[Ψ��f�X�j˜vp߄�-�Wu)u՛lu���į��o	��up�LLC|���(��DI������П�mc�?-�����L�o�5��a�fuT�_Z+=����������aN�8�L�L� 9�$((ʂ�c�Pp�SV1��h�����&�L0{綃��O� �:xP�w��������_������w�Q\y���QDG߈Ƒ#�� B�z9�zh���P~.�e�
��_i������g���Qy ە������x�q��y�h'���y�G�������Ё�      �
   �   x�M�K
1DםS���w9��k]�i�V�4t�xq�Ar1M�q���W�@л�PS��d{�8��>�Y:̯�d�F�a�,�Z�#A_�	l�Pb)0���8��;�kr��φ:�����B�� ��ZB#��}Z�T��H)��|A      �
      x������ � �      �
      x������ � �      �
      x������ � �      �
   �   x���M��0F��)r��U[�Hh�H�����".Ģ��Ɔ5����O�@�$�Qj�>��x�t��lA�x�t}�?25��a��P���]�#Ɨ��p�CwL1ľ���{���{��ew.��\L��������[�%���?P>�\%3��_�1��j�	c��Sp���\���v\����P)�*Qb�      �
   �   x�}�;�0E�z���(�Pђ�()Ә�B.2cẙ(��� � a��wn{7Y�tc,`���*AO��ћ`����IL���M��m��������[����aAM�b��~<�%RAC1؋v:�z����*�R4��9�y�گ�RO	g+      �
      x�3�4�C#C�?NC�=... ��      �
   P  x����N�0�g�)� �����0�ԁ�������Ӈb�)�b���		�l'����1ɨ�o�*S�&t�xF���lPe��m^g��~�]��n(7z��nU��O-J֫C���\��}�U�^�ĩ���2sA�Ś�pg�r�����5��(�rg���6X�`!'��H�ñG�=�{�P���XXY�:@��p��~���2!��-�Yf��h¹ ^n�S���Ӊko&��\H���1F�d����nO���R��
�%�)"BN|�ub��,�pN��֪mW/��a�hsy�o:�F-��f'�v�!��aS��lPf��zWU����u      �
   �   x�e��iE1е]�k�}-˵dc�v��nBHhs��bV0g(mjb����N�8
�S���W!@yC���@�T�n�<��l��a�?n\���U��ێ��h�rQ)�������ք�� ���hM���o�_u�U)�b��v�خhK�(�BY�pk�)��} ����`[r/��Bԗ��k�ȅ��ӏ��������Qk�B�O�      �
   1   x�3�LK̬HT0�47�4�4�2�HL):�8��Ԁ�ܔӐ+F��� �k	       �
   J   x�3�tL����,.)JL�/�4��-.M,����9�S�K�F��y%�
n�ɉ9 CN���T�d� S2�      �
   \   x�3��t	�4�T�UH-JN�+)M�QHIUp�HM.=����|��|��������D�?N#N3N3NCN 4bC 4204�Js��qqq �QG      �
      x�3��41�4������ �      �
      x�3��4"N����Є+F��� p_=      �
      x�3��4��4�4�
�M�b���� i�      �
      x�32�41�4������ �      �
      x�32�41�4������ �      �
   )  x��VKn7]ל�'����h�H�m �K����f@��9&ٓ ��	�,�.�d�Kq�+كă,I�zE�zU�
�d�0���
do�@���LW���Ln�i��πk����v�~o�ڣ9����qk��ױ���X��3�G_9���<�)���L�.�ޖ-���D���o~C�?�8��_0���w/Z_���`a���X喂re]��w��a?Vvn|yJ���xS�3(NE��v��w�q]b�͟�ͻK
B�(�E��-}k��Ny�CҞ�zѥ� �6)M������׾y��K�@���-�����>�}h5��n���UDb�K�wΛ��pN����ă��s���A������]�E-@�cQ��h�/L�a�|Z����� 'n���P뜽L�V�_G?��qC��iV �q������W�ڻro��ѕ����i%��Ӓ��r�+�'��ގD��b�u��x�����v�z�+�ܙOJ�ٗ#.v�ט��smz�ӄ
�]ٰs����-���FŤ�`?���qr�n�z��p0����v~k����c�a3�U.@�4��x�)���~5���ݾ��
ԣ�-nR�P�&ӏ7魯8(�8��xZ%@e#�1�0�b�L_�2�0j��n�GhP�i����{����i�����h>5�׏N5�H���9�,@���S�/A���ӏ�Z��Ӷ��4i
�vpu���AgǠύ/&Pz��e��`���l��KS����ۦ�����;bG�0�
�`}�����)~Ƴ3���S�ה��o���f� L      �
   ;  x�%�ɕ�0�����*��?������6�)���b�B��PGm��q�N�=*���s>��i����s^h�8fМӡ5g@�䱄�3�
WW�}���)\[P\_���`�y�����Yu�d�a����-�	��v=�0?������8 ��b�'�l�D��B��#8�p]x��3�ۂ�}��c����Zx/$����Bpr���O>�(A؂"|�"8Q�!r������x|��^e����w�i�􅋌C�#k!���ȍ܅bd;�(]��܁'([P#�y��G1r��^H#�y���F�b��М�,����Q�t�񑡓k���Z�"�B����H�ɼ{�ƛeVyxl�[(x��x�p��p���r��j!�z�����D���M�;t�L6"u���H|Hi$���F�C�#�!��!S�3���Z�hI/ǣ1sD��Mw)u��ѓ�lT��c)Zd6�cs/��گ���Ϩ��n&�|�"�ՙ� ����L6�2٘�?��NU�L6U2��;�dTaog6[Ӕ��-,�c�J�uL�$�2��'b,`�C9TCo�a3�����1���      �
   �	  x��]�r��]�W���	3� Kە�{�W�f3W�"%�H�U~�-��*�/���5�F���u���%�{z�O����!�=&�V5�
����_�=�Ԫ�mZ���@=�v�_y�u�/֪\r�o����m]�d��٠�f�U�*�]+W�0�?�A��Q�^��ǎ��fU5��|��K��f���2僠��e�ᑎ�F�{�{K��4:/g���.�����������I�+U�e6���j�{����U���U]���Zne�0��@���]yi��Wrx0-c�������1x�������D��A�w<>#&6F�M�1�\.G�q����K��J.��x�!Č!&�����-J��c<�3]���TLc���� b���?;Y��Z�[�)�s[����M�ݑ��XM(��$�'	�B�L&��C�ZL�̄�r�$\�����ltpq��'�M�%>D�Iz)��]fx����r�x�b�Y�p1�(!N����dCf�.]�a˖.�B�K��ݞ���P���oo�n㷶[w%5�7��,L�b��K�ؐ(C�X�oy�K��!3`��=��x� �d�
ɡ�$X��XEd�W<�.��F�An1�NA�|�B�`8dA��G��"����y��bݕ��m�d2��>ܦ��&o8Eu�����e��MwC�����H����*&G >'N�XxrO�~���zIr�vè%i����%qS�����Vf�_��CL�at���x�ר���͎�ɴ�jh)m�he����L��Q�G�=?x���wY��2x��V>U�Vz�ͮ��:�+y�� �͢�jM�e����NUn�Mom;�Y���cF�s:@:��h�J/����iW�J�\l��˶�K�7h��c�7����nEt;^A��'�Z�\��E���|�5�ARq�"�NVb�)��p��ݝS״�S�^UKu�RM���g5�KVM����2"#o�r��7c��(�Bk�SW�CmO�e�j��Z^�p����f�`:��>A�ag�
c$\��&Z�����obgTu:'��Th�Z틦��E|�{����|-G�b���,��t���P9��cb���5���
:��N��ګ֭�ԅm��X�Dm��J4���Wb�%a?���e�:���/AI�][me;���I���S��j�Fh��(�t:�����e���5���U Ū��̈́t��U�ńF�v(���/���_˪i�����#&�����E�c���O�tf(� >�r�L����b��ۗo9-S'�Q�& ��m�1����c#Ko�)3s:!���"�$c��=�s7M�^�q������SM�w�=6��5�tGKnˑ�yNIb^�C-'�f9�c��EK|]>܆�_b˲ڟ��:�{I�i8�ꢁ[�Y��4����z�M!��*A�����H0��p˯��n(l2�}Mb�3�!�Jц�55��[\�y�b�vD��Mm���tf �e.*��J.����(+��dH�h��a[� 7r`�����	���7a;��H�̚�'e�:J��M�h��N���q����l�~�gLI�vR�Q���j4j���:����WE�	yF�뾕M��;J���Dά�v�4�gy�i�q�Y�&�F�E^Ը��CA�}
����^�	���$ԲG9-�FH��9�+�MF�c��4�n_�Z�6��ت#[#���������I�$HcPMR��?3v���8� [U�}ia�^:{�٧H� \f�6t����K͸�-% ��$��&�Q�d&�R.�9��$��!�fV�)�w�u�h��F-{����#�"������Ɏ� x��[9�e'��R��dY��s�Q;40�%B�&��݄q���3��HoB��j0f�r����M�q��-������M~��4\�U�G��,�
/�LE�~����J�Z��^	�iYv*Nh1㪤n�� ��b�]ˏ�f�?�Ǳ�Os"\�V%B+I[?lM���F���}#���搿3<�{��;	��LmX�t�]��h�W=�Zy�V�Yֿ픶���R�G����Lc�l�v�s�	��a'�����+5m�EsOk��CHgy�=�=���=�3`�&�g@9�I�a���7:r�S)R#��;촺�����?�uj0'�&�:C��3Fk�|���+�co���ں�g�դf5��5���~7m�od�đv�2A���V��&�k�΁�����*������ ��cE���8�Mg�	0���~��}�ɵ���Fϼ���K� !�.!�AQ���5	��H����MLG��3���m����#>�5Mv�]MI-4�#���L���]���<vr&ٷ�Z]w�z��WmDr��U�o��qw�
j�Ȝ-I�KX��IkAPs�&28��Y0�@���EڽB꯻}ťv.�%��ѡAM|r/�/����]�      �
   �   x�%�[�!C�a1SF��^���1	��Ui�X�p�u9֥l��LC,�:�e(�ݔm8e����m�xa�*@����4��!2��8l$�yf HN�84fNu���$G}R�1��!E��vQay<9��e:q(~ky*MY^O����
�FA=#	�[�	]N���aco�.%j⪹9;g���6Պ�������,
��Xiz��<O�{��,z�Y�c�9O!�<�Ҳ��|��������-KP      �
   y   x�%��� ߨ�L�/�%��	�xg����a�Eذb�!|X�w̉H�ŕ@�M�}6_�Xk#e�Ht)4x�W�2�c(r���R��D�;
`�ʐE�x�J�'N���� ��#2      �
   �  x�m�KN�0E�d����!�
!���t��J��O�$���tc�n��tz��s�������?�v�ꪲ��Z�2&8V����Q�Q��� ����'^���9�k����y(���K��������W�������Ix�J��k c2��Ofl�����j��D���<���M�����]nm�e����6�ʟ���yǟH����U��X�ƽR�VB����+u�9􌜐ąM��Ԝfq�1-�'���_���T�1����R�S�32�KɥC���ܺq��Px\A)�S�2 C�r a��Gx6C�hŜ,Mi�JHQ՟�����X�K�*�M��f�Pgs�g����n��O��wgd�"�.�K6���,�����      �
   �  x��W�r�6<��_��(�[$�R��^���^r��xQ�o�rH�!_�K��'�����Jf���3�9��a#n���K~bqm�^ܱ�ZO�����J�S������;&�QF����S��J��������W���!h4�{�2Rȸ Z9w�F:'����6֩Fܞ���b�M�GvZ*���Su+c�Mt���b���y��N*Ǒ�	]z/��O=�Nh%+gŴ�[���-`��׍D݈/7\�H|6�6Jj$
ň�uu4[�Њ[m���8��B�9��7���g<�+��݊��:�$��b�PYg����@o���n��J�-��0+�*U�3�d#��t��`�h��3���X�$��� �E6ʚ��i�z�2��B/=k]��y�jе;�wQf ����J�R)8T2`��)�w��!w�}��H2
%(��k����e�L��a��=�:4��>")�U�b.��Ir��?������&�lЂ ���h�~�����F�@�Z[�����.���h�n8`�.ءm��χ�r�TZ�m�\�����ih;�9x` ۉF�Ɂe8����D�3�`��Di6ͬ
4^)%�hLGn)�@�XJ�B�>�4#�HC?�=U5�[�.&���T2�ڞ����y0 N��f	-?�`d'��d�aZ-4,2�:�ҏAj�I��^cQ�.���Oe��7�B�@��"6:���(��/�R\+㏄��%o�r��1p<��}P: ��XyjKH��[�2�hDe�p���)��!L�>�&�Z�����jq;�5 �t��Q���N�ݽV�'xN�4��H��s](Yۣy�"{]5/���e)�u��˶��/d�����#j�����2���,��'-��V�d��Сbp����� �fȄ����<��rt&c�?��	��S�u�5�qcʨX��B7׶�C3�[,�a	��3;X_�oTa��;Z��q1�ňR�G)�T1�e����� ̹cYl0N�ԭ����=�]���N������4s-��`�7�����W�)l�k���jn��O-ZEF����_9Ջ%��B��Ȱw�c?�i0�V��{�	��3Ǭ?-�r�Z�nUxК�(s&����a�zF�Z��"�>?;;��@�      �
      x������ � �      �
      x������ � �      �
      x������ � �      �
      x������ � �      �
   �   x�u�A�@E��=�ĸ��$���F�N�̌���x/�`b\�i������V�:����M�i�M��P8��g��VXTe��ZY�?g�T��z3����`'��y��w�AB�ɇ�ˉLPd	-�b=cG茿~#��2>�5�-�G���u2�ؑc ؒ�-����/�B&�����oj<w=$���
��GQ���[�      �
      x������ � �      �
   "  x�ݚ_n�Fǟ�)|���?�瑀7�D0�P�/���7QשT��=A�� =��{���+�"�@�����)r^��G:��ȟ��N�3���(s��fy��e��-2~�Tl�~��>�?�<s�xS���YY�l[T�Uu���J'/w����-�6�Plݧ�P���~��0���oS��e���̝�ݿ��ŝ��|q��Y})�AǙ'�8NN�����|ʜ�}���>$�h1������8�� �?�>;R㗱B�y���p+�t�p��fwCw��ǣe�$�>&���(�*��);~�x��O��+���!2����F�8y�БPA�=D�������.� #�M�h�fg�SC�X�b��o�ojT�7��9�x4�&��9l�ԐrR�h�\u�����tf$�q2�Gg��?O�	E��hMNſ��l�Թ5��T�RZ'"��� ��Q��`$8	Y@�s7K�q�ډ�ܳ�����jt���m=@(#��dm�ݧՁ�ȥD������"�PK�f��h��*^F��9Ί�9���%�ڟ��Ý��؝�Y�κ
���c�8���r$�]5Uﳵ��i�RS	t�ժ������\�f���m�&��Tpru�7�*Ky����#��bn��H�(��B;[���I*��9�1"p���d�S�$�]?k�uh�״�-�T��7���A�լt��)���U��S"���å
�NK�]6�ܖt�k4���
��-&��jvwєE ò�D�����Yg��M����):�נ]��������hs*埞�������Fo'��qn�X����*�)�����4Ϥ�
Z�[�ֺ�@�u|�Է���f�<�*@�
�n^pZêSbg������:���O� �d�0��..83���+u2[�{f��G���1��n���;�6�[�ğ�2��tkX1�CEn�J��Sz�D,F��fWh��F�?�������b}.W�T)�yN�=�	����m�)b��LqT�!BUn��OBn���)7�����3I��!�86u�	�&�U=n������2��	��AHJѼ���	�jm��M��2"_,-H0*4H�,v+�A�][����Y1+��:f�4��qU�޿��|%�SA�4������G$R��C��!�DG��Qu�;x�Q[�Aԡ7tpY0Q�$�-Zի�=�Q�6�`�F��*%���� �a�������[�݇*/��*=r̽�<��S_������}�������(M��      �
   M  x�}�]k�0���S�o�rtel�1�u5j���.NR�~�����#�Px���z$l�l�����5N�x���8������*��؝��		����x�W��8n�k����y�Q��M��p�^p6x��dֶ�m�pz��sd�nE%�ɞˉr�V�Ǔ9��.���p�2�K�����A�o3~�Aѱ����PK���h���;8N�����3/����Bo^-�Z��0g^ϐ�}BT�rɗ�!c����\��Kw���������Di�+�xr�Sk�p����15���;���͘�ÕD.,�����U�-�՝b\U�?��k��ݟV��9�A}�S���.��9�E(���QNM�t�B`�2j�$�.�l�mŚ�ϟ��~�g���1Y�No�CL?0bJ���qH�8�U�^���b�$�-t{Xlk+�H"}^*O�ka�C��9�����"���8��W�홲B�X�;�#Ź�B��*@Ζ��8�K��|	Oi��" Wș�m5�k���n>O��oޅ�M)o��,54VZ�����d�!jW�jk�aG3Բ��DiZ&Ӟf۪��u*ͻ��ĩV��8���x�\���`ޜ�R��n�Gx�^!��
������2�t��\����_���k�bO���KWZ3G�+�P�J�-����͐��~�JW:��3d\����$W�����;YFVX���X�1�^�0��3�O2���s��8���Y05_+kX���wς{��RI��hQp9���t���>\n��,�44V괺�����!*��jk�]G3T���D��&Ϟfٮ�[�~��v���J��      �
   2   x�3�,I-.I���4204�5 "C������V@�Hr��qqq ��      �
      x�3�4�45����� �      �
      x�3�4������ '      �
      x�3�4�41����� �      �
   �   x�u�;n�0D��)x����-�8���*�B�H� ��B)���IN�3��v��g�)`^��:��7�tB���i�0��.���@�=��g�H�16��dh(�9��p��l�A�+�+�^n�Ϋ�z8�(:��z��|i�/�k��͐2��ҩRn=�T��ى�Z�rW���������ȑJ�xV�Wګ��C�aǁR�����1��0wn      �
   �   x�]�=
�0Fg������'C�����ă!$%��z�^�r��%�!$�{H
���kPHZ"qJK�ÕK�0�ӗQPaw�V�TxD�c+��_^�9D�L�����0��Wf�W["���J;�)R:�.��,�v�1�[X��;�N*�?��\���ߪ=>KN'!��dA�      �
   V  x��Yˎ�6]�_1��F���k�>�)�6Z�؜H�C��f~����=�5�i�H&Fpy��1%߻�\��6b����P�Ꮖz�!5|�oV�:B8�}�+����"ʎ�H�QE��h��6V]L>$W�� s·H��
K�����KP9]E�K�|3��Ī��Kנ��v�ML�##R𷂟~;���i�E@C��Ƣ�}s�ݐ%�
�ȼ	���#@m ��^�����w��'a.�Y2�	��R�C�b��v�Wݣ���Y�EJ��R�(�Vr���Ï��~�za���)�X51��m�#����~v�o�4ȵ1!V� I*�7�]�s��E9�=�?�vڷ��O���m���jsUΜ���� 7n��8E����,�!%�Pq��z�����d��G��o+��u=:�/�ME1�$�\�}V.��\Y�sI��Z2,4���C�bzW��PF�&yTH�,��;���q��4@E��BM1�]��Ni�牎�#�1�X�m�1��0���<�!Ba���V�8��c����{�o/	�bP�
m}b_�}���R��t�h�!�j�[����S������wi��c	�=���ɡ�FrQ�z��+��ɽ�,�7t�`��-)��ʠ'����ׂ(�&�~�Q;��׹Wc�̛�0��.!�9Ò��K�<�oI	����U@���� �7���-m�\� 0�	����7p�2��v�c�^����d�K�Cb��W7�B��
B�y0;E$��K��A_C�����������A��xHy)J0����K��߃��m��<�;p�.�S�^�{��@{�$��c�k�v=b
��q�ML۲���-@Iv��-�6M�����\6Y0$�)�>�.��{S�Ԑ���Տ	�)�C� �� �u�,	6=��[�>���/Sa�Thl���#8�<z˖H���)�mC<�LأO�k�]g��*�O�m�z�
{[�u|�-Au�k5��Xf���ft&g����> !,����0�|����c�m�sw�0������b	����yE��+�E�.�>��Փ-� �K)\y�9Al=A
K1�G���>f�$�]����Y��B�a�ڦ��e��ġHx�Y�ÆB�����BuF�dZ�)�Q�\W��B��%ڤ��CӇ��q���� ����;{__9�����Y7�Jr|��܀۲Z][bk�'P�[���SB���|��o��&xh��Q��*�!�ʥ�LWI�9���^���'{z*��z��-,�ߠ}K���I��3ˑZ�&p������}};n-眐�m,Ӛ��xz\ތ�|}s��_�Jk��br��y~�%�b]6*̴�}��%�k4�	�ά�"� ߀m��W�1n�f]=�x��chw>uy]=Vpź��� ��s%n��T�w���SU�[CC1��`�I7�r#[.�������]���o��x�:�C��R(c�£���L�9:�>�y�e�6f��@�}ɶ\ �Ӣw)cW�A.��V��1�W��`��v�pYP	���t��k���/va��v�J�$��1ߢ����D"��ƒpt���M*;��.?�f{	\������c�k      �
      x�3�tL���LL��4��"�=... P��     