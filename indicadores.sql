PGDMP     5    0    
        	    r            indicadores    9.2.4    9.2.4 �   �
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
    email character varying(255),
    endereco_id integer
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
    public       postgres    false    168   �      e           0    0    acao_id_seq    SEQUENCE SET     3   SELECT pg_catalog.setval('acao_id_seq', 24, true);
            public       postgres    false    169            �
          0    97949    acao_plano_acao 
   TABLE DATA               >   COPY acao_plano_acao (id, plano_acao_id, acao_id) FROM stdin;
    public       postgres    false    170   ^       f           0    0    acao_plano_acao_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('acao_plano_acao_id_seq', 3, true);
            public       postgres    false    171            �
          0    97964    anomalia 
   TABLE DATA               �   COPY anomalia (id, causas_internas, causas_externas, data, indicador_id, status, data_conclusao, identificacao_problema, estratificacao_problema, concluido) FROM stdin;
    public       postgres    false    172   �       g           0    0    anomalia_id_seq    SEQUENCE SET     6   SELECT pg_catalog.setval('anomalia_id_seq', 2, true);
            public       postgres    false    173            �
          0    97992 	   auditoria 
   TABLE DATA               `   COPY auditoria (id, alias_controller, alias_acao, usuario_id, created, elemento_id) FROM stdin;
    public       postgres    false    174   �       �
          0    97998    auditoria_campos 
   TABLE DATA               h   COPY auditoria_campos (id, alias_model, valor_antigo, valor_novo, auditoria_id, tipo_campo) FROM stdin;
    public       postgres    false    175   )M      h           0    0    auditoria_campos_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('auditoria_campos_id_seq', 1705, true);
            public       postgres    false    176            i           0    0    auditoria_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('auditoria_id_seq', 1179, true);
            public       postgres    false    177            �
          0    98008    cargo 
   TABLE DATA               7   COPY cargo (id, titulo, descricao, status) FROM stdin;
    public       postgres    false    178   @Z      j           0    0    cargo_id_seq    SEQUENCE SET     3   SELECT pg_catalog.setval('cargo_id_seq', 9, true);
            public       postgres    false    179            �
          0    98017 	   categoria 
   TABLE DATA               (   COPY categoria (id, titulo) FROM stdin;
    public       postgres    false    180   �Z      k           0    0    categoria_id_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('categoria_id_seq', 1, false);
            public       postgres    false    181            �
          0    98025 
   comentario 
   TABLE DATA               I   COPY comentario (id, mensagem, arquivo, usuario_id, acao_id) FROM stdin;
    public       postgres    false    182   �Z      l           0    0    comentario_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('comentario_id_seq', 1, false);
            public       postgres    false    183            �
          0    98033    comunicacao 
   TABLE DATA               8   COPY comunicacao (id, titulo, status, tipo) FROM stdin;
    public       postgres    false    184   [      m           0    0    comunicacao_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('comunicacao_id_seq', 1, false);
            public       postgres    false    185            �
          0    98039    departamento 
   TABLE DATA               3   COPY departamento (id, titulo, status) FROM stdin;
    public       postgres    false    186   7[      n           0    0    departamento_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('departamento_id_seq', 17, true);
            public       postgres    false    187            �
          0    98045    dimensao 
   TABLE DATA               N   COPY dimensao (id, titulo, observacao, ordem, status, empresa_id) FROM stdin;
    public       postgres    false    188   \      o           0    0    dimensao_id_seq    SEQUENCE SET     6   SELECT pg_catalog.setval('dimensao_id_seq', 5, true);
            public       postgres    false    189            �
          0    98054    empresa 
   TABLE DATA               t   COPY empresa (id, matriz, cnpj, inscricao_estadual, inscricao_municipal, pessoa_id, empresa_id, status) FROM stdin;
    public       postgres    false    190   �\      p           0    0    empresa_id_seq    SEQUENCE SET     5   SELECT pg_catalog.setval('empresa_id_seq', 4, true);
            public       postgres    false    191            �
          0    98063    endereco 
   TABLE DATA               T   COPY endereco (id, logradouro, cep, bairro, cidade, numero, uf, status) FROM stdin;
    public       postgres    false    192   �\      q           0    0    endereco_id_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('endereco_id_seq', 201, true);
            public       postgres    false    193            �
          0    98072    esqueci_senha 
   TABLE DATA               C   COPY esqueci_senha (id, usuario_id, hash, ativo, data) FROM stdin;
    public       postgres    false    194   �^      r           0    0    esqueci_senha_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('esqueci_senha_id_seq', 5, true);
            public       postgres    false    195            �
          0    98077    faixa 
   TABLE DATA               M   COPY faixa (id, titulo, limite_vermelho, limite_amarelo, status) FROM stdin;
    public       postgres    false    196   �_      s           0    0    faixa_id_seq    SEQUENCE SET     3   SELECT pg_catalog.setval('faixa_id_seq', 2, true);
            public       postgres    false    197            �
          0    98083    grupo 
   TABLE DATA               ,   COPY grupo (id, titulo, status) FROM stdin;
    public       postgres    false    198   �_      t           0    0    grupo_id_seq    SEQUENCE SET     4   SELECT pg_catalog.setval('grupo_id_seq', 12, true);
            public       postgres    false    199            �
          0    98089 	   indicador 
   TABLE DATA               �   COPY indicador (id, titulo, indicador_id, faixa_id, objetivo_id, usuario_id, calculo, desdobramento, projecao, tipo_calculo, tipo, ordem, status, anos, unidade, projeto_id) FROM stdin;
    public       postgres    false    200   `      �
          0    98100    indicador_autorizado_visualizar 
   TABLE DATA               P   COPY indicador_autorizado_visualizar (id, usuario_id, indicador_id) FROM stdin;
    public       postgres    false    201   �`      u           0    0 &   indicador_autorizado_visualizar_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('indicador_autorizado_visualizar_id_seq', 48, true);
            public       postgres    false    202            v           0    0    indicador_id_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('indicador_id_seq', 19, true);
            public       postgres    false    203            �
          0    98107    indicador_meta 
   TABLE DATA               �   COPY indicador_meta (id, indicador_id, janeiro, fevereiro, marco, abril, maio, junho, julho, agosto, setembro, outubro, novembro, dezembro, ano) FROM stdin;
    public       postgres    false    204   �`      w           0    0    indicador_meta_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('indicador_meta_id_seq', 19, true);
            public       postgres    false    205            �
          0    98115    indicador_realizado 
   TABLE DATA               �   COPY indicador_realizado (id, indicador_id, janeiro, fevereiro, marco, abril, maio, junho, julho, agosto, setembro, outubro, novembro, dezembro, ano) FROM stdin;
    public       postgres    false    206   �`      x           0    0    indicador_realizado_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('indicador_realizado_id_seq', 19, true);
            public       postgres    false    207            �
          0    98123    indicador_responsavel_meta 
   TABLE DATA               K   COPY indicador_responsavel_meta (id, usuario_id, indicador_id) FROM stdin;
    public       postgres    false    208   a      y           0    0 !   indicador_responsavel_meta_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('indicador_responsavel_meta_id_seq', 27, true);
            public       postgres    false    209            �
          0    98128    indicador_responsavel_realizado 
   TABLE DATA               P   COPY indicador_responsavel_realizado (id, usuario_id, indicador_id) FROM stdin;
    public       postgres    false    210   *a      z           0    0 &   indicador_responsavel_realizado_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('indicador_responsavel_realizado_id_seq', 27, true);
            public       postgres    false    211            �
          0    98133    marcador 
   TABLE DATA               :   COPY marcador (id, titulo, status, descricao) FROM stdin;
    public       postgres    false    212   Pa      {           0    0    marcador_id_seq    SEQUENCE SET     7   SELECT pg_catalog.setval('marcador_id_seq', 44, true);
            public       postgres    false    213            �
          0    98142    marcador_objetivo 
   TABLE DATA               B   COPY marcador_objetivo (id, marcador_id, objetivo_id) FROM stdin;
    public       postgres    false    214   �d      |           0    0    marcador_objetivo_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('marcador_objetivo_id_seq', 139, true);
            public       postgres    false    215            �
          0    98147    objetivo 
   TABLE DATA               9  COPY objetivo (id, ano, ordem, titulo, dimensao_id, status, tipo, objetivo_id, prioridade, andamento, resultado, providencia, restricao, situacao, situacao_desc, status_medida, data_ultima_atualizacao, pdti_prazo, pdti_indicador, pdti_valor_meta, observacoes, riscos, data_ultima_revisao, usuario_id) FROM stdin;
    public       postgres    false    216   �f      }           0    0    objetivo_id_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('objetivo_id_seq', 152, true);
            public       postgres    false    217            �
          0    98157    objetivo_projeto 
   TABLE DATA               @   COPY objetivo_projeto (id, projeto_id, objetivo_id) FROM stdin;
    public       postgres    false    218   �p      ~           0    0    objetivo_projeto_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('objetivo_projeto_id_seq', 124, true);
            public       postgres    false    219            �
          0    98162    patrocinador_projeto 
   TABLE DATA               B   COPY patrocinador_projeto (id, projeto_id, pessoa_id) FROM stdin;
    public       postgres    false    220   �q                 0    0    patrocinador_projeto_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('patrocinador_projeto_id_seq', 68, true);
            public       postgres    false    221            �
          0    98767 
   permissoes 
   TABLE DATA               6   COPY permissoes (id, grupo_id, descricao) FROM stdin;
    public       postgres    false    255   
r      �           0    0    permissoes_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('permissoes_id_seq', 1756, true);
            public       postgres    false    254            �
          0    98167    pessoa 
   TABLE DATA               K   COPY pessoa (id, titulo, tipo, observacao, email, endereco_id) FROM stdin;
    public       postgres    false    222   0u      �
          0    98173    pessoa_comunicacao 
   TABLE DATA               D   COPY pessoa_comunicacao (id, pessoa_id, comunicacao_id) FROM stdin;
    public       postgres    false    223   z      �           0    0    pessoa_comunicacao_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('pessoa_comunicacao_id_seq', 1, false);
            public       postgres    false    224            �           0    0    pessoa_id_seq    SEQUENCE SET     6   SELECT pg_catalog.setval('pessoa_id_seq', 197, true);
            public       postgres    false    225            �
          0    98180 
   plano_acao 
   TABLE DATA               >   COPY plano_acao (id, objetivo_id, titulo, status) FROM stdin;
    public       postgres    false    226   :z      �           0    0    plano_acao_id_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('plano_acao_id_seq', 1, true);
            public       postgres    false    227            �
          0    98186    plano_acao_projeto 
   TABLE DATA               D   COPY plano_acao_projeto (id, projeto_id, plano_acao_id) FROM stdin;
    public       postgres    false    228   dz      �           0    0    plano_acao_projeto_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('plano_acao_projeto_id_seq', 1, false);
            public       postgres    false    229            �
          0    98191    post 
   TABLE DATA               �   COPY post (id, titulo, mensagem, acao_id, receber_email, status, post_id, created, modified, usuario_id, categoria_id, tarefa_id) FROM stdin;
    public       postgres    false    230   �z      �           0    0    post_id_seq    SEQUENCE SET     2   SELECT pg_catalog.setval('post_id_seq', 1, true);
            public       postgres    false    231            �
          0    98201    procedimento 
   TABLE DATA               �   COPY procedimento (id, titulo, resultado_esperado, passos, requisito, arquivo, arquivo_dir, usuario_id, certificado, status) FROM stdin;
    public       postgres    false    232   �z      �           0    0    procedimento_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('procedimento_id_seq', 1, true);
            public       postgres    false    233            �
          0    98210    programa 
   TABLE DATA               Q   COPY programa (id, titulo, data_inicio, data_fim, status, descricao) FROM stdin;
    public       postgres    false    234   w{      �           0    0    programa_id_seq    SEQUENCE SET     7   SELECT pg_catalog.setval('programa_id_seq', 41, true);
            public       postgres    false    235            �
          0    98219    projeto 
   TABLE DATA               �  COPY projeto (id, titulo, data_inicio_previsto, data_fim_previsto, valor, descricao, concluido, data_conclusao, motivacao, resultado, risco, usuario_id, status, custo, moeda, programa_id, email_tarefa, email_acao, gasto, processo, tamanho, perspectiva_temporal, complexidade, importancia_politica, saude_projeto, situacao, url_projeto, parceiros, patrocinador, area_executora, area_cliente, data_ultima_atualizacao) FROM stdin;
    public       postgres    false    236   �{      �           0    0    projeto_id_seq    SEQUENCE SET     7   SELECT pg_catalog.setval('projeto_id_seq', 180, true);
            public       postgres    false    237            �
          0    98780    regras 
   TABLE DATA               6   COPY regras (id, permissao_id, descricao) FROM stdin;
    public       postgres    false    257   �      �           0    0    regras_id_seq    SEQUENCE SET     7   SELECT pg_catalog.setval('regras_id_seq', 3589, true);
            public       postgres    false    256            �
          0    98231    reuniao 
   TABLE DATA               �   COPY reuniao (id, titulo, projeto_id, data, pauta, ata, observacao, convidados_externos, local, status, hora_inicio, hora_fim) FROM stdin;
    public       postgres    false    238   ��      �
          0    98238    reuniao_conhecedor 
   TABLE DATA               A   COPY reuniao_conhecedor (id, reuniao_id, usuario_id) FROM stdin;
    public       postgres    false    239   *�      �           0    0    reuniao_conhecedor_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('reuniao_conhecedor_id_seq', 2, true);
            public       postgres    false    240            �
          0    98243    reuniao_email_externo 
   TABLE DATA               ?   COPY reuniao_email_externo (id, reuniao_id, email) FROM stdin;
    public       postgres    false    241   U�      �           0    0    reuniao_email_externo_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('reuniao_email_externo_id_seq', 2, true);
            public       postgres    false    242            �           0    0    reuniao_id_seq    SEQUENCE SET     5   SELECT pg_catalog.setval('reuniao_id_seq', 2, true);
            public       postgres    false    243            �
          0    98250    reuniao_participante 
   TABLE DATA               C   COPY reuniao_participante (id, reuniao_id, usuario_id) FROM stdin;
    public       postgres    false    244   |�      �           0    0    reuniao_participante_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('reuniao_participante_id_seq', 2, true);
            public       postgres    false    245            �
          0    98255    setor 
   TABLE DATA               2   COPY setor (id, titulo, status, tipo) FROM stdin;
    public       postgres    false    246   ��      �           0    0    setor_id_seq    SEQUENCE SET     4   SELECT pg_catalog.setval('setor_id_seq', 13, true);
            public       postgres    false    247            �
          0    98261    tarefa 
   TABLE DATA               �   COPY tarefa (id, titulo, data_inicio_previsto, data_fim_previsto, concluido, data_conclusao, status, comentario, lembrete, arquivo, arquivo_dir, responsavel_id, supervisor_id, prioridade, reuniao_id, acao_id) FROM stdin;
    public       postgres    false    248   ��      �           0    0    terefa_id_seq    SEQUENCE SET     4   SELECT pg_catalog.setval('terefa_id_seq', 6, true);
            public       postgres    false    249            �
          0    98271    usuario 
   TABLE DATA               �   COPY usuario (id, login, senha, status, lembrete_senha, foto, enviado, pessoa_id, cargo_id, vinculo_id, cpf, rg, grupo_id, departamento_id, setor_id, chefe, imagem_perfil, diretorio_imagem_perfil, endereco_id) FROM stdin;
    public       postgres    false    250   ��      �           0    0    usuario_id_seq    SEQUENCE SET     7   SELECT pg_catalog.setval('usuario_id_seq', 116, true);
            public       postgres    false    251            �
          0    98281    vinculo 
   TABLE DATA               A   COPY vinculo (id, titulo, status, created, modified) FROM stdin;
    public       postgres    false    252   �      �           0    0    vinculo_id_seq    SEQUENCE SET     5   SELECT pg_catalog.setval('vinculo_id_seq', 1, true);
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
   S  x��T�n�0���ҭ�Iɲl 0��I�!��t�B�g��E�$�!Stڽ_�둢d�(
�x"y��=>��(uU�UT�����᚟;Yj�Z4��o�����%	�!�oC�SNyz )���a2'��#Y��w����S>#��P��hKЏ_�9�0�"�|��>L&]������a���O��@�*}��{\]��~:R���N���FSGi��ZA�`����D%JAy,S	D�`�:X!�	K7|žGWk�8���=�|��)Y�x��{x�s�1�Zy��."N�
��)�h_�<��=.�g(Hm�'8��n��2��l:��#z]�|V��AZbͫF6�z�u>�r�	'�A���zI��El�E��Z�����n]�$�#�P���P��<O[�Fa�L��h����6�t�c�z		��/0'��R	w������>�B�]�����2�����fUTw���J)F�
�هy[�0a��9;�\�6���|��uk6Km)��mRi%�6�}[������6IIт:�������I�~*�@`�7��v�5z��x!'Y!q�PڻI��\��:�+�������h0��apU      �
      x�3�4�4��2Q�\�@�Ȁ+F��� .x[      �
   /   x�3���4204�54�52���4�)�y%���%E���\1z\\\ ��      �
      x���K�%�q��笢7�F�Mޙ`Ɇ~@�g�\w��2���j���h��hc��f�<�d
�&�_��0����߿������������������/.~��o���oKzs������?��ן����O�?~�"�������ӗ�/�[���_?�����u�nyKM�����p�-T)4�moKF�eC��mq���������~��_g|��p��o�-���1�Qk�t��_{����C��y�f�4�MPq����_?���+��K��-�Gx����%�p�����i��O��?Ċ_�,�Q�.w���M~��e���7)�Q�����d����mZhjoaA�~���O��_>���wń!�>:�M~���/���?��}@t	)5��e�K_TJN�yv�o���˾�lk���D
?�g|l����N��m��=�a{ٌG'��1nq��&HO��!즄����T\���JK�KE��dcy�-���Lبy������[2�݀�[J(�݁�Lf��9��1�c�gt7����#?e���g���-�F�f)=�+=I7/���K�%��6���E�LA��tb�F�E���s�2#t�KWi��ܤe"�����Eza�7i��)ދ���5��:J��-\FOy����>Xy�F��#�'����Y\j=\&�ΤU�����|R�/z�2��<\+�����˜��H�uy��(ޖ�r�Vj
6��(��:/ղ�L&8�y��(�a)7�b�c�g>�T-]a�(x�VY������4�����u(s�y�1�len:�N���t%؎���=�1�~)!>K\�̀��m4�C
�}Yـ�=s����dh�2(6��^&C[��@��p��6(UQqc#�:�Yd�#{���:vO3�{��(�R��++^���=����&����M::�9���SV~]�Ej���6l�Ê��;�+T���-w�*�{sS2�g�g�wȆ=l�AJ�M�v�
�>�Z�ҝ��~�a:�w��IAߐj�������]��e�gksP|�&{�eN�Cnq�Nt��l�e`;��u+{��"=��N��w`q�Pr�G�����J�J2�*V�$p��~3���Ro�BN�݃1�8����⠊����
le�"��AW���ϲޛsC�e�ŷ�"������F_;�e��3����`��$��q��g�^⁣�C�%w?2Q�s��'m���{7c}�� �U`?��U�����a'ǒ���]W,�.����yy���FDc��ߘ�ϸ/G���xD�����+{���؁[�b� ab<��&�01\dl��7Llװ������5T�a`K�����t��ٮp'�	;�yd���u�y~�+
w�bl��7�l�!?&�6&,��Nf�'U�]��X��wƑ����;�LqdȲ��b� �zdȂ9f�.�O��!�>��	<1$NTdrXZ/N�����Ȋ�QH^`ֹ �a������K�ҧ�E�d��	+]��1�a�%�d�g�@�
�N�ǃ�`�������͟�k<ى�
��z;Lǭ���F�g�{U1��ث�']���p�{?���qyd8�8�+ʎ�Y�)i��#�)�S�Ѡ[٤��GcNY�Xߑ��@Nvd8��!dr���G�#���u�#�)x��u��V�ڵk���GS�
s�<�]����L��-ڢ+��\,\0�+<1��,�5D��L�簒a�]�����)f����b�~8��0]��ĂK�1,Mu~ ��4��N�X�X�'8�����\��ĐG8ˢk߫sU��"SS��.�ur A>ẓ,{v�<���^�c�!�E&�65j�Y%��6�p1��J�m�aI1]��Ě��_���x���*��Mo�?-2�'D��\��dhF45]iTc24�TA�@������M��eb���a�"�<T#+�W��E�ɮ�b���-�><~����|%j�o�͔EZ�eZ6n��x�귡6���ޯ�BV6��L��<�%ڲ�"V������5(]��y&�(��i�/~f����>�E����ȎK&r��lO��H��9��EoSB�6L���3���7�8�X�Q�B;%��.K�X?���æ��P	=<(T�afa��ævQ�mD���<�wT��7�M�^.㄰9o:�c��#4�n�"y�[�Ԗe�O�e	�����Ɩ)}��c(C�%l�7{��l&ڏZ��752�vcXF����f���-$�����v<�p�>��z��E'�&��b���G/�|rȌ�J��,?OvS����08z��=g��n�π/�4����j��P�_9���{X��I~��Vp6ح� vTX\������or�����(��k�&D���|�a���|��pկ����
���zɵ|��q݋�k�f���՘X�����(V����[�'�-���V�1,�I�
8;6R�j\����3�ݥWbd>e3O�P�����Q�a��
�ʊ��bt�k	G�ʂU���7ʧ��kg���n#�qvp�0��S<loU���_�8+�#��32ζ�*�]��ߌ�s�>���c��e��рfh0G��r�`l�0c-� G���-���e؀y������ca�=A���ZN�v�g�3L/�C����N��t�k-Ga�}��u��+����2\k9+��Ņ��r�}�@�
���Cp�#�;p{������Z�����(7��r�pr<R�:�`�f�h�I�q6��jb�kGano����TG$�z�Q�Ȃ��C�X��,z�T��Ց�c�%M���?�叧�|��E�G��\�Җ������#��=hEU��Z�����:����N���o*�����~'�e��|�	�t����uŕT�/��}����9!>i��7��M<����omX�n�o�� �dԳ~�[(��u8⎕Q#Vb��|�����d�Z��p1��+{�x�y���(��������#lp�B`���W��l�:�E�/l�cF'�Ѭ���-�o"�a����o���G��G:�~�坶ӏ8���va���<n��g$cp��G8�H��<$n�Q�64�
�w|qPƜkע�F'nO��ljV��Z��w�ψ�����5�8	uX����s���
�`~��}+K߲��,�"��9'?2n�v����Ưw���ZYz�o���+�.̍�3p�����:��,�!�2n�ͪ,�!�0.w�R��n��s��_�3��>��P	E�n��!�D�"�7���xR�(�Jvþ�?R�"�7�KoP�C���%����}��:�������U�Sx�o�e_Ġ�w ��������b�x˾�/���y��KTž�}#����7^��
ӥD�ߊ�GQ4
Ѩ���j��X�ٓ�d��Jc���'�ldX�kD]0�Qv/0Ź�/�:�G�ү���4\���3��am�#�UW��Y#��>Q%F8��[�҂�nU�F�K���F8�˞�3(�2�pt;ݙ{�*��s�a�V��>}cuo	��!OF���mE��}k�/l\w����+̳ ��M0ڑ����F1�ю,�BS����A��Qn�#k8�K�I�vtïK2T�vdaO����ax�U��#�hG��C�h���v��wXo�YX�EfR�����{�G�f��Rh��Ȃ�/������T���!T�t$����75 9�Y8jl�[k�K�v6�QqG�.��`�#S�^~���td��U��HG��N�F�A�F:����`R�O��a�c��i{�s3�L����10.�d���HG��C��c�#7�3�x&����:
������	�����-h᪇T�'���3��`~,\��z��&���>p^�U���ˣQ��X0s9�ԧ�2� s����"�Ă�C5@���5�;��:.f|ܼݽ0�6.�V��#�1;�e��na�I���2��5
K���eZ�n��w8��,t��ǂ-:P���k_�y�+uv#�m�<�@��`�a�э    XW�Pُ����>�� :�
���KP4��x}	��x���v��~�r`���,ê�-��h�`Y�	�`�`���+��36,Zs|�lb���r''��6SP���,�nq~�h�)�Ӳǌ&����x�.�����q�,s���2^�,���������=�*������@�ɤy}�jc#��&�p}�je=��4�a��W{V�s~j��DW�d���t��D��|��U�M��z�/�g��;'l��6����mE�I�?���؝�2Bx�)�&t�0�
���e"wl��ɷPa��?�|�#g�c�L�"=���X��X	㷜���r��bXnɱBZ�儕n)�r4A;�-�	��G�Q6/ш/�����F{�,�Dɶ6���3򽴯�^�h���f">ґ�h�"��)�!�	�0�[e�DFuF#������N�FV~C�Ad�u,��*8"�Vs9a����Վr�fJ��z�)�*_�r�a��i_��YF.q���:��:ޥ�
f�t�>M~��1,.$*;�R*wy���bYF�f��Fg1u��d�42�aUw��UY�uЄ	��Ű&c�:�͎�̔��b�<�8��YnV6����1,�5���z႓�h����*w����bXf�!{�ۡ�fh�ш+gl�m�8%[iŲLuW��m�]6H����dW�D��wk��U������U,�X.2�M��C&�	��bY�x�h4�F�`;x�FR�,c+�0o8E�lh��n�1R�<ʝڭ�(.b8�)�FL����]SWe�Ҳ�ֿ�!C��ig/.��H�|��)�$�e���a}��UNX
�%���i��UK#Iec�R5aK]g�j.U2���T�T�X����bY���*9��-���r��Nvvn7f��'-匕���>�J)'��8�s�����vcPEA;�C�z�U�q<���0�Ģծ�ِ��8kRc#��t`�� `�HFJ1�Ln�"���S�l`�fg$��d���H�&6Z�ek_��R,�&;�5��V���ծ�e`�FKy52\	�U)J�FKy�j`yqS��RL���.d˞��bY�F(;�.;�a�$v3yl,��w�llґ�CA(9���:�*�2� ˋ�O,�ԥ�~b�/S��O�PxN�#�����J}�|bXf��1�O:��LdZ5��,�q��iu��l���VG�Ig���v��8�^�y�����t4H��w�V1�z.����T�|�S`�����X���Hɤn�~^��Q�#��4��_t��<θ<����֫���0��n8��)E̕��	%nlJg"fm/|b��\�Y���y��C>4�<�?�=�@3��~Z������̵�Kg�g�f��%�&�:m�|��-��g�幵��A�g�5|�����k�ҷ)߲�&"���oI�<�S�e����i�i�o*8_A�����	I�^����JQ>j�p3�./0���m`��d�`���ɼ�͛�WF��%#�"~2����U��������Ɉ2��kI�5��a#�2��?հ\Z�4�e�X��ɚ{�2`ns��;�ʘ�q���G4��a}.L�F�ye���`T�2�,T�dT��^�e[d�ͤ^�p�n��2�Jd��
���e,��{��J�v/�@0ڌ)AH����f,3���l��a��f�'�c&N�Az��f���Մ�X6`@���&�Ųԝ�x��X��Y�l�"�{�ğ�a��A�z�-�6iF9БUI��e���&Ǩֈ�\ƛm�g''0e�W}O,��&�ᖍ4s�F&��Ό?�d^i�0�-6�Qg,�4e^�h�X�(�v!����.|��¸J�F���]6X�`8���`�NQs�I߰�kZy�c�ЧM�ˡ�صT�&�	w9�W�si:#�X�2)�04*M�/0_K�fTZΨ4�MܦH�m����&�\�7۔�f��?�Uiv�cV���~�e��NW��N�
�� �/[���KT��j��`ϳV�H5�a��x��H5uya��W���w���Kw)Qz��[�;,�i.A�^����?�4�D�7��.~?B}��x�)`�tM�^1=��T=���p���@mhiF[)mt�#�@2������9���nN���E�ơ�{2�ƫ,W6k͑���,6i�	���d��9kNXH�x���Hwc� �u��+5�]��X\	��y�pxe��A:�H��X�Al1�n:��7���M亮V��kG���5��a�&���D���,����KO�c<x��D�T�~"Ϲ�^=j�f��t�&?�^=rKq��3מ�IL�mʚW����P6�a:X����Æ�l�|�h�,�kⷍF^�WGqL!����<�dZ{ǩ$s�o���˝�<�p^���g��,Ć��X:�GP��O������-Zr��zA���L��o.�Үb�����g���1�p걔�C�����hO52�^h�`ĸ�$�!�\������F���*{�0�(�ݳb,LO^_3��?��P�m�QbN
�LP��dvD�&�e8E����+�8���m|̑�}�EY3��͝W:�� ��՜���Se<Zyh�B�-�#H�.=r+�1�0B�Ʒ�$�5��p��������� ��6�J�����6��g}G -��,�0��K٦��ƁJ��P��˳,sk� �܄Q���K{�܆8�]8��enĨ��`�^+�܊��rAY�fT�G�c��lQ�:��^�B�-���/�M������f�tT5�Xq3[�k㘾���-��R�
��l�z�E\=+nfKup���f�dv	�^�-��sR�Mf���q�.m2�%iO��3[�7�Y내��ے�X=����s�W���%un� ~nH�����#����pA������.#Ma1R�-:2�<7��t��z#�m����K
s+z�T�@_��\��0sYcaz��&���	��h5%a&����b�k,\T�N�F�W_�8�X^���܆��5�	m�ͱdB�b#l�͡5l��	4�C�16fT�Vc>5�\�	�2)1�C��	��z'��6Ǣ��_� l��	��$����9�{�b�*�o�i~�b�*X7�h;�a+i9О�:�k�����WI�)��� ���\�\z2 #��S�m׏$���s� �bMMG�Q���15��ہOM�>������w�����a믿�f�t�Ө�UM:�9����{�1#̟*�R.�����,C+��s�c���5N��<���W�<�q������/�jV�ȳ�b�>⚼L,����i�_�n�>�/ТA�����kw�g���V�����o��[8V�~���"�AQ:t)��(z�,=��=}b�H�yD�����	�)Ȉ�˽/��0��S� m}<�ԩ������` ox�49�S;ǞA���G��E�{e|1��9�c紽�$��ޱ3# C�j�U�)�r Ujw�̐F�sX���tm�N���uy���������il�� ��Q�/"��ѷhwL���VT��՚ɰ�;�Y;i��$ݻݱv�Wg]����j �������c���E�p�Ŭ}t���?P��$U��2�
G�j�8�/�1l�ϩ&��q�A��d�4g
�̤�ּ���V<�z�NձE
����M��J���C� ww,Z�/�P^�;�ta3⼥����5wx����f��wF1_�/�bwg끣����;�X���9���_�cO��7���;c��w�et�{�#2t�e.�Θ/뼒�;�&C>�B#�����C�?Y~G�>����J?RlQ�O�;=�I�7�O���g�U!������F7(Q��C��|^��G��1�@U��*�yE��A_+���׃4�@�ZiMe� wZ�3�_e����W�eTk`������>��n����%W�Z���0����_TEM�#v����Y'M�����:P�vt�����}� �I�CS�t_��k�xGC�v2g�k�x��橗�b [�h�u�[f:b��n�Ѽ����� D  #S/։7lY�	a���Լ�ֹaK}�݋u�[�K��:inK�_뤹-q���4���M[��-qp�'�4�%�6�+n5�m����b�4������2�m��!��^Ms[�~#Nj���1$�R�ynJ�o���%qdɤp5��O��#	k˿E�"ynF��2�T�s+F*�Q:H�12����k��KYDXI�sj>�(���-�4�X�-��1�z�)Me�!��AG�{.�Z�6�bLXmp��/xt��LS�_8�a�b�lˢt�2��
'F��A��ck�{еm�0�"���֙	{���zÄ���J��7,�QU�����7����-��Z��R�܂�X�S�܂즸8W�܂��RaG;8�Ց:;�`��2s6�٥�s�m0r)"��6W�p#�v��Ȱ�D�`g�QQG;��QQGL�;�vÂ<�ju���%<� �h��Xd�<�:Za͕^��s�Ka��6�9�`���4�!GL?�%�-�5�UxnAϛ�uxnAOѡ:����U��k�h�F�D�66�`&��b�A���|	aaޒ65���U��H���b�A��sU�܃8��Y�� �h�y��QF�c{P�	�V�3A�`�F��{c������ރ���b�A��S0ib�A��F��X����l���mc�&��	H� =1��h�<�ab�:���l����53A�6+Ec��e�Uo����^�w���=���8�ƺ�JSʖ�4�mb���/a��n�ҩtzn�@��6Vb�gB�&oc%&�,<7�6+1��IÇ�X��kp��u�6Vb�7��׶���8��}N+1�����#j2�N������Y�?�[oc%f��>��J��z{7�:s["�on4D�ckOZ���&��!��y<�����G�J/xh�-������GQI��薞B���Qosw�}�	��3a+|yy]a=�r:혋_� �0M��7>��T5��Z^�����22�{��~���1��*m���T�d�����	S������mx4&�M?�Q{����>Lc��w�ۘ`�9�|eu��tr5i��0��)����/2{��R{^at%is���t#,��;_�ƙ��^��X���f��<Ȗ�_�^���;�e*�}6�vǰ�΋8B&�a#ߘ��d3Iw�l����@��e/�ƞO�]���Xf�k�JGVo%;�o檗����8Y5�U/3�.i�u֝=��1W�,˔)�-��^�JhW+<i�Yw6��؉�Z�����+S�y\�S��;�`�/��'�~ej�Gh�6�~ej��>D��'�c��pT�~ej��@'#�����s�8lׯLmpSu>;���Y�_�������Tx��zG�6����a���[{�+� �|J�b�eZ�@�E�"���6�&;��	�3t�!�!�	�;ñ^*>�=�_h�$""�8�0_�'�J�&���֟�&���{��Ƶ>g��}4�d|a��,�4��i���뛨������sϺR��Yd���]n�c��x�6�Ѫ��;拨~WE75�z��b���|6��:_�J㺊���ǹw�D��|W2� ��G��qS=�:c�F3߄��Nٳ�H�Vy�,�x��HҤ'�B�ǽ�|��Ya o��p����_i�+�#\�d<B��h�3�u��YD��c��M�r��������=���`���[&9�+���ؒ��9�Q��;a�oA��Ka��'��}���1���EO��+������+��t��#= ��cę��#=��k��Gz�FkR�/��l0/�~�j���`�h"_�t���|��v<��7t�8ZM7<n�	f�8@,���`��;�*��QŽ�z��q��v��}�l�:�u��u-��￢s��@�q�l�P�4�*���~��V�1'��4�*rtTj��ϭ��)-�ܪ������[5P�(#�̪a}�;�efV%� ��.�fV<)�ru�P��xջ�(=Ϭ��58C�3��)n|f��SD�|fհ���̪��~a���3�J����[�k�{d�[��M?m��U}�gP#}�9S��hN�2F:�y7��?�~Nx&o��X�۝��=��
����w�o<#?�
����Z� �� e��ƞ�EӦ=�g\ӷ4��>�g�H��%���\qN��p��5�jĂGi�	@x}s��f�0���0��q����د=r3�ɴGi\��� X��(]q��ݫά�؊e�ՙU��`�-3�*w��v��mf�-�R�YU#;}���̪n;΄7�fVu=k��V�6`�R�[5�s��d�̪�ٛs�mfU�����YOg���.�fV��ǥ���3��c{�y3<�\�M�5G�^A�z���%�z9{����Qa3��/C3?���^�:ґ� p����e`f����K_�p�1�;�p���A�,�la�5���}g_.74C��a_.?�-c����f�[p#GO�p����n�,����KBY��rqªpWr5�<���g]�[�)�<ԝ�-YMZ-����v������̫D^B��;J�+<_n~����^����b���j^`�V���Y��;�g��? &�Ӥ�d��C�ʦ	���$�0t�� �	�K���,K�C6���m¦��D[��Lp���r���֑5ץt⫆Y[��ٰ�!zZ��vi]GɚtΖf���z���)mF�S�M"DK#S�M2�3:t:�\gt����:=�c�=P��D{F���IHji�$���2�n��7l�+*}Öa��-��[2�iYJ~���~�����|@str���Y�	�BK��
�˧���\�w`$����IPi��pO���=�'��c#�O�d]���xB��V
ټ<~��/�_6�����dg�\�yĂ����/?}���o~�����_�&��lVk0���6i_k�`�]��W�<X�nWC�û�^������k�{��y`MJ2��ޗ�sF��q������,(�,c���<0��Uk����!`ލ���ޭ��|����>*�M\��'-��+��[�f�H���55����xU�@�����0�3:ir:����z��+k�~��q���?<����an�      �
     x��]�n�8�v�B00��)��қM;頋i�m;�7Z�����`��^����`.�)�b{HڒlŎӭ����H�<��9<db����b��G��9��<�'c���B��'�d\�j�����5/������ղTc�}��i�}�!�[��2"�ڣ�o�/d�RA�
P*(RJ��T��R�**�mJ��T��yR�9�i�,�NA���m�[ϗEr!T�+�9.{�R�O���L�kq���;'s.R5fΫ�ϑ���(�?�*��T�X���JvO~'j��ʈ�~.��RW$lI�z��i~!2�v �k�U&�%W��̌�(�m��B��n�0�gv���3F�C�i�E�@+0�&�i�T�d5-J�f����x�Aٵ�1>�'�R�\ 5��E�m�q-���hu`�b�o;6�G\��$��q��GB7t<�Å4�Iè	H#N���<�*����ˤ�l�k�E��,�϶|�s~��'���ժ��]�O��
�bQȩ���RO3�dqR$ъDj+$A��WnѲ���$˯9��������l&��4��-CoU�!z�W -}5@�e$�0�k�����iiR5��>ݫnw�R�j����� B�`���W�\4[��j��t�I�(���v��3�ؗM�Sw�|��B��, 	��4Rۉg1���p�v�ڔ���6Ե����3��_3�A��(u���zY�8�x���c��W�E��i�����b6�v�,P(����l4�)E=��_�yA�"�8A����o*��f�yR��5�.g��/{b��r��|dm+!_��.k-���r�6���a���4�ul�b�d�!HEh��ϩ�%��_/��K�0	��M�|.���|w��kR��J�C�ͦ~Bc��z�1?	B��!��ԉf.�O��BbR����F�R�J֭�k�ބ�j����;��I(�I(���P�Rn�$p�I!�M!N4>0�<�4@��7��7�a5�&���gB�	}�Ч�!4�ﾡ�~�Їj��	}���`(1�τ>�L��>����>mE���o���jsL��}x�O]�L�3�τ�N����=��w4��o��ژ}�W���^�_�E�&L��6�`Lʂ�k�#ub/J:�qb��8�ʀȣu���X��;�qb�ć8�6 ��:�f�;V'�{�3Nl��'��?^'�,���xM�~��Ɖpb4 �9�kɱ:1޲w�qb�ć8�6 ��:�f�=V'��®g��8�!N��=^'�,�;��8��/]s��ܮ0a�n���`��?�Їj�̝��Ї�/���'dm�i�4
(�Zd��n~���:Oy�\�޿����Sh[|��Z�w%� 9���v`��]�Í�OGg�E��|>�Z�s^��@C�-���O���
!�x��<m���LDb���HȐ�����8 ����h��A�9c�5WL�I>���;��b�D��G%`"��1I�I�L��M�0z��G��I�V�s�EJ��빦Hi��`��=�"�f�X���x��3�����ڀ�=���1�r��}�]��D������̬��U�`�JαmH�:��r��M;P�Bb�*��On�ʪ$@yҥ����e�b�@�u�>t�/Ųu�I1��l,1 �w|'�ww��^o�j�N������&nJ��[r+��e^ln��:m�51��J���[2�l`%<�K"QǪ&P��up{������O��ji�F��=�{���梢�**������\�.���}�{��tp��q�g{�����{����[��h��G XZ��,�X*
�ݲ���X������n
 s���A��˰P�}�[Qu��(���s����ۀ�c�T N�m��ڤ}����p#��n��m��e[θn[{�m�庌����w�M;d�֢�ռ&x;�I�Zr�˽<�����^��4�{yx"���^�4�p�.���oo��-���9	x���2<�i������"�J�f.�St��W\#�{b������^��s� �o��\8���PF�@#�U�8�ޙ��.�]2�Dyv-�,/'�/ �,/WsK!2,���9/*q g��t+���FW)��������D|��X֧0�B;^���^d}�@;tMǋ<�L�$΋&�1vl���Dx��DPMęg��d0%eCO�����ε��^$3,�G���f���V��ma����X�,�>�� �-jY	�|�z���9KV���6����`}�Ք�+�)yV��$ݰ
0�r� ����	zͯ����"u�J�:��#J�eۉli72�6��.^�c)��I,��o`)0pG2��O#1ta@���'��k�t�I��ʇP���������|���jۖU�(�'�4�-=ss�A���?4|1̀�A�ô&��&�=Z�ٴo	��7���Y5�|΋�u�yԡ���w�Nk�� ���
@Xy��23����z�00L�B2�5`J�vP�b�:�p�ז�U�ob����Ƙmp��h>f��v�c �rgCW11��<�y;CMB3)aB�>k���+٩}t�w��U�7Z8�S��ofz��:�n�v�mC�3r0k��w��͐5Q�N�q�Xn���ƃ�Zs�]r<u�ـ��	ٟ?������[�}Ω��-��[a�b��&:>�a0:/d-g���n�9���X���������{�U��(ڰ���6���7l�)#��︁�F�d���ÇW��)�R9J͇$x������ʣ�ZӴ����K+.�է��W�'x�������9N3�+����0Bc�>J�)U�'�s��!	]���0Q�٥v�s�v`��"��ړ*�/�.d�t����ȭ�^�p�i��ʅ�џs���	9Eų�d������@M��ͧ@"ĳ�8�7��p�H8 d-+<w���?��������˷�^������gﵑl��C�)W�E��GI?\�
Cd|�$�J6�&��G�M�Un�b�l� �*�,�=�\v��M��}i��N��Ca��UL�eK��t��M
��2N�����	Ư�O�?�R��^����i�������ej�����o�Ӧ��������e�<�e��$I�h��@H}A����(���(�m�ޢٵCWL6�u�����6��LOF����\|�Y��D:��E:��;.�c� ��i�;}�ן_}8�����8�v����.p:�{`���8�0.@�p�q5f�`�L��q��0.��?�����>y��7TK      �
   �   x�M�K
1DםS���w9��k]�i�V�4t�xq�Ar1M�q���W�@л�PS��d{�8��>�Y:̯�d�F�a�,�Z�#A_�	l�Pb)0���8��;�kr��φ:�����B�� ��ZB#��}Z�T��H)��|A      �
      x������ � �      �
      x������ � �      �
      x������ � �      �
   �   x���M��0F��)r��U[�Hh�H�����".Ģ��Ɔ5����O�@�$�Qj�>��x�t��lA�x�t}�?25��a��P���]�#Ɨ��p�CwL1ľ���{���{��ew.��\L��������[�%���?P>�\%3��_�1��j�	c��Sp���\���v\����P)�*Qb�      �
   �   x�}�;�0E�z���(�Pђ�()Ә�B.2cẙ(��� � a��wn{7Y�tc,`���*AO��ћ`����IL���M��m��������[����aAM�b��~<�%RAC1؋v:�z����*�R4��9�y�گ�RO	g+      �
   2   x�3�4�042767�0�442"8ei���i�d��8����=... ^b
\      �
   �  x���Mn�0���>@��YBJW�T��n�q!m#Q������5! ��*Q����yޛg�>�gT�t�fY��w��qN1i�˰
� u#�U�l�ߛ�nn�xY�kY��5A�vK1ބf����hVG``��Q� J�r�\���+�XDٵ���:��!ew�)D`�r�P�	�4��`�������@aCtmе��I�3:VI�3���lљ����:h{�����쉓o�vFe��� T��@������Ê��b/���#���Ad���q�O��<�,�D��Ef�ޖ2=�7�[i����$k�0�-�ٖѠ���b�t׎4��z"��!�^�+�u��U�(�Ĵ�W�e�O�C������ʯ�J�����$��tk��}�_p�	[      �
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
   �	  x��]�r�6>�O�K�N	�ɣ�鱝tz��`3鐔�����SN�>�_�
�(��%(S���46��]�Ϸ��$�hH"�p��u#��_࿿~�*YoV�X�u �e�Q_y�U�͗�X��ߢV��4U������3�`)�E^o�y���G}GP~�e��c���zQֻ��i�M�.(т����<�Z�l���H;A|M=B�;����e�rF��n���n)������Z��R�-����ӷ��`Y��,ʇJ�E��0ޝ����Mȼ$�i�SR0{-#��|%��1X:S��1l�����؉-b��P�9ڂfW!&�CL:3nń�>'1���4�I�dNb�C1{����3�@����Q4�R��:��[ã�V����4����9�,����NⅨ9>��C�\L:�RdrGJ�����:M�?9�qnS��0�NJ:s��&������f.�.�♋��?�����,���:��s�S�����ܧ[r�g(�+ͷ����tK�}���;�Rz\���o1��]�Ft�!c澭�B��ۺ2 l���`4wAuu@�ʍ�H]'��."=����yQu
��$:�������91C883soΞ'���n�_�u��)���V�x���LK~N�p��<�E�ˋ����J;XG��p��*� >C.�HxR�g~d;Ց���NK�q	��W���!B���y+��_����ћp%�!���Z6�M$;���qcOK�hKG'�L�xevZ~@����a��7M�ʿ�t��J4⾬��c6YAuXW�V]�>�5*�4�/ke��>�\�����4&!�#�l�Y� !h��T갲Wr��<�,�J8_�M��oP�e���o6C�'�
?趼��H�@1S�*�����ӥE�� ��N��$Ƒ�
����Y0qM{9V�Y�T�Y��x��]���~fl#R��-�N|3�~f�\(-3�W���Z�F-�K[�Sf.�s��tL5��2�*zy�8��Dh	F~j�c;���pR�Z�:��6���Q��׌|44ڝ�eƪjo!Gxg6L�u� G�vĽiE)�삎��c(���u+)Tc��)V'Q�qx{v�򓘘�0bU�/���*SET���Z�@l�r-mN[4&1��Val8F*�Ve�BeV��dAy%�ˋF��O�'r-� �U���	�$~�������a?�z���u��x(ʺ�G��F6X���Ƅ�!���M600�@љ�~�ʑ�)C�{�p�7j߾efh�Hf�� ���4p��N�t,�aT�Ŭ8��	����lؒ��W0nQ͘�B����ǴD�w��Dl�h���({cp�#�E�e��S�W�P���Y����G����\�]���bˢ܎A�S�X�\��4�u��-�*�tdz�D��vC�lG�����3yl�O���^� ���ܦ��'ls�a�U����`���.q�3�=�cHh�ς���Κә��QZ֢���Y�yRV�e��Y,)���ȱ���C!�=(��C�и>�v�\�DL��[Tf��	���g��t�:pGǟ�)�v��t�g'�1J� �\���#Z���O߷2��m.�Ψ@y5��)0hKIZ��3k�>C��	��:�5Ը����^Յ�ԸX�UKA�s���U/��l�\"j�C9-s#�����#�aZzP�O?��ՠ&��Cj$f�:�t1��pT IjK���O{��9��m"�F�\=�ۨ�L�g�&�8��]���R1n&[	�ᰉ��	��O�V��8v�V�#kjŜRx��T����eOQ�>+BQ���m؋�8�7�y+5{+*t�
 >Uc�,�-<w
>�0j�ƓD�l���&�	X��4�"��� c��E��]t�4	5��.�bO���"w3��7{.���vY�L�q���,<-�u����[�]Z�-�;���� �!ӦC;�ä��OG|cB�X՛�.2v%\)��?sә��g�.���{e��5������;\��і��Sy=���+e%zu�R�QT_6RY�Q=��G�۸5���RI�{?���%:��^��+6m��pOiM�CPwi���-���;�;`ML�πr�'���1��t���R$�������$�� ���\P��9Me¥;��cD[s�w�`/�B���֟o�-�}�J�aV�j��h��wQ�|��oE�����H`�b_'0i��7b���V�'>�\�F�]+�'��A28�L������89���밍w^\|��)W���K�nД�������P���O�#[��3�����X�3�W|8�S+��Ը�Z�g�$'�3�*
B��D��cGw��|�U}G�69L��������M^4�Y����%js	'�8-pj�D=N��"�"s����X��͕R?oV��rة9����1�d^� ���p?�C����,������g�      �
   �   x�%�K�!�p�	Q�˻�9&�^tD5���b;�16�X&�,rX��n��y��vx�օd�=-���!i�:� [��\�O����h�@�J)��A�VˋQ����E�᥽�j{1�����t�H A��Z��T��5�`��G��A��|�����!{���ˏ.���/�kγ�\W�]��[ï�v]Z��su�x�����b��;����b�Z-������xKL      �
   x   x�%N��0:�a�j�%�t�9
��*���:��aÊ���a��jD\���Ŗ�"L�Z�>�|�Z��@2A��@6�S�ֱ�hQ?5/Ք���J٤����b��h�D�I�L�s�{ ���#=      �
     x�u�Kn�0���)|��Ň�A�4H۬�a,�`aKeAotQt�eO��բLrf�.��曡�d�_|���w���vK׵�ϸ*9f���z�)��n�����O�����{�v?F(��l}�[�
�d`P�*���2������ �ڲ�q�,HS]Y�W]?6���6����ք���lPa�$#�k_����ƺ��9�w���MQa_�o^Ȟ)IVW%ʣ��0N�J�Kk����^j~���f��Y��uŽ�K[w�l���tAQ�LBRs�$���D|�lj�i��-��r��Фd�0[US���. �7aH�~�%¦  ��hJ�&7#A���4>7�ɦ	�kP�
W0N�+cT�
?������\��� $
T%YAb�%B����;{�n���s�&�j
��fl
��fa:W;��j[�Ѭ 0)i&(:�hV�e$!�D�oZ���k�ׂf�]�%㘆'���r���Q�)����(��FyЧ���ѷ#"3�I�la0�aw����M�Fi)��E���(��"�S�7���dk
		�P(O
Ƨ���s��w���WG�~Xl�,~l^]���k��k�3k�k�����v=��\0��*8��=;?�������xc��fk! ȓ%�� �i��@���������3P�"$�Ϭ$�����Ϭ�o��%O�xjM(+�����DyP(��5b�TD�}�v+o7v`��-f�{<��e�A2��.K��x���[��\x|���=5ѷ��l�����      �
   �  x��WKr7]7O���!�?"cE�Y�bo��f�! 3�H�qe��"����09U�0�F�RM��_�~�=�S��5�����g��?K��׍q�^���Tȝtg����,}���!]I-]��f��	[+��g^���5�����#���G4�A����b+����Mkceͮ��Yr0��n��lcJ+�V���t+ye�|�w@콒;!-�b�ӹs�]q�%�tNkQZæmպ.Z ӥ�j��D��y��dD��Pp�b3c���$�5o�a?m%�������vel8�Ʉ.��O��j�T�U4&@����4: �O��7��*��$���>�P��-e�8%����₫{���Y�4gQDS�=4>9[H��;8��]��(.	[����������H�QN���s[��4p��E�p����㲴��u�1�c�S���Er4�j "���!��t^s�"�i��o��2�l�#��AjE)��_흧L�%9���(���=���C@��W���>r���tG 7�q�^ QL�e�-dm�*Y έWS�ؑ�hme!���O >�K�,A
|i�����5N����뜴�΀p�z��T4�~-u�S�:�OBE_�t�:��B�B�)4ͯ�ք>�9N�VrP�!�=t!Ʒ�P�_�'#Z	�@hM�6F���QzY�fL�$�'�RAvC1������q^�T�a�9i����C�)��(�`}Ά���y�y�;�`�R�#�B����:N��9���c�(��}����5%�`�7���UK������j���B?a�<)�I��1md�u��w�.�����n�BW���Ѝ�
)k���2����⽟&���2G<K�)u���&1͕���eXz�	ɝ	�z
��׶�J�
_H�����x������V�lxP�����L��� O�����@���\���,����j��~��"$��_�)�`M�۾ߔ{bNB��<��"z�1���̢lLK��`���.�Ъ��lH�#c`���Z�=K�������l	��-M2��mQ�%wn+�w�k�2�&���X������5���/K�0����b+����D�
;����w��	�M>|�>_q������G�+qF�;��k�w#}r^�ؕ��#΁O!$�Z8qj���Q��O��]�O�����)���<�#���=����[G��Ѹ��� ty���8�(*)���#����`0���C�      �
      x������ � �      �
      x�3���I-.I�4����� )��      �
      x������ � �      �
      x������ � �      �
   �   x�u�A�@E��=�ĸ��$���F�N�̌���x/�`b\�i������V�:����M�i�M��P8��g��VXTe��ZY�?g�T��z3����`'��y��w�AB�ɇ�ˉLPd	-�b=cG茿~#��2>�5�-�G���u2�ؑc ؒ�-����/�B&�����oj<w=$���
��GQ���[�      �
   +   x�31�(�O/J�MT0�4204�54�52F0M89�b���� ���      �
   0  x�ݚ_n�Fǟ�)|���?�瑀7�0�P�/���7QשT��=A�� =��{���+�"�@�����)r^��G:��ȟ��N�3���(s��fy��e��-2~�Tl�~��>�?�<s�xS���YY�l[T�Uu���J'/w����-�6�Plݧ�P���~��0���oS��e���̝���|���?g�8w�揬���۠�̓�8NN�����|ʜ�}���N�I��ſ�v��J�{�y�@���������<�{j��Z�X8��V����L���2i��g��Tp�'JŧJ�tʎ_&d�Ӱ���@/�p�%g��Q:N�:*谇��4�w���ed����.Zī�Y�E��7V�k����������zC�3=�f���6YjH�9)|�R��~C�I�af$�q2�Gg��?O�	E��hMNſ��l�Թ5��T�RZ'"��� ��Q��`$8	Y@�s7K�q�ډ�ܳ�����jt���m=@(#��dm�ݧՁ�ȥD������"�PK�f��h��*^F��9Ί�9���i.��8��\��#�8���_�]B�s��
�AT���j�u��#�>NNvI3k�P�ճ���V�\�o�0<����hG����0�J�(��B;n��I*���1"p���ԍS�$u[?k�uh��4y-�T��7����A�լt�]^nC|%�e�DN��#I=���6p�l$�-��5�h�)�VL�����@�e��n$==�7��ʝM�Q�䴧&�v�kЮ��l�qE�.<m�X���~3cA������2��͉��2f!_e�"23���M�TWA|��Zw�h��/��vW�0��l6eZVac�NkXuJ��Z��3c�؊A�����
���6f���� gF�^w��Cf{Ϭ��h��]9&6���jOkl�9b��u�;S'�����k=G����&�Ch?[��=,����s���J��4@���* �z��ߦ2�Q�z�U��'?	��������v�=��$]|��: ����ʻw�~W�m��#|���pb�k��!m(ECR<�+'ԪņG7M>ʈ|} � hVh�VY>�VV�R��TY�[V'�bV0�u�(i2���5�;2!��J�67x�I-rc����H8�do�4l�Cv��X���m�n��`��Co��.`�v�Z�LU3!z$X�m
��*���U�Jd�B� �ã5��!��o`w�������1�3���}����î����f�oQ�礓�C�2[j�`��gZ �{�{�!S��ە�5��p0�^��      �
   �  x�}��n�8E���)$��Ǣ�.�@w���O��*lɐ��دߙ�L��a^� st#2��2f�����}y�8�	�q?�SXބ�~yP��5d8�a�"c�i#3���G�d�Ex$�D�+����)�oP����]�m���]��x�����&t�aA���>���p	�Ӿ�!,����)��NX9��Ȝ�F�� KN]2��ێ����HN��2,��f�.,O�.����iڕ(lZ'�����t�yf�5�4]�УQ�8��:>,:th�:�:]!X�3�/��4Ѡ�k�!�}d
��� � �6�I߈��ɥ�@f�w�q�ӓOɨ�U��Sx,�;�^�MH/��S�<���+~�?O\�w���Ux�}��Cz�覩1D7h�+�/�n:q�P-<#��viu��1�����|����7ӟ��˟a�8�����@[�No�C�?33�ܻy��t<�o�|?�������t��Crm����Q��VUq�J���vZ#���iA�V��yy>q�V���q9���),{��E�ĭ�2)���7W���ܵ���r��-!�f��4o�Hd�3ټ�Z��c$����:ĢȮ�}^�=��إ�οʥ@E��-X�V�+#�6�2�J�!E�ݖ��+#0�}E����V@��A�� g����|��kX�Ӹp��}y>���[`hN 7�X?��1�m�	e�g+��0e�`8����iˇ��h2iֱ�*�W�b�_��:\��ie�E�?��?��1�����<�G�,���ɟ_Ǚ?�dqX��Bg��X�G�L"Ru28��3N�磸����A�pn�3�E�f�"�#��"���NV�Y ��c��lRc��'�18��(�1�IA�����~8���p�jV�X ٵ[�PLM�F�0��2,�Me��(2�T��:[�Y8�n(i�ý�H�s��o�bY�X�9��n@a;]1ek�u���*�٥=N�m����g�EG�m*�s^R�'k��������M�V`��pV�2\��t	/Ñ�]��|���ݢW�o��Zn�8�z�벥-1[_�y�x[eXz��b�`��b��Y�	����NX�����1X�6�|�w�I$�]d��� �v������p_$�{^�aAd�$(�k_!RHKv{�dv�VXٵ���*�v[��!�mMbQd���_s�u-��:Ģ�/4�D����H���f��1&S��M$X:�	�$cg��e,m��H���U)��!���A�V�`y	B��)�v^�� En�dbU+���d���R�6�§"��]=��e _af1f����;��Ȩ�s�0N��1������Z�n,�B� gŤu�"&#)K��+���3�0�/q`� ��A��(� ��r�.G���<� XÊ)�m������kǇ��k�ׯcɰi*D
1�^��|����tU��E��B�����KϐL��e�E�Q�6�Ȥb7�����,�HHj��ՠ��������_���d�Š[ئw�P�MX����L,V4a�ȫ�@��w�qa�'�}$���2)ȒS�n$���خB�2�"�_�i���)p���WO���|�T�rM��b���A��l	��	@���e�Dd�HŋϋU��eT"�e�V�X�5��L����D�Ő[xC�s�p�.�:<�+"�hV��OH�ᴹ<���ɗH�����	�-�      �
   l   x�3�,I-.I���4204�5 "C������V@�Hrq���e^�������S������ihn1��@�Ќ3 ��$Q!%Q��h�sfYf1�!�q1z\\\ y�$�      �
      x�3�4�45�2�4�45����� �~      �
      x�3�4��2�4������ ��      �
      x�3�4�41�2�BS�=... �x      �
   �   x�u�;n�0D��)x����-�8���*�B�H� ��B)���IN�3��v��g�)`^��:��7�tB���i�0��.���@�=��g�H�16��dh(�9��p��l�A�+�+�^n�Ϋ�z8�(:��z��|i�/�k��͐2��ҩRn=�T��ى�Z�rW���������ȑJ�xV�Wګ��C�aǁR�����1��0wn      �
   �   x�u�A��0E��)|��;�e�}W��n<�CI;=��E��U�S�
�%�I�O�o���BV�H,Pp�rɕFemJ+�dר�Q�5�ޣ�ck��͸��B�r�r�o8���a^���yiL��zS��-4�Lc�2(Jf�.��b�❝VH�P���ʦ�#�~,v���E�Ȕ���<��2��Ӯ��'�Q�o���[���_���O�<���%����c�      �
   r  x��Yˎ�6]�_1��F���k�>�)�6Z�mN$ѡFN3��O��ҎdM"�0f&���>�=�1%߻�\��6b����P��[C=ې>d�7ۆպ���(B��_Tjd�?e�/�H�QE�����6V]L>$W�� s·H��
K�^���KP9]E�K�|3��Ī��K������ML�#R�S�o��aU�|�!���bcQﾸ��Ȁp�Ld��`��6 ~�ko�n���C��0W�,�}t���J�Ia7�������,��"%S�qN�D�r�yx����_?q���XY�]���z߶�����r?��7X����C�$�_��.��Ң����ǟ�����<|Z����T�3���i�"ȍ�q �!�CQgry�7KxH	E5TD����2t�8=Yf�`�Q�������p[���˂~SQ+�:�j��˥O7��\Rd���9w��؆�U�=���I9�m}�Z�8>���(SX�)f���)M�8�Q{�3F˵�5F���ܜ�3D(�?��@�J�z*�עr`bqO�U��%�\�Z��OC쫃/�8�^�<��=Wm|�R�"9`j?�2�]�d�X��D/��bur,��\T�^j��J�]r�!��$�"fK
��2���0�����ʺ���A��rԎ��u���1�&%�I�5gX2�qi�G�=)a�;��* �Y�u�h@���DQ��6M.k ����U��O��\W;ɱV_����d�k�Cb��g7�C��
B�y0;E$��K��A�C�����������A��xHy-J0����K��;߃�=l����p�O.�S�^�{��@�$��c�k�v=b
��q�ML�����-@Iv��-�6M�����\6Y0$�9�1�.���{S�Ԑ����XSt��\�AV�Ylzٟ���C|-J_��̩��2��Gp.y��-�z]Slڅxt=���O�k�]g��*tH�m�z�
{[�u|�-Au�k5��Xf���ft&g�M�T}������O�F�����>��޹��?��KV_�\A�����sCxؼ"D��"gWfW���o�ȥn�Ԝ �� ���ڣ�7f��rN��]��z눬�n!�0Pm�j�]h�P$�ʬ_�aC�_Z��{����}2-����(O�+Ŀ�V���m����C�Ը��rh��Z�сс���o���rzqŬl%9�M|n�]Y�������(�=sH�ux�)!��~�\Ƿ�OQ<�Z��j�l��h�����^M�/�����=�	�a�}��/о%�פ���H�J��@'�v���>���sNH�6�i�u~<�.oƁT~}sz�_�Jk��+br��y~�%�b]6*̴͜|��%�k4�	�ά�"� ߀m��W/1n�f]=�x�vch�>uy]=Upź��� ��s%n��\���.SU�[CC1��a�Iw�r#[.�������]���o��#x�:�C�u)�1L��HB|&��Z��<޳t��� _��>e�.�iѻ���� `�+w�M���,Xoy�;-\T�q������� �f���0�K;`%f�͘o�"�Bm�g�������2�Xp�^o������B8Q�H*��$�ry~�������^e�0����      �
      x�3�tL���LL��4��"�=... P��     