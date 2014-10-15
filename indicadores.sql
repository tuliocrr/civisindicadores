PGDMP     ;                	    r            civisdaniel    9.2.4    9.2.4 *   Y
           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            Z
           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            [
           1262    95876    civisdaniel    DATABASE     i   CREATE DATABASE civisdaniel WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C' LC_CTYPE = 'C';
    DROP DATABASE civisdaniel;
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            \
           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    6            ]
           0    0    public    ACL     �   REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;
                  postgres    false    6                       3079    11995    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            ^
           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    258            �            1259    95877    acao    TABLE       CREATE TABLE acao (
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
       public         postgres    false    6            �            1259    95885    acao_id_seq    SEQUENCE     m   CREATE SEQUENCE acao_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.acao_id_seq;
       public       postgres    false    6    168            _
           0    0    acao_id_seq    SEQUENCE OWNED BY     -   ALTER SEQUENCE acao_id_seq OWNED BY acao.id;
            public       postgres    false    169            �            1259    95887    acao_plano_acao    TABLE     j   CREATE TABLE acao_plano_acao (
    id integer NOT NULL,
    plano_acao_id integer,
    acao_id integer
);
 #   DROP TABLE public.acao_plano_acao;
       public         postgres    false    6            �            1259    95890    acao_plano_acao_id_seq    SEQUENCE     x   CREATE SEQUENCE acao_plano_acao_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.acao_plano_acao_id_seq;
       public       postgres    false    170    6            `
           0    0    acao_plano_acao_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE acao_plano_acao_id_seq OWNED BY acao_plano_acao.id;
            public       postgres    false    171            �            1259    95902    anomalia    TABLE     !  CREATE TABLE anomalia (
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
       public         postgres    false    6            �            1259    95909    anomalia_id_seq    SEQUENCE     q   CREATE SEQUENCE anomalia_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.anomalia_id_seq;
       public       postgres    false    172    6            a
           0    0    anomalia_id_seq    SEQUENCE OWNED BY     5   ALTER SEQUENCE anomalia_id_seq OWNED BY anomalia.id;
            public       postgres    false    173            �            1259    95930 	   auditoria    TABLE     �   CREATE TABLE auditoria (
    id integer NOT NULL,
    alias_controller character varying(255),
    alias_acao character varying(255),
    usuario_id integer,
    created timestamp without time zone,
    elemento_id character varying
);
    DROP TABLE public.auditoria;
       public         postgres    false    6            �            1259    95936    auditoria_campos    TABLE     �   CREATE TABLE auditoria_campos (
    id integer NOT NULL,
    alias_model character varying(255),
    valor_antigo text,
    valor_novo text,
    auditoria_id integer,
    tipo_campo integer
);
 $   DROP TABLE public.auditoria_campos;
       public         postgres    false    6            �            1259    95942    auditoria_campos_id_seq    SEQUENCE     y   CREATE SEQUENCE auditoria_campos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.auditoria_campos_id_seq;
       public       postgres    false    175    6            b
           0    0    auditoria_campos_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE auditoria_campos_id_seq OWNED BY auditoria_campos.id;
            public       postgres    false    176            �            1259    95944    auditoria_id_seq    SEQUENCE     r   CREATE SEQUENCE auditoria_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.auditoria_id_seq;
       public       postgres    false    6    174            c
           0    0    auditoria_id_seq    SEQUENCE OWNED BY     7   ALTER SEQUENCE auditoria_id_seq OWNED BY auditoria.id;
            public       postgres    false    177            �            1259    95946    cargo    TABLE     �   CREATE TABLE cargo (
    id integer NOT NULL,
    titulo character varying(255),
    descricao text,
    status integer DEFAULT 1
);
    DROP TABLE public.cargo;
       public         postgres    false    6            �            1259    95953    cargo_id_seq    SEQUENCE     n   CREATE SEQUENCE cargo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.cargo_id_seq;
       public       postgres    false    178    6            d
           0    0    cargo_id_seq    SEQUENCE OWNED BY     /   ALTER SEQUENCE cargo_id_seq OWNED BY cargo.id;
            public       postgres    false    179            �            1259    95955 	   categoria    TABLE     R   CREATE TABLE categoria (
    id integer NOT NULL,
    titulo character varying
);
    DROP TABLE public.categoria;
       public         postgres    false    6            �            1259    95961    categoria_id_seq    SEQUENCE     r   CREATE SEQUENCE categoria_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.categoria_id_seq;
       public       postgres    false    180    6            e
           0    0    categoria_id_seq    SEQUENCE OWNED BY     7   ALTER SEQUENCE categoria_id_seq OWNED BY categoria.id;
            public       postgres    false    181            �            1259    95963 
   comentario    TABLE     �   CREATE TABLE comentario (
    id integer NOT NULL,
    mensagem text,
    arquivo character varying(255),
    usuario_id integer,
    acao_id integer
);
    DROP TABLE public.comentario;
       public         postgres    false    6            �            1259    95969    comentario_id_seq    SEQUENCE     s   CREATE SEQUENCE comentario_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.comentario_id_seq;
       public       postgres    false    6    182            f
           0    0    comentario_id_seq    SEQUENCE OWNED BY     9   ALTER SEQUENCE comentario_id_seq OWNED BY comentario.id;
            public       postgres    false    183            �            1259    95971    comunicacao    TABLE     �   CREATE TABLE comunicacao (
    id integer NOT NULL,
    titulo character varying(255),
    status integer DEFAULT 1,
    tipo character varying(45)
);
    DROP TABLE public.comunicacao;
       public         postgres    false    6            �            1259    95975    comunicacao_id_seq    SEQUENCE     t   CREATE SEQUENCE comunicacao_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.comunicacao_id_seq;
       public       postgres    false    184    6            g
           0    0    comunicacao_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE comunicacao_id_seq OWNED BY comunicacao.id;
            public       postgres    false    185            �            1259    95977    departamento    TABLE     x   CREATE TABLE departamento (
    id integer NOT NULL,
    titulo character varying(255),
    status integer DEFAULT 1
);
     DROP TABLE public.departamento;
       public         postgres    false    6            �            1259    95981    departamento_id_seq    SEQUENCE     u   CREATE SEQUENCE departamento_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.departamento_id_seq;
       public       postgres    false    6    186            h
           0    0    departamento_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE departamento_id_seq OWNED BY departamento.id;
            public       postgres    false    187            �            1259    95983    dimensao    TABLE     �   CREATE TABLE dimensao (
    id integer NOT NULL,
    titulo character varying(255),
    observacao text,
    ordem integer,
    status integer DEFAULT 1,
    empresa_id integer
);
    DROP TABLE public.dimensao;
       public         postgres    false    6            �            1259    95990    dimensao_id_seq    SEQUENCE     q   CREATE SEQUENCE dimensao_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.dimensao_id_seq;
       public       postgres    false    6    188            i
           0    0    dimensao_id_seq    SEQUENCE OWNED BY     5   ALTER SEQUENCE dimensao_id_seq OWNED BY dimensao.id;
            public       postgres    false    189            �            1259    95992    empresa    TABLE       CREATE TABLE empresa (
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
       public         postgres    false    6            �            1259    95999    empresa_id_seq    SEQUENCE     p   CREATE SEQUENCE empresa_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.empresa_id_seq;
       public       postgres    false    6    190            j
           0    0    empresa_id_seq    SEQUENCE OWNED BY     3   ALTER SEQUENCE empresa_id_seq OWNED BY empresa.id;
            public       postgres    false    191            �            1259    96001    endereco    TABLE       CREATE TABLE endereco (
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
       public         postgres    false    6            �            1259    96008    endereco_id_seq    SEQUENCE     q   CREATE SEQUENCE endereco_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.endereco_id_seq;
       public       postgres    false    192    6            k
           0    0    endereco_id_seq    SEQUENCE OWNED BY     5   ALTER SEQUENCE endereco_id_seq OWNED BY endereco.id;
            public       postgres    false    193            �            1259    96010    esqueci_senha    TABLE     �   CREATE TABLE esqueci_senha (
    id integer NOT NULL,
    usuario_id integer,
    hash character varying(255),
    ativo boolean,
    data timestamp without time zone
);
 !   DROP TABLE public.esqueci_senha;
       public         postgres    false    6            �            1259    96013    esqueci_senha_id_seq    SEQUENCE     v   CREATE SEQUENCE esqueci_senha_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.esqueci_senha_id_seq;
       public       postgres    false    6    194            l
           0    0    esqueci_senha_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE esqueci_senha_id_seq OWNED BY esqueci_senha.id;
            public       postgres    false    195            �            1259    96015    faixa    TABLE     �   CREATE TABLE faixa (
    id integer NOT NULL,
    titulo character varying(255) NOT NULL,
    limite_vermelho double precision,
    limite_amarelo double precision,
    status integer DEFAULT 1 NOT NULL
);
    DROP TABLE public.faixa;
       public         postgres    false    6            �            1259    96019    faixa_id_seq    SEQUENCE     n   CREATE SEQUENCE faixa_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.faixa_id_seq;
       public       postgres    false    196    6            m
           0    0    faixa_id_seq    SEQUENCE OWNED BY     /   ALTER SEQUENCE faixa_id_seq OWNED BY faixa.id;
            public       postgres    false    197            �            1259    96021    grupo    TABLE     q   CREATE TABLE grupo (
    id integer NOT NULL,
    titulo character varying(255),
    status integer DEFAULT 1
);
    DROP TABLE public.grupo;
       public         postgres    false    6            �            1259    96025    grupo_id_seq    SEQUENCE     n   CREATE SEQUENCE grupo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.grupo_id_seq;
       public       postgres    false    6    198            n
           0    0    grupo_id_seq    SEQUENCE OWNED BY     /   ALTER SEQUENCE grupo_id_seq OWNED BY grupo.id;
            public       postgres    false    199            �            1259    96027 	   indicador    TABLE     1  CREATE TABLE indicador (
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
       public         postgres    false    6            �            1259    96038    indicador_autorizado_visualizar    TABLE     |   CREATE TABLE indicador_autorizado_visualizar (
    id integer NOT NULL,
    usuario_id integer,
    indicador_id integer
);
 3   DROP TABLE public.indicador_autorizado_visualizar;
       public         postgres    false    6            �            1259    96041 &   indicador_autorizado_visualizar_id_seq    SEQUENCE     �   CREATE SEQUENCE indicador_autorizado_visualizar_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 =   DROP SEQUENCE public.indicador_autorizado_visualizar_id_seq;
       public       postgres    false    201    6            o
           0    0 &   indicador_autorizado_visualizar_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE indicador_autorizado_visualizar_id_seq OWNED BY indicador_autorizado_visualizar.id;
            public       postgres    false    202            �            1259    96043    indicador_id_seq    SEQUENCE     r   CREATE SEQUENCE indicador_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.indicador_id_seq;
       public       postgres    false    200    6            p
           0    0    indicador_id_seq    SEQUENCE OWNED BY     7   ALTER SEQUENCE indicador_id_seq OWNED BY indicador.id;
            public       postgres    false    203            �            1259    96045    indicador_meta    TABLE     �  CREATE TABLE indicador_meta (
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
       public         postgres    false    6            �            1259    96051    indicador_meta_id_seq    SEQUENCE     w   CREATE SEQUENCE indicador_meta_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.indicador_meta_id_seq;
       public       postgres    false    204    6            q
           0    0    indicador_meta_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE indicador_meta_id_seq OWNED BY indicador_meta.id;
            public       postgres    false    205            �            1259    96053    indicador_realizado    TABLE     �  CREATE TABLE indicador_realizado (
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
       public         postgres    false    6            �            1259    96059    indicador_realizado_id_seq    SEQUENCE     |   CREATE SEQUENCE indicador_realizado_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.indicador_realizado_id_seq;
       public       postgres    false    6    206            r
           0    0    indicador_realizado_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE indicador_realizado_id_seq OWNED BY indicador_realizado.id;
            public       postgres    false    207            �            1259    96061    indicador_responsavel_meta    TABLE     w   CREATE TABLE indicador_responsavel_meta (
    id integer NOT NULL,
    usuario_id integer,
    indicador_id integer
);
 .   DROP TABLE public.indicador_responsavel_meta;
       public         postgres    false    6            s
           0    0 .   COLUMN indicador_responsavel_meta.indicador_id    COMMENT     C   COMMENT ON COLUMN indicador_responsavel_meta.indicador_id IS '
';
            public       postgres    false    208            �            1259    96064 !   indicador_responsavel_meta_id_seq    SEQUENCE     �   CREATE SEQUENCE indicador_responsavel_meta_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.indicador_responsavel_meta_id_seq;
       public       postgres    false    6    208            t
           0    0 !   indicador_responsavel_meta_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE indicador_responsavel_meta_id_seq OWNED BY indicador_responsavel_meta.id;
            public       postgres    false    209            �            1259    96066    indicador_responsavel_realizado    TABLE     |   CREATE TABLE indicador_responsavel_realizado (
    id integer NOT NULL,
    usuario_id integer,
    indicador_id integer
);
 3   DROP TABLE public.indicador_responsavel_realizado;
       public         postgres    false    6            �            1259    96069 &   indicador_responsavel_realizado_id_seq    SEQUENCE     �   CREATE SEQUENCE indicador_responsavel_realizado_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 =   DROP SEQUENCE public.indicador_responsavel_realizado_id_seq;
       public       postgres    false    6    210            u
           0    0 &   indicador_responsavel_realizado_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE indicador_responsavel_realizado_id_seq OWNED BY indicador_responsavel_realizado.id;
            public       postgres    false    211            �            1259    96071    marcador    TABLE     �   CREATE TABLE marcador (
    id integer NOT NULL,
    titulo character varying(255),
    status integer DEFAULT 1,
    descricao text
);
    DROP TABLE public.marcador;
       public         postgres    false    6            �            1259    96078    marcador_id_seq    SEQUENCE     q   CREATE SEQUENCE marcador_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.marcador_id_seq;
       public       postgres    false    212    6            v
           0    0    marcador_id_seq    SEQUENCE OWNED BY     5   ALTER SEQUENCE marcador_id_seq OWNED BY marcador.id;
            public       postgres    false    213            �            1259    96080    marcador_objetivo    TABLE     n   CREATE TABLE marcador_objetivo (
    id integer NOT NULL,
    marcador_id integer,
    objetivo_id integer
);
 %   DROP TABLE public.marcador_objetivo;
       public         postgres    false    6            �            1259    96083    marcador_objetivo_id_seq    SEQUENCE     z   CREATE SEQUENCE marcador_objetivo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.marcador_objetivo_id_seq;
       public       postgres    false    214    6            w
           0    0    marcador_objetivo_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE marcador_objetivo_id_seq OWNED BY marcador_objetivo.id;
            public       postgres    false    215            �            1259    96085    objetivo    TABLE     �  CREATE TABLE objetivo (
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
       public         postgres    false    6            x
           0    0    COLUMN objetivo.pdti_prazo    COMMENT     L   COMMENT ON COLUMN objetivo.pdti_prazo IS 'Prazo do PDTI (Formato MM/AAAA)';
            public       postgres    false    216            y
           0    0    COLUMN objetivo.usuario_id    COMMENT     9   COMMENT ON COLUMN objetivo.usuario_id IS 'Responsável';
            public       postgres    false    216            �            1259    96093    objetivo_id_seq    SEQUENCE     q   CREATE SEQUENCE objetivo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.objetivo_id_seq;
       public       postgres    false    216    6            z
           0    0    objetivo_id_seq    SEQUENCE OWNED BY     5   ALTER SEQUENCE objetivo_id_seq OWNED BY objetivo.id;
            public       postgres    false    217            �            1259    96095    objetivo_projeto    TABLE     l   CREATE TABLE objetivo_projeto (
    id integer NOT NULL,
    projeto_id integer,
    objetivo_id integer
);
 $   DROP TABLE public.objetivo_projeto;
       public         postgres    false    6            �            1259    96098    objetivo_projeto_id_seq    SEQUENCE     y   CREATE SEQUENCE objetivo_projeto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.objetivo_projeto_id_seq;
       public       postgres    false    218    6            {
           0    0    objetivo_projeto_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE objetivo_projeto_id_seq OWNED BY objetivo_projeto.id;
            public       postgres    false    219            �            1259    96100    patrocinador_projeto    TABLE     n   CREATE TABLE patrocinador_projeto (
    id integer NOT NULL,
    projeto_id integer,
    pessoa_id integer
);
 (   DROP TABLE public.patrocinador_projeto;
       public         postgres    false    6            �            1259    96103    patrocinador_projeto_id_seq    SEQUENCE     }   CREATE SEQUENCE patrocinador_projeto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.patrocinador_projeto_id_seq;
       public       postgres    false    220    6            |
           0    0    patrocinador_projeto_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE patrocinador_projeto_id_seq OWNED BY patrocinador_projeto.id;
            public       postgres    false    221            �            1259    97471 
   permissoes    TABLE     q   CREATE TABLE permissoes (
    id integer NOT NULL,
    grupo_id integer,
    descricao character varying(255)
);
    DROP TABLE public.permissoes;
       public         postgres    false    6            �            1259    97469    permissoes_id_seq    SEQUENCE     s   CREATE SEQUENCE permissoes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.permissoes_id_seq;
       public       postgres    false    255    6            }
           0    0    permissoes_id_seq    SEQUENCE OWNED BY     9   ALTER SEQUENCE permissoes_id_seq OWNED BY permissoes.id;
            public       postgres    false    254            �            1259    96105    pessoa    TABLE     �   CREATE TABLE pessoa (
    id integer NOT NULL,
    titulo character varying(255),
    tipo character(2),
    observacao text,
    email character varying(255)
);
    DROP TABLE public.pessoa;
       public         postgres    false    6            �            1259    96111    pessoa_comunicacao    TABLE     p   CREATE TABLE pessoa_comunicacao (
    id integer NOT NULL,
    pessoa_id integer,
    comunicacao_id integer
);
 &   DROP TABLE public.pessoa_comunicacao;
       public         postgres    false    6            �            1259    96114    pessoa_comunicacao_id_seq    SEQUENCE     {   CREATE SEQUENCE pessoa_comunicacao_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.pessoa_comunicacao_id_seq;
       public       postgres    false    6    223            ~
           0    0    pessoa_comunicacao_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE pessoa_comunicacao_id_seq OWNED BY pessoa_comunicacao.id;
            public       postgres    false    224            �            1259    96116    pessoa_id_seq    SEQUENCE     o   CREATE SEQUENCE pessoa_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.pessoa_id_seq;
       public       postgres    false    6    222            
           0    0    pessoa_id_seq    SEQUENCE OWNED BY     1   ALTER SEQUENCE pessoa_id_seq OWNED BY pessoa.id;
            public       postgres    false    225            �            1259    96118 
   plano_acao    TABLE     �   CREATE TABLE plano_acao (
    id integer NOT NULL,
    objetivo_id integer,
    titulo character varying(255),
    status integer DEFAULT 1
);
    DROP TABLE public.plano_acao;
       public         postgres    false    6            �            1259    96122    plano_acao_id_seq    SEQUENCE     s   CREATE SEQUENCE plano_acao_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.plano_acao_id_seq;
       public       postgres    false    6    226            �
           0    0    plano_acao_id_seq    SEQUENCE OWNED BY     9   ALTER SEQUENCE plano_acao_id_seq OWNED BY plano_acao.id;
            public       postgres    false    227            �            1259    96124    plano_acao_projeto    TABLE     p   CREATE TABLE plano_acao_projeto (
    id integer NOT NULL,
    projeto_id integer,
    plano_acao_id integer
);
 &   DROP TABLE public.plano_acao_projeto;
       public         postgres    false    6            �            1259    96127    plano_acao_projeto_id_seq    SEQUENCE     {   CREATE SEQUENCE plano_acao_projeto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.plano_acao_projeto_id_seq;
       public       postgres    false    6    228            �
           0    0    plano_acao_projeto_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE plano_acao_projeto_id_seq OWNED BY plano_acao_projeto.id;
            public       postgres    false    229            �            1259    96129    post    TABLE     n  CREATE TABLE post (
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
       public         postgres    false    6            �            1259    96137    post_id_seq    SEQUENCE     m   CREATE SEQUENCE post_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.post_id_seq;
       public       postgres    false    6    230            �
           0    0    post_id_seq    SEQUENCE OWNED BY     -   ALTER SEQUENCE post_id_seq OWNED BY post.id;
            public       postgres    false    231            �            1259    96139    procedimento    TABLE     7  CREATE TABLE procedimento (
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
       public         postgres    false    6            �            1259    96146    procedimento_id_seq    SEQUENCE     u   CREATE SEQUENCE procedimento_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.procedimento_id_seq;
       public       postgres    false    6    232            �
           0    0    procedimento_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE procedimento_id_seq OWNED BY procedimento.id;
            public       postgres    false    233            �            1259    96148    programa    TABLE     �   CREATE TABLE programa (
    id integer NOT NULL,
    titulo character varying(255),
    data_inicio date,
    data_fim date,
    status integer DEFAULT 1,
    descricao text
);
    DROP TABLE public.programa;
       public         postgres    false    6            �            1259    96155    programa_id_seq    SEQUENCE     q   CREATE SEQUENCE programa_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.programa_id_seq;
       public       postgres    false    6    234            �
           0    0    programa_id_seq    SEQUENCE OWNED BY     5   ALTER SEQUENCE programa_id_seq OWNED BY programa.id;
            public       postgres    false    235            �            1259    96157    projeto    TABLE       CREATE TABLE projeto (
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
       public         postgres    false    6            �
           0    0    COLUMN projeto.tamanho    COMMENT     Z   COMMENT ON COLUMN projeto.tamanho IS 'Pequeno, Médio ou Grande (relacionado ao escopo)';
            public       postgres    false    236            �
           0    0 #   COLUMN projeto.perspectiva_temporal    COMMENT     �   COMMENT ON COLUMN projeto.perspectiva_temporal IS 'Curto Prazo (até 3 meses), Médio Prazo (até 1 ano), Longo Prazo (mais que 1 ano)';
            public       postgres    false    236            �
           0    0    COLUMN projeto.complexidade    COMMENT     C   COMMENT ON COLUMN projeto.complexidade IS 'Baixa, Média ou Alta';
            public       postgres    false    236            �
           0    0 #   COLUMN projeto.importancia_politica    COMMENT     K   COMMENT ON COLUMN projeto.importancia_politica IS 'Baixa, Média ou Alta';
            public       postgres    false    236            �
           0    0    COLUMN projeto.saude_projeto    COMMENT     Z   COMMENT ON COLUMN projeto.saude_projeto IS '0 - Adequada, 1 - Atenção, 2 - Inadequada';
            public       postgres    false    236            �
           0    0    COLUMN projeto.situacao    COMMENT     v   COMMENT ON COLUMN projeto.situacao IS '0 - A Iniciar, 1 - Em Andamento, 2 - Bloqueado, 3 - Suspenso, 4 - Concluído';
            public       postgres    false    236            �
           0    0    COLUMN projeto.url_projeto    COMMENT     b   COMMENT ON COLUMN projeto.url_projeto IS 'Url do Projeto (redmine, citsmart ou outros sistemas)';
            public       postgres    false    236            �
           0    0    COLUMN projeto.parceiros    COMMENT     c   COMMENT ON COLUMN projeto.parceiros IS 'Parceiros (empresas contratadas, conveniados, parcerias)';
            public       postgres    false    236            �
           0    0    COLUMN projeto.patrocinador    COMMENT     I   COMMENT ON COLUMN projeto.patrocinador IS 'Patrocinador (Nome e Área)';
            public       postgres    false    236            �
           0    0    COLUMN projeto.area_executora    COMMENT     J   COMMENT ON COLUMN projeto.area_executora IS 'Área Executora do Projeto';
            public       postgres    false    236            �
           0    0    COLUMN projeto.area_cliente    COMMENT     F   COMMENT ON COLUMN projeto.area_cliente IS 'Área Cliente do Projeto';
            public       postgres    false    236            �
           0    0 &   COLUMN projeto.data_ultima_atualizacao    COMMENT     V   COMMENT ON COLUMN projeto.data_ultima_atualizacao IS 'Data da Última Atualização';
            public       postgres    false    236            �            1259    96167    projeto_id_seq    SEQUENCE     p   CREATE SEQUENCE projeto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.projeto_id_seq;
       public       postgres    false    236    6            �
           0    0    projeto_id_seq    SEQUENCE OWNED BY     3   ALTER SEQUENCE projeto_id_seq OWNED BY projeto.id;
            public       postgres    false    237                       1259    97490    regras    TABLE     q   CREATE TABLE regras (
    id integer NOT NULL,
    permissao_id integer,
    descricao character varying(255)
);
    DROP TABLE public.regras;
       public         postgres    false    6                        1259    97488    regras_id_seq    SEQUENCE     o   CREATE SEQUENCE regras_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.regras_id_seq;
       public       postgres    false    257    6            �
           0    0    regras_id_seq    SEQUENCE OWNED BY     1   ALTER SEQUENCE regras_id_seq OWNED BY regras.id;
            public       postgres    false    256            �            1259    96169    reuniao    TABLE     X  CREATE TABLE reuniao (
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
       public         postgres    false    6            �            1259    96176    reuniao_conhecedor    TABLE     m   CREATE TABLE reuniao_conhecedor (
    id integer NOT NULL,
    reuniao_id integer,
    usuario_id integer
);
 &   DROP TABLE public.reuniao_conhecedor;
       public         postgres    false    6            �            1259    96179    reuniao_conhecedor_id_seq    SEQUENCE     {   CREATE SEQUENCE reuniao_conhecedor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.reuniao_conhecedor_id_seq;
       public       postgres    false    6    239            �
           0    0    reuniao_conhecedor_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE reuniao_conhecedor_id_seq OWNED BY reuniao_conhecedor.id;
            public       postgres    false    240            �            1259    96181    reuniao_email_externo    TABLE     z   CREATE TABLE reuniao_email_externo (
    id integer NOT NULL,
    reuniao_id integer,
    email character varying(255)
);
 )   DROP TABLE public.reuniao_email_externo;
       public         postgres    false    6            �            1259    96184    reuniao_email_externo_id_seq    SEQUENCE     ~   CREATE SEQUENCE reuniao_email_externo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.reuniao_email_externo_id_seq;
       public       postgres    false    6    241            �
           0    0    reuniao_email_externo_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE reuniao_email_externo_id_seq OWNED BY reuniao_email_externo.id;
            public       postgres    false    242            �            1259    96186    reuniao_id_seq    SEQUENCE     p   CREATE SEQUENCE reuniao_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.reuniao_id_seq;
       public       postgres    false    6    238            �
           0    0    reuniao_id_seq    SEQUENCE OWNED BY     3   ALTER SEQUENCE reuniao_id_seq OWNED BY reuniao.id;
            public       postgres    false    243            �            1259    96188    reuniao_participante    TABLE     o   CREATE TABLE reuniao_participante (
    id integer NOT NULL,
    reuniao_id integer,
    usuario_id integer
);
 (   DROP TABLE public.reuniao_participante;
       public         postgres    false    6            �            1259    96191    reuniao_participante_id_seq    SEQUENCE     }   CREATE SEQUENCE reuniao_participante_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.reuniao_participante_id_seq;
       public       postgres    false    244    6            �
           0    0    reuniao_participante_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE reuniao_participante_id_seq OWNED BY reuniao_participante.id;
            public       postgres    false    245            �            1259    96193    setor    TABLE     �   CREATE TABLE setor (
    id integer NOT NULL,
    titulo character varying(255),
    status integer DEFAULT 1,
    tipo integer
);
    DROP TABLE public.setor;
       public         postgres    false    6            �            1259    96197    setor_id_seq    SEQUENCE     n   CREATE SEQUENCE setor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.setor_id_seq;
       public       postgres    false    246    6            �
           0    0    setor_id_seq    SEQUENCE OWNED BY     /   ALTER SEQUENCE setor_id_seq OWNED BY setor.id;
            public       postgres    false    247            �            1259    96199    tarefa    TABLE     �  CREATE TABLE tarefa (
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
       public         postgres    false    6            �            1259    96207    terefa_id_seq    SEQUENCE     o   CREATE SEQUENCE terefa_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.terefa_id_seq;
       public       postgres    false    6    248            �
           0    0    terefa_id_seq    SEQUENCE OWNED BY     1   ALTER SEQUENCE terefa_id_seq OWNED BY tarefa.id;
            public       postgres    false    249            �            1259    96209    usuario    TABLE     S  CREATE TABLE usuario (
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
       public         postgres    false    6            �            1259    96217    usuario_id_seq    SEQUENCE     p   CREATE SEQUENCE usuario_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.usuario_id_seq;
       public       postgres    false    250    6            �
           0    0    usuario_id_seq    SEQUENCE OWNED BY     3   ALTER SEQUENCE usuario_id_seq OWNED BY usuario.id;
            public       postgres    false    251            �            1259    96219    vinculo    TABLE     �   CREATE TABLE vinculo (
    id integer NOT NULL,
    titulo character varying(255),
    status integer DEFAULT 1,
    created timestamp without time zone,
    modified timestamp without time zone
);
    DROP TABLE public.vinculo;
       public         postgres    false    6            �            1259    96223    vinculo_id_seq    SEQUENCE     p   CREATE SEQUENCE vinculo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.vinculo_id_seq;
       public       postgres    false    6    252            �
           0    0    vinculo_id_seq    SEQUENCE OWNED BY     3   ALTER SEQUENCE vinculo_id_seq OWNED BY vinculo.id;
            public       postgres    false    253            �	           2604    96225    id    DEFAULT     T   ALTER TABLE ONLY acao ALTER COLUMN id SET DEFAULT nextval('acao_id_seq'::regclass);
 6   ALTER TABLE public.acao ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    169    168            �	           2604    96226    id    DEFAULT     j   ALTER TABLE ONLY acao_plano_acao ALTER COLUMN id SET DEFAULT nextval('acao_plano_acao_id_seq'::regclass);
 A   ALTER TABLE public.acao_plano_acao ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    171    170            �	           2604    96228    id    DEFAULT     \   ALTER TABLE ONLY anomalia ALTER COLUMN id SET DEFAULT nextval('anomalia_id_seq'::regclass);
 :   ALTER TABLE public.anomalia ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    173    172            �	           2604    96231    id    DEFAULT     ^   ALTER TABLE ONLY auditoria ALTER COLUMN id SET DEFAULT nextval('auditoria_id_seq'::regclass);
 ;   ALTER TABLE public.auditoria ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    177    174            �	           2604    96232    id    DEFAULT     l   ALTER TABLE ONLY auditoria_campos ALTER COLUMN id SET DEFAULT nextval('auditoria_campos_id_seq'::regclass);
 B   ALTER TABLE public.auditoria_campos ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    176    175            �	           2604    96233    id    DEFAULT     V   ALTER TABLE ONLY cargo ALTER COLUMN id SET DEFAULT nextval('cargo_id_seq'::regclass);
 7   ALTER TABLE public.cargo ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    179    178            �	           2604    96234    id    DEFAULT     ^   ALTER TABLE ONLY categoria ALTER COLUMN id SET DEFAULT nextval('categoria_id_seq'::regclass);
 ;   ALTER TABLE public.categoria ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    181    180            �	           2604    96235    id    DEFAULT     `   ALTER TABLE ONLY comentario ALTER COLUMN id SET DEFAULT nextval('comentario_id_seq'::regclass);
 <   ALTER TABLE public.comentario ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    183    182            �	           2604    96236    id    DEFAULT     b   ALTER TABLE ONLY comunicacao ALTER COLUMN id SET DEFAULT nextval('comunicacao_id_seq'::regclass);
 =   ALTER TABLE public.comunicacao ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    185    184            �	           2604    96237    id    DEFAULT     d   ALTER TABLE ONLY departamento ALTER COLUMN id SET DEFAULT nextval('departamento_id_seq'::regclass);
 >   ALTER TABLE public.departamento ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    187    186            �	           2604    96238    id    DEFAULT     \   ALTER TABLE ONLY dimensao ALTER COLUMN id SET DEFAULT nextval('dimensao_id_seq'::regclass);
 :   ALTER TABLE public.dimensao ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    189    188            �	           2604    96239    id    DEFAULT     Z   ALTER TABLE ONLY empresa ALTER COLUMN id SET DEFAULT nextval('empresa_id_seq'::regclass);
 9   ALTER TABLE public.empresa ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    191    190            �	           2604    96240    id    DEFAULT     \   ALTER TABLE ONLY endereco ALTER COLUMN id SET DEFAULT nextval('endereco_id_seq'::regclass);
 :   ALTER TABLE public.endereco ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    193    192            �	           2604    96241    id    DEFAULT     f   ALTER TABLE ONLY esqueci_senha ALTER COLUMN id SET DEFAULT nextval('esqueci_senha_id_seq'::regclass);
 ?   ALTER TABLE public.esqueci_senha ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    195    194            �	           2604    96242    id    DEFAULT     V   ALTER TABLE ONLY faixa ALTER COLUMN id SET DEFAULT nextval('faixa_id_seq'::regclass);
 7   ALTER TABLE public.faixa ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    197    196            �	           2604    96243    id    DEFAULT     V   ALTER TABLE ONLY grupo ALTER COLUMN id SET DEFAULT nextval('grupo_id_seq'::regclass);
 7   ALTER TABLE public.grupo ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    199    198            �	           2604    96244    id    DEFAULT     ^   ALTER TABLE ONLY indicador ALTER COLUMN id SET DEFAULT nextval('indicador_id_seq'::regclass);
 ;   ALTER TABLE public.indicador ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    203    200            �	           2604    96245    id    DEFAULT     �   ALTER TABLE ONLY indicador_autorizado_visualizar ALTER COLUMN id SET DEFAULT nextval('indicador_autorizado_visualizar_id_seq'::regclass);
 Q   ALTER TABLE public.indicador_autorizado_visualizar ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    202    201            �	           2604    96246    id    DEFAULT     h   ALTER TABLE ONLY indicador_meta ALTER COLUMN id SET DEFAULT nextval('indicador_meta_id_seq'::regclass);
 @   ALTER TABLE public.indicador_meta ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    205    204            �	           2604    96247    id    DEFAULT     r   ALTER TABLE ONLY indicador_realizado ALTER COLUMN id SET DEFAULT nextval('indicador_realizado_id_seq'::regclass);
 E   ALTER TABLE public.indicador_realizado ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    207    206            �	           2604    96248    id    DEFAULT     �   ALTER TABLE ONLY indicador_responsavel_meta ALTER COLUMN id SET DEFAULT nextval('indicador_responsavel_meta_id_seq'::regclass);
 L   ALTER TABLE public.indicador_responsavel_meta ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    209    208            �	           2604    96249    id    DEFAULT     �   ALTER TABLE ONLY indicador_responsavel_realizado ALTER COLUMN id SET DEFAULT nextval('indicador_responsavel_realizado_id_seq'::regclass);
 Q   ALTER TABLE public.indicador_responsavel_realizado ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    211    210            �	           2604    96250    id    DEFAULT     \   ALTER TABLE ONLY marcador ALTER COLUMN id SET DEFAULT nextval('marcador_id_seq'::regclass);
 :   ALTER TABLE public.marcador ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    213    212            �	           2604    96251    id    DEFAULT     n   ALTER TABLE ONLY marcador_objetivo ALTER COLUMN id SET DEFAULT nextval('marcador_objetivo_id_seq'::regclass);
 C   ALTER TABLE public.marcador_objetivo ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    215    214            �	           2604    96252    id    DEFAULT     \   ALTER TABLE ONLY objetivo ALTER COLUMN id SET DEFAULT nextval('objetivo_id_seq'::regclass);
 :   ALTER TABLE public.objetivo ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    217    216            �	           2604    96253    id    DEFAULT     l   ALTER TABLE ONLY objetivo_projeto ALTER COLUMN id SET DEFAULT nextval('objetivo_projeto_id_seq'::regclass);
 B   ALTER TABLE public.objetivo_projeto ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    219    218            �	           2604    96254    id    DEFAULT     t   ALTER TABLE ONLY patrocinador_projeto ALTER COLUMN id SET DEFAULT nextval('patrocinador_projeto_id_seq'::regclass);
 F   ALTER TABLE public.patrocinador_projeto ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    221    220            �	           2604    97474    id    DEFAULT     `   ALTER TABLE ONLY permissoes ALTER COLUMN id SET DEFAULT nextval('permissoes_id_seq'::regclass);
 <   ALTER TABLE public.permissoes ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    255    254    255            �	           2604    96255    id    DEFAULT     X   ALTER TABLE ONLY pessoa ALTER COLUMN id SET DEFAULT nextval('pessoa_id_seq'::regclass);
 8   ALTER TABLE public.pessoa ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    225    222            �	           2604    96256    id    DEFAULT     p   ALTER TABLE ONLY pessoa_comunicacao ALTER COLUMN id SET DEFAULT nextval('pessoa_comunicacao_id_seq'::regclass);
 D   ALTER TABLE public.pessoa_comunicacao ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    224    223            �	           2604    96257    id    DEFAULT     `   ALTER TABLE ONLY plano_acao ALTER COLUMN id SET DEFAULT nextval('plano_acao_id_seq'::regclass);
 <   ALTER TABLE public.plano_acao ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    227    226            �	           2604    96258    id    DEFAULT     p   ALTER TABLE ONLY plano_acao_projeto ALTER COLUMN id SET DEFAULT nextval('plano_acao_projeto_id_seq'::regclass);
 D   ALTER TABLE public.plano_acao_projeto ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    229    228            �	           2604    96259    id    DEFAULT     T   ALTER TABLE ONLY post ALTER COLUMN id SET DEFAULT nextval('post_id_seq'::regclass);
 6   ALTER TABLE public.post ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    231    230            �	           2604    96260    id    DEFAULT     d   ALTER TABLE ONLY procedimento ALTER COLUMN id SET DEFAULT nextval('procedimento_id_seq'::regclass);
 >   ALTER TABLE public.procedimento ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    233    232            �	           2604    96261    id    DEFAULT     \   ALTER TABLE ONLY programa ALTER COLUMN id SET DEFAULT nextval('programa_id_seq'::regclass);
 :   ALTER TABLE public.programa ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    235    234            �	           2604    96262    id    DEFAULT     Z   ALTER TABLE ONLY projeto ALTER COLUMN id SET DEFAULT nextval('projeto_id_seq'::regclass);
 9   ALTER TABLE public.projeto ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    237    236            �	           2604    97493    id    DEFAULT     X   ALTER TABLE ONLY regras ALTER COLUMN id SET DEFAULT nextval('regras_id_seq'::regclass);
 8   ALTER TABLE public.regras ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    256    257    257            �	           2604    96263    id    DEFAULT     Z   ALTER TABLE ONLY reuniao ALTER COLUMN id SET DEFAULT nextval('reuniao_id_seq'::regclass);
 9   ALTER TABLE public.reuniao ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    243    238            �	           2604    96264    id    DEFAULT     p   ALTER TABLE ONLY reuniao_conhecedor ALTER COLUMN id SET DEFAULT nextval('reuniao_conhecedor_id_seq'::regclass);
 D   ALTER TABLE public.reuniao_conhecedor ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    240    239            �	           2604    96265    id    DEFAULT     v   ALTER TABLE ONLY reuniao_email_externo ALTER COLUMN id SET DEFAULT nextval('reuniao_email_externo_id_seq'::regclass);
 G   ALTER TABLE public.reuniao_email_externo ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    242    241            �	           2604    96266    id    DEFAULT     t   ALTER TABLE ONLY reuniao_participante ALTER COLUMN id SET DEFAULT nextval('reuniao_participante_id_seq'::regclass);
 F   ALTER TABLE public.reuniao_participante ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    245    244            �	           2604    96267    id    DEFAULT     V   ALTER TABLE ONLY setor ALTER COLUMN id SET DEFAULT nextval('setor_id_seq'::regclass);
 7   ALTER TABLE public.setor ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    247    246            �	           2604    96268    id    DEFAULT     X   ALTER TABLE ONLY tarefa ALTER COLUMN id SET DEFAULT nextval('terefa_id_seq'::regclass);
 8   ALTER TABLE public.tarefa ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    249    248            �	           2604    96269    id    DEFAULT     Z   ALTER TABLE ONLY usuario ALTER COLUMN id SET DEFAULT nextval('usuario_id_seq'::regclass);
 9   ALTER TABLE public.usuario ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    251    250            �	           2604    96270    id    DEFAULT     Z   ALTER TABLE ONLY vinculo ALTER COLUMN id SET DEFAULT nextval('vinculo_id_seq'::regclass);
 9   ALTER TABLE public.vinculo ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    253    252            �	          0    95877    acao 
   TABLE DATA               �   COPY acao (id, titulo, data_inicio_previsto, data_fim_previsto, concluido, data_conclusao, status, observacao, lembrete, andamento, responsavel_id, acao_id, supervisor_id, prioridade, anomalia_id, objetivo_id, projeto_id, marco, ordem) FROM stdin;
    public       postgres    false    168   oA      �
           0    0    acao_id_seq    SEQUENCE SET     3   SELECT pg_catalog.setval('acao_id_seq', 24, true);
            public       postgres    false    169            �	          0    95887    acao_plano_acao 
   TABLE DATA               >   COPY acao_plano_acao (id, plano_acao_id, acao_id) FROM stdin;
    public       postgres    false    170   �A      �
           0    0    acao_plano_acao_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('acao_plano_acao_id_seq', 1, false);
            public       postgres    false    171            
          0    95902    anomalia 
   TABLE DATA               �   COPY anomalia (id, causas_internas, causas_externas, data, indicador_id, status, data_conclusao, identificacao_problema, estratificacao_problema, concluido) FROM stdin;
    public       postgres    false    172   B      �
           0    0    anomalia_id_seq    SEQUENCE SET     7   SELECT pg_catalog.setval('anomalia_id_seq', 13, true);
            public       postgres    false    173            
          0    95930 	   auditoria 
   TABLE DATA               `   COPY auditoria (id, alias_controller, alias_acao, usuario_id, created, elemento_id) FROM stdin;
    public       postgres    false    174   pB      
          0    95936    auditoria_campos 
   TABLE DATA               h   COPY auditoria_campos (id, alias_model, valor_antigo, valor_novo, auditoria_id, tipo_campo) FROM stdin;
    public       postgres    false    175   �D      �
           0    0    auditoria_campos_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('auditoria_campos_id_seq', 1649, true);
            public       postgres    false    176            �
           0    0    auditoria_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('auditoria_id_seq', 1158, true);
            public       postgres    false    177            
          0    95946    cargo 
   TABLE DATA               7   COPY cargo (id, titulo, descricao, status) FROM stdin;
    public       postgres    false    178   �Q      �
           0    0    cargo_id_seq    SEQUENCE SET     3   SELECT pg_catalog.setval('cargo_id_seq', 9, true);
            public       postgres    false    179            	
          0    95955 	   categoria 
   TABLE DATA               (   COPY categoria (id, titulo) FROM stdin;
    public       postgres    false    180   �R      �
           0    0    categoria_id_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('categoria_id_seq', 1, false);
            public       postgres    false    181            
          0    95963 
   comentario 
   TABLE DATA               I   COPY comentario (id, mensagem, arquivo, usuario_id, acao_id) FROM stdin;
    public       postgres    false    182   S      �
           0    0    comentario_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('comentario_id_seq', 1, false);
            public       postgres    false    183            
          0    95971    comunicacao 
   TABLE DATA               8   COPY comunicacao (id, titulo, status, tipo) FROM stdin;
    public       postgres    false    184   S      �
           0    0    comunicacao_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('comunicacao_id_seq', 1, false);
            public       postgres    false    185            
          0    95977    departamento 
   TABLE DATA               3   COPY departamento (id, titulo, status) FROM stdin;
    public       postgres    false    186   ;S      �
           0    0    departamento_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('departamento_id_seq', 18, true);
            public       postgres    false    187            
          0    95983    dimensao 
   TABLE DATA               N   COPY dimensao (id, titulo, observacao, ordem, status, empresa_id) FROM stdin;
    public       postgres    false    188   uS      �
           0    0    dimensao_id_seq    SEQUENCE SET     6   SELECT pg_catalog.setval('dimensao_id_seq', 6, true);
            public       postgres    false    189            
          0    95992    empresa 
   TABLE DATA               t   COPY empresa (id, matriz, cnpj, inscricao_estadual, inscricao_municipal, pessoa_id, empresa_id, status) FROM stdin;
    public       postgres    false    190   �S      �
           0    0    empresa_id_seq    SEQUENCE SET     5   SELECT pg_catalog.setval('empresa_id_seq', 4, true);
            public       postgres    false    191            
          0    96001    endereco 
   TABLE DATA               T   COPY endereco (id, logradouro, cep, bairro, cidade, numero, uf, status) FROM stdin;
    public       postgres    false    192   �S      �
           0    0    endereco_id_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('endereco_id_seq', 166, true);
            public       postgres    false    193            
          0    96010    esqueci_senha 
   TABLE DATA               C   COPY esqueci_senha (id, usuario_id, hash, ativo, data) FROM stdin;
    public       postgres    false    194   KW      �
           0    0    esqueci_senha_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('esqueci_senha_id_seq', 5, true);
            public       postgres    false    195            
          0    96015    faixa 
   TABLE DATA               M   COPY faixa (id, titulo, limite_vermelho, limite_amarelo, status) FROM stdin;
    public       postgres    false    196   hW      �
           0    0    faixa_id_seq    SEQUENCE SET     3   SELECT pg_catalog.setval('faixa_id_seq', 1, true);
            public       postgres    false    197            
          0    96021    grupo 
   TABLE DATA               ,   COPY grupo (id, titulo, status) FROM stdin;
    public       postgres    false    198   �W      �
           0    0    grupo_id_seq    SEQUENCE SET     4   SELECT pg_catalog.setval('grupo_id_seq', 12, true);
            public       postgres    false    199            
          0    96027 	   indicador 
   TABLE DATA               �   COPY indicador (id, titulo, indicador_id, faixa_id, objetivo_id, usuario_id, calculo, desdobramento, projecao, tipo_calculo, tipo, ordem, status, anos, unidade, projeto_id) FROM stdin;
    public       postgres    false    200   �W      
          0    96038    indicador_autorizado_visualizar 
   TABLE DATA               P   COPY indicador_autorizado_visualizar (id, usuario_id, indicador_id) FROM stdin;
    public       postgres    false    201   tX      �
           0    0 &   indicador_autorizado_visualizar_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('indicador_autorizado_visualizar_id_seq', 51, true);
            public       postgres    false    202            �
           0    0    indicador_id_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('indicador_id_seq', 23, true);
            public       postgres    false    203            !
          0    96045    indicador_meta 
   TABLE DATA               �   COPY indicador_meta (id, indicador_id, janeiro, fevereiro, marco, abril, maio, junho, julho, agosto, setembro, outubro, novembro, dezembro, ano) FROM stdin;
    public       postgres    false    204   �X      �
           0    0    indicador_meta_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('indicador_meta_id_seq', 21, true);
            public       postgres    false    205            #
          0    96053    indicador_realizado 
   TABLE DATA               �   COPY indicador_realizado (id, indicador_id, janeiro, fevereiro, marco, abril, maio, junho, julho, agosto, setembro, outubro, novembro, dezembro, ano) FROM stdin;
    public       postgres    false    206   �X      �
           0    0    indicador_realizado_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('indicador_realizado_id_seq', 21, true);
            public       postgres    false    207            %
          0    96061    indicador_responsavel_meta 
   TABLE DATA               K   COPY indicador_responsavel_meta (id, usuario_id, indicador_id) FROM stdin;
    public       postgres    false    208   Y      �
           0    0 !   indicador_responsavel_meta_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('indicador_responsavel_meta_id_seq', 30, true);
            public       postgres    false    209            '
          0    96066    indicador_responsavel_realizado 
   TABLE DATA               P   COPY indicador_responsavel_realizado (id, usuario_id, indicador_id) FROM stdin;
    public       postgres    false    210   8Y      �
           0    0 &   indicador_responsavel_realizado_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('indicador_responsavel_realizado_id_seq', 29, true);
            public       postgres    false    211            )
          0    96071    marcador 
   TABLE DATA               :   COPY marcador (id, titulo, status, descricao) FROM stdin;
    public       postgres    false    212   _Y      �
           0    0    marcador_id_seq    SEQUENCE SET     7   SELECT pg_catalog.setval('marcador_id_seq', 44, true);
            public       postgres    false    213            +
          0    96080    marcador_objetivo 
   TABLE DATA               B   COPY marcador_objetivo (id, marcador_id, objetivo_id) FROM stdin;
    public       postgres    false    214   |Y      �
           0    0    marcador_objetivo_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('marcador_objetivo_id_seq', 139, true);
            public       postgres    false    215            -
          0    96085    objetivo 
   TABLE DATA               9  COPY objetivo (id, ano, ordem, titulo, dimensao_id, status, tipo, objetivo_id, prioridade, andamento, resultado, providencia, restricao, situacao, situacao_desc, status_medida, data_ultima_atualizacao, pdti_prazo, pdti_indicador, pdti_valor_meta, observacoes, riscos, data_ultima_revisao, usuario_id) FROM stdin;
    public       postgres    false    216   �Y      �
           0    0    objetivo_id_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('objetivo_id_seq', 153, true);
            public       postgres    false    217            /
          0    96095    objetivo_projeto 
   TABLE DATA               @   COPY objetivo_projeto (id, projeto_id, objetivo_id) FROM stdin;
    public       postgres    false    218   �Y      �
           0    0    objetivo_projeto_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('objetivo_projeto_id_seq', 122, true);
            public       postgres    false    219            1
          0    96100    patrocinador_projeto 
   TABLE DATA               B   COPY patrocinador_projeto (id, projeto_id, pessoa_id) FROM stdin;
    public       postgres    false    220   	Z      �
           0    0    patrocinador_projeto_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('patrocinador_projeto_id_seq', 70, true);
            public       postgres    false    221            T
          0    97471 
   permissoes 
   TABLE DATA               6   COPY permissoes (id, grupo_id, descricao) FROM stdin;
    public       postgres    false    255   7Z      �
           0    0    permissoes_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('permissoes_id_seq', 61, true);
            public       postgres    false    254            3
          0    96105    pessoa 
   TABLE DATA               >   COPY pessoa (id, titulo, tipo, observacao, email) FROM stdin;
    public       postgres    false    222   �Z      4
          0    96111    pessoa_comunicacao 
   TABLE DATA               D   COPY pessoa_comunicacao (id, pessoa_id, comunicacao_id) FROM stdin;
    public       postgres    false    223   >]      �
           0    0    pessoa_comunicacao_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('pessoa_comunicacao_id_seq', 1, false);
            public       postgres    false    224            �
           0    0    pessoa_id_seq    SEQUENCE SET     6   SELECT pg_catalog.setval('pessoa_id_seq', 194, true);
            public       postgres    false    225            7
          0    96118 
   plano_acao 
   TABLE DATA               >   COPY plano_acao (id, objetivo_id, titulo, status) FROM stdin;
    public       postgres    false    226   []      �
           0    0    plano_acao_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('plano_acao_id_seq', 1, false);
            public       postgres    false    227            9
          0    96124    plano_acao_projeto 
   TABLE DATA               D   COPY plano_acao_projeto (id, projeto_id, plano_acao_id) FROM stdin;
    public       postgres    false    228   x]      �
           0    0    plano_acao_projeto_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('plano_acao_projeto_id_seq', 1, false);
            public       postgres    false    229            ;
          0    96129    post 
   TABLE DATA               �   COPY post (id, titulo, mensagem, acao_id, receber_email, status, post_id, created, modified, usuario_id, categoria_id, tarefa_id) FROM stdin;
    public       postgres    false    230   �]      �
           0    0    post_id_seq    SEQUENCE SET     3   SELECT pg_catalog.setval('post_id_seq', 1, false);
            public       postgres    false    231            =
          0    96139    procedimento 
   TABLE DATA               �   COPY procedimento (id, titulo, resultado_esperado, passos, requisito, arquivo, arquivo_dir, usuario_id, certificado, status) FROM stdin;
    public       postgres    false    232   �]      �
           0    0    procedimento_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('procedimento_id_seq', 2, true);
            public       postgres    false    233            ?
          0    96148    programa 
   TABLE DATA               Q   COPY programa (id, titulo, data_inicio, data_fim, status, descricao) FROM stdin;
    public       postgres    false    234   ^      �
           0    0    programa_id_seq    SEQUENCE SET     7   SELECT pg_catalog.setval('programa_id_seq', 41, true);
            public       postgres    false    235            A
          0    96157    projeto 
   TABLE DATA               �  COPY projeto (id, titulo, data_inicio_previsto, data_fim_previsto, valor, descricao, concluido, data_conclusao, motivacao, resultado, risco, usuario_id, status, custo, moeda, programa_id, email_tarefa, email_acao, gasto, processo, tamanho, perspectiva_temporal, complexidade, importancia_politica, saude_projeto, situacao, url_projeto, parceiros, patrocinador, area_executora, area_cliente, data_ultima_atualizacao) FROM stdin;
    public       postgres    false    236   O^      �
           0    0    projeto_id_seq    SEQUENCE SET     7   SELECT pg_catalog.setval('projeto_id_seq', 181, true);
            public       postgres    false    237            V
          0    97490    regras 
   TABLE DATA               6   COPY regras (id, permissao_id, descricao) FROM stdin;
    public       postgres    false    257   �^      �
           0    0    regras_id_seq    SEQUENCE SET     6   SELECT pg_catalog.setval('regras_id_seq', 122, true);
            public       postgres    false    256            C
          0    96169    reuniao 
   TABLE DATA               �   COPY reuniao (id, titulo, projeto_id, data, pauta, ata, observacao, convidados_externos, local, status, hora_inicio, hora_fim) FROM stdin;
    public       postgres    false    238   �_      D
          0    96176    reuniao_conhecedor 
   TABLE DATA               A   COPY reuniao_conhecedor (id, reuniao_id, usuario_id) FROM stdin;
    public       postgres    false    239   �_      �
           0    0    reuniao_conhecedor_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('reuniao_conhecedor_id_seq', 1, true);
            public       postgres    false    240            F
          0    96181    reuniao_email_externo 
   TABLE DATA               ?   COPY reuniao_email_externo (id, reuniao_id, email) FROM stdin;
    public       postgres    false    241   `      �
           0    0    reuniao_email_externo_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('reuniao_email_externo_id_seq', 1, true);
            public       postgres    false    242            �
           0    0    reuniao_id_seq    SEQUENCE SET     5   SELECT pg_catalog.setval('reuniao_id_seq', 1, true);
            public       postgres    false    243            I
          0    96188    reuniao_participante 
   TABLE DATA               C   COPY reuniao_participante (id, reuniao_id, usuario_id) FROM stdin;
    public       postgres    false    244   1`      �
           0    0    reuniao_participante_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('reuniao_participante_id_seq', 1, true);
            public       postgres    false    245            K
          0    96193    setor 
   TABLE DATA               2   COPY setor (id, titulo, status, tipo) FROM stdin;
    public       postgres    false    246   N`      �
           0    0    setor_id_seq    SEQUENCE SET     4   SELECT pg_catalog.setval('setor_id_seq', 15, true);
            public       postgres    false    247            M
          0    96199    tarefa 
   TABLE DATA               �   COPY tarefa (id, titulo, data_inicio_previsto, data_fim_previsto, concluido, data_conclusao, status, comentario, lembrete, arquivo, arquivo_dir, responsavel_id, supervisor_id, prioridade, reuniao_id, acao_id) FROM stdin;
    public       postgres    false    248   �`      �
           0    0    terefa_id_seq    SEQUENCE SET     4   SELECT pg_catalog.setval('terefa_id_seq', 5, true);
            public       postgres    false    249            O
          0    96209    usuario 
   TABLE DATA               �   COPY usuario (id, login, senha, status, lembrete_senha, foto, enviado, pessoa_id, cargo_id, vinculo_id, cpf, rg, grupo_id, departamento_id, setor_id, chefe, imagem_perfil, diretorio_imagem_perfil, endereco_id) FROM stdin;
    public       postgres    false    250   �`      �
           0    0    usuario_id_seq    SEQUENCE SET     7   SELECT pg_catalog.setval('usuario_id_seq', 117, true);
            public       postgres    false    251            Q
          0    96219    vinculo 
   TABLE DATA               A   COPY vinculo (id, titulo, status, created, modified) FROM stdin;
    public       postgres    false    252   �e      �
           0    0    vinculo_id_seq    SEQUENCE SET     5   SELECT pg_catalog.setval('vinculo_id_seq', 3, true);
            public       postgres    false    253            �	           2606    97482 
   grupo_pkey 
   CONSTRAINT     G   ALTER TABLE ONLY grupo
    ADD CONSTRAINT grupo_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.grupo DROP CONSTRAINT grupo_pkey;
       public         postgres    false    198    198            �	           2606    97480    permissoes_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY permissoes
    ADD CONSTRAINT permissoes_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.permissoes DROP CONSTRAINT permissoes_pkey;
       public         postgres    false    255    255            �	           2606    97495    regras_pkey 
   CONSTRAINT     I   ALTER TABLE ONLY regras
    ADD CONSTRAINT regras_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.regras DROP CONSTRAINT regras_pkey;
       public         postgres    false    257    257            �	           2606    97483    permissoes_grupo_id_fkey    FK CONSTRAINT     u   ALTER TABLE ONLY permissoes
    ADD CONSTRAINT permissoes_grupo_id_fkey FOREIGN KEY (grupo_id) REFERENCES grupo(id);
 M   ALTER TABLE ONLY public.permissoes DROP CONSTRAINT permissoes_grupo_id_fkey;
       public       postgres    false    2550    198    255            �	           2606    97496    regras_permissao_id_fkey    FK CONSTRAINT     z   ALTER TABLE ONLY regras
    ADD CONSTRAINT regras_permissao_id_fkey FOREIGN KEY (permissao_id) REFERENCES permissoes(id);
 I   ALTER TABLE ONLY public.regras DROP CONSTRAINT regras_permissao_id_fkey;
       public       postgres    false    257    255    2552            �	   y   x�32�t��KIT�;�8_�85�����D��@���42�4����4�DȚq�r��$@�#�A�@��Ȅ���r������ə�@K�(�+��*�%V�!5�f%�4E���٪=... yD/"      �	      x������ � �      
   K   x�34�t�LO�M�,��4204�54�54���4~��+�f*�+��*�%V�q�*$��%�s�s��qqq ��      
   9  x���K��0���)z�)D��m�����Xu�&��E�S�}z�^���d:�%�"����I#��/ah�n���0�����;4�=Y��"V�i����۵��ϋ�W�����"�3�*�*)x�;������'浺���z�#��Ӂ�xZoO������&���-y�kn`�qi��x��g6�0×�|���Ӷ0���V��F��k�܎�P�M�36��	�Q�e<��0�a�_��<j�ZT_��0t�vF�)��g���$^Q:��x���)$C�P��DA��ǯv�~��[䚥�<�{F�&�'+k�?ۀ��w��$��6l�J�u�d��x��H|=�Ԍ�z6���4�i�XnW���ס/�'>Մ#��S��&>:
dH���߅m��-���ͳ$��<���r���u�e�&<�ɒ%���d��sc�bN�����8�]�`�p�P�ԗW2IiYN���͵�\�g+�t��B<�����+��7qm,��Z�����M��+��Z��x�j12-���{���,���+��!�Nb�E��bb�[X���׫��P��      
   �  x��[[o��~V~!�@41�����)���ۗ�9r&�8�!e�.�k�P�@�@_��z�Fo�ۉv�/�DΜ9s.߹��	�dF˚Тz�2B��O�3{�8N�9Ab��!�׈�@�[��Z��yM�mN���q�sz��Z���żd�2���'�����hI
��,�"UM�,�;q��v|�$R��d3�C��<Ǜ�5���/�W%�]�|I2��b�'⵷�W�3X���[�pU�z[����?0�RD�XXP/#XNi���
Q�%�O� *"7|��@�Ȩ�E�D�����.3�*Q�b~�W,Z�6�����V�7�7.X�1c蓅/�U����O�%8�FS��*�!��^���`�(|h&���y�2��`���x��^������	�HMǾOˎk`[m��GzR�YM�$U��[H<Rw�$LK�-vUL��~5�"$+I{�;S(�h=%��K�����֫��9��b���\,A5.��k�]��=��b�}RR%��?ki�U��!�4X�P��Z�@�	����|Y��jT3r�$�蕰�E.`+-��ڠSRT)#�6[�%���9��X�� 
���{��xf���9�9�䆹e�D`W�v�;�<nPew�
֟�6I=l�����_a#Ӯ�Ik2�Kθ ��g�����wD������LG}����k��k+�G�'�C6җ2�����v�Ow ~K��/�z��gO����ߕ��,_�����ߣ?(�eX��]}��:�g�8�-�'��]�~��hq�xb�жҁ�\J�iA��+��ُ�H����f
����"֊�����)��%�4a�bv�f{���O9�����Hyjҳp��r�"��!�ϲ�U͐�L���H&�d0����V7��g�\sz���S@&}E���*�"�����X��;�w�H�E��Т@�g-�X�]�F|Q9JT�Lm��<�����I��:��2|)K%xU��(0}���UEA;��[�vWv
]��֙�F��l�q;i6�^\6dې��<�=�^��+"���,t��+�mz��q%�H�n���k��g��o�J��Ryf�$~�J�l[6d����8�%b.�Zհ V)��=^�f��٠KU5fk��0��@!����?��c��?���
��7��}��.��q��X\?z�Ԏ�I��إ�+`ε�;Q߄����-�,蕩M��Ew�&l#���A;��K�v�:�h��զn}�j��e�B3�>�wL����qϵ�d���c颂���m��ֹU�.�}����,�����X��4���Bem�k���6�al{��0�-1���mF!���][j�*�3T}�oN�z�0Z�f!���D����V>_��QF�~���uԖ̞�T!��a���.d'Yr0���ǃ]�&བz��_<�ΐ���)��c�H:��V���=�a�A�L�2��փM�cRf�4������X���j��c��FxR��F�4Y�$A�f'v�2CǙ����[/*��p;%uj=\��|Z�0�N�n�zl��rkD>�l����:�J-$;D����~�ՕBY�(O�^\��9�+��^�z���xk(�2zT]��B}����6�w'�<0\���]P�g�a�P���V94���5ԡhb('meXP�z�X��m�M;�5�7��1��ݝ*���5�����.�wZy#x�z��9��P�]���ƄN����j|oޫJ*'h�^�p8zٌX1eLq�d!���Y�X,�f��F��lgV��J ]7�ib2���w�1�w��4zd1�8�	ñ,F4�������m��ьS�нv�Zw�����ty�q��R�q�Ӄݟ׺a�Id��:q��O1TҐ��*���='�a��U�uG��Fu��{��ս�n��4�*7��zX9�#<N*s�����4ǪSntN4߭��(O�|��<x����v�X�#p�
'J|9��.x�I�����b'��|_����!�� /�B׻]���(g��tGL�b�&��p`Y*7�Ö�kR�J���T紐rT����N��C*c�Rgl��
u��:�u�M�zd��:�ݪʺ�B�/�n��o���h�f�wz��99�{�
�}�A�aW�W����@�-��yk��p����K��Zg���׸g��ß˔#4�����{���<��,jAN���ӝ�V�@��W ��8u��{ �!�=~��wx��*���t��Y��r���[s��I��[���R�}w&�ad��^a�|d�X�uJ��o���u�}�~���~���۾���p,�Z�������v^�����&���^pl6Y�P)��xl�Ɇ@qx��������mk����zD�G�$�~'�h=�yq��y��!Ϟ�t>�R%Yi�@���(���W`H�ڹ�T�?o��F�X$������T������Io&E��
�Ƭ@���\��1
lG��En㆞���4�`�=f$��*�8�t'߱�k�`<{�@�7$:1_I�]A�E$�{�R96��;=�"j�{���=�2�3y��/��A�h#H_pwM컉&F���CHQE�ɛ�{���v=O*mx�jХ����M�}�w FY�]����|��G�kԐ�O|��u��j��:������!c��{H8mU���pxrCuO�e�y_������=uT����=\Ī5ӍH�%������//��s�/1���4��}N��R}����t�:q[o(���-�-˗j����{m���̫��زƛ�`�3�ן��j]0tM���n�4�bX�	�Q#��eIsR�*$��2$&��A��O��XC=�M�*\51͉��o�,Qz"�����/�5w@e�_R4�ue_����7&�wXJ5C���t[u��/���#�@h��������A.#U�3�Ώ����|��v�>uD��C�]�ҧ�]H㚈-��3�f�����ɻ%�qkJ��7�Zm�+1nu8�:��:���$���X_�?P�?�sv��V`�aE��@��aCR :y�����Au0����Cz���.�awq|���퇻8�w����炊����3me���:��~��u�6ַ�~� ��p���n1����g�Ӯp<��*U٫�?��?`�I�����;"�����O���Gē�jBv<<���\�Ó�P!C<�TI
�p<<���'�=�?I���      
     x����N�@���S���4uC
�X��-��3�]:�6���y1�v@E��n���������H��DݬE_S��+��MD�����$��t�LU�Fl4�i������r4�b���ť4Kn)f���.e��8 p�&�4�av���e�k1�Q\m'lEJ��N�$��vllv���@�7N�W;����U�JN�tW:��GlLÿ ��+�R���2n���=��!!��;��DbVi�n0��������Y���5:�����i��+�|���^� ��w�+      	
      x������ � �      
      x������ � �      
      x������ � �      
   *   x�3��tI-H,*I�M�+�Wp��K�KN�,��4����� Ƥ
a      
   =   x�3�(��M�,JTp�yŇ�s�f�e$*�'��%^RHITH���	W� g�      
      x�3�4�CKc�?NC�=... M�      
   N  x����n�0�g�)�-x�+�I�E���ta"G���A��G�ܗh^��d9�J81d�g�~�6?]���^�&�][Om#�h҆�mݧ�6�>7�{�%.?
Z��C1���}}}� �
���� 44��09av���ٮ��nh҃pF;��]-����i�������v-�V�3��j$�H��T#�FR��I5ΔF�	$0H`g����h4*4"V�Ahh4H`��"�=LU�H`��!�C�	8$pH�p8$�H���#�G�	<x$�H�� ��3��	b�N;6/�i�wƭ=^��;�K�M��-qv/��
Q�Sjy�tܭjٮ�/������ۺ�����h�v�h�n	U�p�T�d�������*�_]�k
|m��+�������nUA�bA�bA�bA�bA�bA�bA�bA�bA�bA�bA�H�TA�H��TA�H�i����6��d�ՍL"Va�����D;}q<�u��}	�k���6��s�m'��K���h]��l��_Oi�@�y3�@�!�>F���0bO�$9��f��o��U��#�S#��ӡ����N7�#.���3�ξ�
�7Z�oD���y�K�6���Po�����?���Ņ���S�9�8��,�,(#�v�d"M��a''�C$i�,Ǭ���Y�Y,�!f)ffY��c�N!�M��bꄘ<!�O�	b
��D!�QȲy����3ܓ�<��1ICLӐ��X>&x��b��!&m�ib↘�!&oH3���|e)qqq�M�e���$�w�������Q������ɓr5��u�������d!>|�B��}�Z�� �ԃ      
      x������ � �      
      x�3�tK̬HT0�47�4�4����� <�C      
   I   x�3�LO-J�+I�4��-.M,���-9CR�KR�s8�P��(\3Nǔ�̼�⒢Ĕ�"��=... ���      
   t   x�u�A
�0���s�L-�����lB2��ȴ���Ep��Ç�y�pu��n��hN��h�'�^�ox�#�$�]�+�痬��0[{��J[���v{x�Q�Itک�h<�60z&�      
       x�3��42�42�25�444�42����� .I}      !
   "   x�32�42�4��M��9���+����� b�	U      #
   "   x�32�42�4��M��9���+����� b�	U      %
       x�3��42�42�26�444�42����� -�w      '
      x�3��444�42����� _.      )
      x������ � �      +
      x������ � �      -
   C   x�345�4204�4�)J��K,R(�O�W�W(H-.�O�QH�U��OI�*�4*2��#q��qqq �      /
      x������ � �      1
      x�3��4�0�4��27 �-M�b���� 8��      T
   �   x�31�4�-.=��(3�X�1%393?/����Eµ"9�4(l�*��YTlj�"�Y5D�,.M�ɬ�e\s�R��-55F��ij�"
��Yf�� �� o:'�����!
��Ib��Bj��!Bɚ=... ��nR      3
   U  x����N�@�k�)��\��*�"��X:��x K�G�/��m^i����")�3��o�uεTw�s�RKu��r�W������}�/��a�,UilӸ�s~)\�H#D��HQCD���e����R�>�v|���_kk�7ր����˒ ��B� �4�̅��t�,�3i҄�s���i�0l �0Ԁ�5`��W5���	��	E!���/�7
�$��&M�	LM`r�4�p`�d�d�d����e�����o�k� �V]���i�F`hA�Y���Z��:�C|�`� C��.��.��.�\�7<��y�� 8�9 �p�s ��Ȉ 8�9�p��s�#��8G�9�Yc$M(����	y��7E�"�M���H~S�8�	q4���hFS0�ɣŠ]����O��m�S[���uN������F��'h�@����IR�<B�I��-m��ɢa���c-9K�B·��-$~��B�ё_���w�K7��y�NK}�O��=�͕��H�r�v�<�����c��+��K]�~||W����M����0�K�K:<��tz�?Z^�~��l� �TC�      4
      x������ � �      7
      x������ � �      9
      x������ � �      ;
      x������ � �      =
   J   x�3��M-U((��M�,�2�SS����|΢��Ҝ�Ĕ|΂����b�@aifq&P*Ə��ĜӀӐ+F��� ���      ?
   3   x�31�(��M�,�W((�O/J�M�4204�54�541M�LCN�=... v�      A
   q   x�3�0�tO-:�*/93Q!%�X��(?+��H�,�,�4204�54�541M��?NN0��ihh�ib�	�D�Μ����W�d�+%V�C8���9%�PE`���+F��� �%�      V
   �   x�u��j�0����ad&&ќK��^��pݢ��雃f�3{|��E_�i�k~�)ݫЧ.��0U�[�Ay#s�-���L[<���x�$,��g�Ӳ�l+Xz�X0�}|m;B�ې�����R�gʇ!��g	���DV���w�s��"4��l].��:Iy܀5̇f���<��l�c5½��Q��
�H���O�j|��G�ǈ��<��ڕϽ�]������؊��̃�Վ�4��+iG�	��y�WJ�\['r      C
      x������ � �      D
      x������ � �      F
      x������ � �      I
      x������ � �      K
   3   x�34�t��K�KN�,��4�4�24�tL����,.)J,�,�r��qqq -5O      M
   K   x�3���/KT(I,JMK�4204�54�54F0M88c��DHjqIb^J�L��z�N#SNKNG;Ə+F��� t��      O
   �  x��X�n�6=�_�cr���[rH90�Hv7��h1�|}�R/�1��܇��x���ja)M���τ����(c���`!�y|ə�������G� o��&� #��������H�& $Ղ��<���X��- 4H�ʒ��r>�~����X�ZקɅ*T�u���r�șS��)uS�*|qc-�����j �Եq�r�	�5���@���J�n�)��c7�i�IG�Z���mG,�^x{`V6�+[`�A��V�g[��~5��[P�K5'S�?�?��8���_HF�B�Cr�
�~�A��jM\@�>�U��%Nb
��Wc@����r�w�Y*������KؠG����F^�4$�\Ua��+bį��>>��8�3F#?��8ƿ��!�S����# 7L�VrqY��dl�{qC�)T��76k�ԐA U�ĹO>$��B88ݲ�1�T����?����2��[��0)7zD\�������S��D�x	%q_Ny�?�����5�!�C��S����Q�V���bu�%�i�����&y�����'��	��9���wSee�`��]Vgd	��ҒP&��GrXЯe���T
�Z$d�CS�`�\�yp~������qp�,[��Ս)b$�F��4"�8�bF�:x��>�K�P%��M	3�ʂ~����e���eHx.�U�@�m����I�d �q'�ZU��T�f�@h�_*���T�4��KD�ba�k�E�2<P#p���zLu�K
ω#h����U[XsW�F.M��*��Bw�_N��>:w��:��pQ�]�bh�m:�
D�[�!�YQ�����܏U��-��}�P�KҀɕB�
��7�W�8��p0L�y�U���!6�2����J�J|�R$�|�<�{���nC-'C��OU��!eQ���.� �Q+H�6�*�(�]� �j%I��zQ��|.Xp5�v���|�bb���ٍ~�.T,0q�4+,MZP솯	��Oc�^k�$�Z��R�1�C�\C��f�w�}���Q�5ʾF��(�e_��k�}���Q�5ʾF��(�e_��k�}��-kr;�j�G��q�`�1�w&��F6x�Dx������U������d��?����'��O�G�1L�CÅ�>jf4�ڷ&h͵�&jݖ���C�c<��*Ǧ�!���B����̸���b����(��- ˷      Q
   R   x�3�tL���LL��4��".#N״Ԓ�2��������������������)61.cN�ԂԼ�Լ�Tl�L��q��qqq �O'     