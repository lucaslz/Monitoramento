--
-- PostgreSQL database dump
--

-- Dumped from database version 12.0
-- Dumped by pg_dump version 12.0

-- Started on 2019-12-23 18:05:03

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

--
-- TOC entry 2 (class 3079 OID 20528)
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- TOC entry 3718 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry, geography, and raster spatial types and functions';


--
-- TOC entry 212 (class 1259 OID 21539)
-- Name: bus_stop_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bus_stop_sequence
    START WITH 1
    INCREMENT BY 1
    MINVALUE 0
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.bus_stop_sequence OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 213 (class 1259 OID 21541)
-- Name: bus_stops; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bus_stops (
    id integer DEFAULT nextval('public.bus_stop_sequence'::regclass) NOT NULL,
    pos public.geometry(Geometry,4326),
    description character varying(40)
);


ALTER TABLE public.bus_stops OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 20526)
-- Name: route_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.route_seq
    START WITH 1
    INCREMENT BY 1
    MINVALUE 0
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.route_seq OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 21530)
-- Name: routes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.routes (
    id smallint DEFAULT nextval('public.route_seq'::regclass) NOT NULL,
    geom public.geometry(LineString,4326)
);


ALTER TABLE public.routes OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 21552)
-- Name: routes_busstops; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.routes_busstops (
    id integer NOT NULL,
    id_routes smallint,
    id_bus_stops integer
);


ALTER TABLE public.routes_busstops OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 21550)
-- Name: routes_busstops_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.routes_busstops ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.routes_busstops_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 204 (class 1259 OID 16397)
-- Name: users; Type: TABLE; Schema: public; Owner: me
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(30),
    email character varying(30)
);


ALTER TABLE public.users OWNER TO me;

--
-- TOC entry 203 (class 1259 OID 16395)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: me
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO me;

--
-- TOC entry 3719 (class 0 OID 0)
-- Dependencies: 203
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: me
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 3558 (class 2604 OID 16400)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: me
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 3710 (class 0 OID 21541)
-- Dependencies: 213
-- Data for Name: bus_stops; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bus_stops (id, pos, description) FROM stdin;
72	0101000020E610000058A835CD3B0246C0E6AE25E483FE33C0	ESTRADA DO JATOBA
73	0101000020E61000001EC022BF7E0846C003CFBD874BEE33C0	Rua Cipriano Micheleto
74	0101000020E610000029417FA1470646C01B2FDD2406E933C0	Av. Helena de Vasconce
75	0101000020E610000075CDE49B6D0646C07B14AE47E1E233C0	BR 040 / Rua Onze
76	0101000020E6100000124E0B5EF42146C0529ACDE3307433C0	Av Lucas Rodrigo / Av Perimetral
77	0101000020E61000001B9C887E6D2146C05CC823B8917233C0	FABIANI JOSE DE OLIVEIRA
78	0101000020E61000005E2EE23B311F46C0D1782288F36C33C0	R. Prof. Abeilard nº 354
79	0101000020E6100000124BCADDE71E46C014ED2AA4FC6C33C0	Av Pref Alberto Moura
80	0101000020E610000093C3279D481E46C0EDBAB722316D33C0	Rua dos Ferroviarios
81	0101000020E61000001475E61E121E46C0CF126404546C33C0	LUIZ EDUARDO SILVEIRA GOMES
82	0101000020E610000006F1811DFF1D46C04E97C5C4E66B33C0	Rua dos Ferroviarios
83	0101000020E61000009E5C5320B31D46C07AFCDEA63F6B33C0	Rodovia Vicinal
84	0101000020E610000034A14962491D46C0C576F700DD6B33C0	Rua Pedro Camilo
85	0101000020E61000006F2A52616C1D46C0F853E3A59B6C33C0	Av Jose Servulo
86	0101000020E6100000AF7D01BD701D46C0C5CBD3B9A26C33C0	GILMAR FERNANDES DE ALMEIDA
87	0101000020E61000002D414640851D46C01D39D219186D33C0	Av Jose Servulo
88	0101000020E6100000AE8383BD891D46C0E7543200546D33C0	JOAO ALFREDO TORRES DA COSTA
89	0101000020E61000007842AF3F891D46C04C8E3BA5836D33C0	Av Jose Servulo
90	0101000020E61000000C3CF71E2E1D46C012A5BDC1176E33C0	Av Zoli Franca
91	0101000020E6100000ADC266800B1C46C0058A58C4B06F33C0	Rua Pains
92	0101000020E6100000A3CEDC43C21B46C05F27F565696F33C0	Rodovia MG-238
93	0101000020E610000061FA5E43701A46C00B7BDAE1AF6133C0	Fabrica Sete Lagoas
\.


--
-- TOC entry 3708 (class 0 OID 21530)
-- Dependencies: 211
-- Data for Name: routes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.routes (id, geom) FROM stdin;
1	0102000020E610000002000000124A5F08399745C05E0542FC0DD033C0F6EFFACC599745C04ED026874FD033C0
2	0102000020E61000001B01000058A835CD3B0246C0E6AE25E483FE33C06B47718E3A0246C08BFB8F4C87FE33C09D4A06802A0246C09817601F9DFE33C0EDB776A2240246C080BBECD79DFE33C0CC272B86AB0146C03EEB1A2D07FE33C0D845D1031F0146C02B14E97E4EFD33C082E15CC30C0146C0EDBAB72231FD33C0B0C91AF5100146C078EC67B114FD33C040DAFF006B0146C01212691B7FFA33C0802DAF5C6F0146C0BC22F8DF4AFA33C0D47FD6FCF80146C0B66455849BF833C0FAF19716F50146C0E910381268F833C0083C3080F00146C0BD73284355F833C0AB9509BFD40146C01348895DDBF733C0047289230F0246C0E04A766C04F633C0A1478C9E5B0246C0DB300A82C7F333C0FCC6D79E590246C0C26C020CCBF333C0715AF0A2AF0246C053AF5B04C6F233C0F1F62004E40346C00B2769FE98F233C0AB3DEC85020446C09A7ADD2230F233C06AA4A5F2760446C08675E3DD91F133C00D54C6BFCF0446C0257497C459F133C0C216BB7D560546C095BA641C23F133C0446FF1F09E0546C0BF654E97C5F033C0BCE9961DE20546C0B72A89EC83F033C04BE9995E620646C05CACA8C134F033C0FFD0CC936B0646C00F43AB9333F033C0AAD72D02630746C0556AF6402BF033C0C85D8429CA0746C0C9E369F981EF33C0DDB243FCC30846C0957EC2D9ADED33C09B8F6B43C50846C01366DAFE95ED33C0452BF702B30846C0F5D8960167ED33C0C4978922A40846C0172AFF5A5EED33C094F6065F980846C009C3802557ED33C06C97361C960846C0FCC3961E4DED33C0EB54F99E910846C0965CC5E237ED33C00AD6389B8E0846C0D3F6AFAC34ED33C04628B682A60746C0FE0B040132EC33C013D55B035B0746C0ED45B41D53EB33C04F3BFC35590746C0D1949D7E50EB33C06C21C841090746C053927538BAEA33C0BF60376C5B0646C02043C70E2AE933C0B2101D02470646C0F19BC24A05E933C0B2101D02470646C0F19BC24A05E933C0B2101D02470646C0F19BC24A05E933C0362383DC450646C0B7D100DE02E933C0362383DC450646C0B7D100DE02E933C0362383DC450646C0B7D100DE02E933C0771211FE450646C0B7D100DE02E933C0771211FE450646C0B7D100DE02E933C0771211FE450646C0B7D100DE02E933C0771211FE450646C0B7D100DE02E933C0771211FE450646C0B7D100DE02E933C0771211FE450646C0B7D100DE02E933C0B8019F1F460646C076E272BC02E933C0B8019F1F460646C076E272BC02E933C0B8019F1F460646C076E272BC02E933C0B8019F1F460646C076E272BC02E933C0B8019F1F460646C076E272BC02E933C0B8019F1F460646C076E272BC02E933C0B8019F1F460646C034F3E49A02E933C0B8019F1F460646C034F3E49A02E933C0B8019F1F460646C034F3E49A02E933C0B8019F1F460646C0F303577902E933C0B8019F1F460646C0F303577902E933C0B8019F1F460646C0F303577902E933C0446D1B46410646C0E2AFC91AF5E833C0446D1B46410646C0E2AFC91AF5E833C0446D1B46410646C0E2AFC91AF5E833C0C30DF8FC300646C039268BFB8FE833C06ADFDC5F3D0646C0C4B5DAC35EE833C0B471C45A7C0646C09ED0EB4FE2E733C01CF0F961840646C04ACE893DB4E733C0CDCD37A27B0646C03B6EF8DD74E733C02C11A8FE410646C00ED8D5E429E733C03B38D89B180646C031EF71A609E733C0EC1516DC0F0646C0A2B3CC2214E733C0901150E1080646C0892991442FE733C030A182C30B0646C0983270404BE733C0FF058200190646C0B88FDC9A74E733C0CF6A813D260646C0FD6B79E57AE733C0F81A82E3320646C0020CCB9F6FE733C04CE3175E490646C0EC2FBB270FE733C0FF9600FC530646C057EE056685E633C0BB4560AC6F0646C081D1E5CDE1E233C0BB4560AC6F0646C081D1E5CDE1E233C0BB4560AC6F0646C081D1E5CDE1E233C03276C24B700646C08BA9F413CEE233C03276C24B700646C08BA9F413CEE233C03276C24B700646C08BA9F413CEE233C042791F47730646C0E50CC51D6FE233C02F8672A25D0746C081B4FF01D6DE33C0B9C2BB5CC40746C0111956F146DE33C0137EA99F370946C0AFB0E07EC0DB33C01EC4CE143A0946C0B6D9588979DA33C080F0A1444B0A46C0AF42CA4FAAD533C053910A630B0B46C022C66B5ED5D133C08FAB915D690B46C00C022B8716D133C014D044D8F00C46C0306475ABE7CC33C06327BC04A70E46C00B0E2F8848C933C0DB8651103C1046C00C59DDEA39C533C0F9A1D288991146C03430F2B226C233C0FDDB65BFEE1246C017B7D100DEBE33C0815CE2C8031346C044A852B307BE33C0569FABADD81346C015C9570229B933C0F67EA31D371446C0C630276893B733C0FBB2B453731546C03123BC3D08B533C08F6CAE9AE71646C0950C0055DCB033C0228AC91B601846C04CC3F01131AD33C0D40FEA22851846C03F1D8F19A8AC33C0DA571EA4A71846C00000000000AC33C07978CF81E51846C0D00F238447AB33C00CB1FA230C1946C05E0EBBEF18AA33C083F6EAE3A11946C0284701A260A633C0EA3F6B7EFC1946C0605B3FFD67A533C0C501F4FBFE1946C067463F1A4EA533C00EF8FC30421A46C08C648F5033A033C0FE9C82FC6C1A46C0E4F4F57CCD9E33C0D57954FCDF1B46C0DAA9B9DC609C33C090A2CEDC431C46C04162BB7B809A33C0A298BC01661C46C054AC1A84B99933C0E5284014CC1C46C0F0C16B97369833C0F5F6E7A2211D46C055A35703949633C067B45549641D46C05F96766A2E9333C0F56393FC881D46C03E92921E869233C01DC9E53FA41D46C05A677C5F5C9233C01DC9E53FA41D46C05A677C5F5C9233C07FA5F3E1591E46C03813D385589133C0DB166536C81E46C0170E8464018F33C0E61E12BEF71F46C02096CD1C928A33C0F4BF5C8B162046C0AC8DB1135E8A33C0857B65DEAA2146C0EE08A7052F8633C0857D3B89082346C07BF486FBC88133C088F37002D32346C0F700DD97337F33C0207BBDFBE32346C0C4D0EAE40C7D33C05DA626C11B2446C00FD6FF39CC7B33C0C158DFC0E42446C0359886E1237A33C0E6965643E22446C016FA60191B7A33C0B41F2922C32446C02A8D98D9E77933C0548CF337A12446C03EB14E95EF7933C00684D6C3972346C036EA211ADD7933C00684D6C3972346C036EA211ADD7933C00684D6C3972346C036EA211ADD7933C0350873BB972346C0D124B1A4DC7933C000C79E3D972346C09C1727BEDA7933C0E415889E942346C04B598638D67933C0B9E00CFE7E2346C01E54E23AC67933C096ED43DE722346C0D80FB1C1C27933C0A297512CB72246C09B030473F47833C0E833A0DE8C2246C098BF42E6CA7833C0A053909F8D2246C04AD1CABDC07833C0C616821C942246C062D68BA19C7833C06A12BC218D2246C00AD6389B8E7833C0E109BDFE242246C08CBD175FB47733C08369183E222246C0AF0B3F389F7633C07C9BFEEC472246C0180B43E4F47533C0A7B393C1512246C0BB2BBB60707533C0F59CF4BEF12146C0D55B035B257433C0F59CF4BEF12146C0D55B035B257433C0F59CF4BEF12146C0D55B035B257433C0EB56CF49EF2146C07A8B87F71C7433C0EB56CF49EF2146C07A8B87F71C7433C0EB56CF49EF2146C07A8B87F71C7433C0A33CF372D82146C0C0046EDDCD7333C04C6C3EAE0D2146C075CAA31B617133C07670B037312046C0EE06D15AD16E33C064AF777FBC1F46C02D5F97E13F6D33C0D7BE805EB81F46C07573F1B73D6D33C05776C1E09A1F46C0EDBAB722316D33C0252367614F1F46C0C5FEB27BF26C33C03A92CB7F481F46C0E9D495CFF26C33C00A664CC11A1F46C0999B6F44F76C33C00A664CC11A1F46C0999B6F44F76C33C00A664CC11A1F46C0999B6F44F76C33C00A664CC11A1F46C058ACE122F76C33C00A664CC11A1F46C058ACE122F76C33C00A664CC11A1F46C058ACE122F76C33C00A664CC11A1F46C058ACE122F76C33C00A664CC11A1F46C058ACE122F76C33C00A664CC11A1F46C058ACE122F76C33C0C976BE9F1A1F46C058ACE122F76C33C0C976BE9F1A1F46C058ACE122F76C33C0C976BE9F1A1F46C058ACE122F76C33C0C976BE9F1A1F46C058ACE122F76C33C0C976BE9F1A1F46C058ACE122F76C33C0C976BE9F1A1F46C058ACE122F76C33C0C976BE9F1A1F46C016BD5301F76C33C0C976BE9F1A1F46C016BD5301F76C33C0C976BE9F1A1F46C016BD5301F76C33C0CD1E6805861E46C059147651F46C33C01F2FA4C3431E46C00ABE69FAEC6C33C019726C3D431E46C097AE601BF16C33C0D1915CFE431E46C0A0C03BF9F46C33C068EBE0606F1E46C092054CE0D66D33C02DEDD45C6E1E46C0852348A5D86D33C0DBFAE93F6B1E46C0A9F92AF9D86D33C0003961C2681E46C0F8325184D46D33C0EB8F300C581E46C076C3B645996D33C0166EF9484A1E46C0F10F5B7A346D33C0166EF9484A1E46C0F10F5B7A346D33C0166EF9484A1E46C0F10F5B7A346D33C0F9BCE2A9471E46C0E9482EFF216D33C0F9BCE2A9471E46C0E9482EFF216D33C0F9BCE2A9471E46C0E9482EFF216D33C0CC9A58E02B1E46C04EECA17DAC6C33C001FA7DFFE61D46C0265646239F6B33C0AC72A1F2AF1D46C0EB1ED95C356B33C0AC72A1F2AF1D46C0EB1ED95C356B33C0AC72A1F2AF1D46C0EB1ED95C356B33C084471B47AC1D46C0008E3D7B2E6B33C084471B47AC1D46C0008E3D7B2E6B33C084471B47AC1D46C0008E3D7B2E6B33C08CA03193A81D46C015FDA199276B33C0C11C3D7E6F1D46C050C24CDBBF6A33C0569A94826E1D46C0FD3383F8C06A33C0A56B26DF6C1D46C08FE1B19FC56A33C0909F8D5C371D46C05B0C1EA67D6B33C088635DDC461D46C06C76A4FACE6B33C088635DDC461D46C06C76A4FACE6B33C088635DDC461D46C06C76A4FACE6B33C0CD3FFA264D1D46C0252191B6F16B33C0CD3FFA264D1D46C0252191B6F16B33C0CD3FFA264D1D46C0252191B6F16B33C0F302ECA3531D46C0B98D06F0166C33C087C09140831D46C06AA2CF47196D33C087C09140831D46C06AA2CF47196D33C087C09140831D46C06AA2CF47196D33C03E78EDD2861D46C0F54718062C6D33C03E78EDD2861D46C0F54718062C6D33C03E78EDD2861D46C0F54718062C6D33C00B24287E8C1D46C0D9EDB3CA4C6D33C08B321B64921D46C0DD990986736D33C028D53E1D8F1D46C07BC1A739796D33C0F0A65B76881D46C022FB20CB826D33C0F0A65B76881D46C022FB20CB826D33C0F0A65B76881D46C022FB20CB826D33C06552431B801D46C0C30FCEA78E6D33C06552431B801D46C0C30FCEA78E6D33C06552431B801D46C0C30FCEA78E6D33C01E32E543501D46C0A9F92AF9D86D33C01E32E543501D46C0A9F92AF9D86D33C01E32E543501D46C0A9F92AF9D86D33C08FA50F5D501D46C02CD8463CD96D33C08FA50F5D501D46C02CD8463CD96D33C08FA50F5D501D46C02CD8463CD96D33C022365838491D46C0FDA4DAA7E36D33C024986A662D1D46C0E1CFF0660D6E33C024986A662D1D46C0E1CFF0660D6E33C024986A662D1D46C0E1CFF0660D6E33C04CA60A46251D46C0BE16F4DE186E33C04CA60A46251D46C0BE16F4DE186E33C04CA60A46251D46C0BE16F4DE186E33C03F6F2A52611C46C087C1FC15326F33C0780C8FFD2C1C46C0077E54C37E6F33C0780C8FFD2C1C46C0077E54C37E6F33C0780C8FFD2C1C46C0077E54C37E6F33C0780C8FFD2C1C46C0486DE2E47E6F33C0780C8FFD2C1C46C0486DE2E47E6F33C0780C8FFD2C1C46C0486DE2E47E6F33C078B5DC99091C46C0F452B131AF6F33C078B5DC99091C46C0F452B131AF6F33C078B5DC99091C46C0F452B131AF6F33C01990BDDEFD1B46C05D8AABCABE6F33C01990BDDEFD1B46C05D8AABCABE6F33C01990BDDEFD1B46C05D8AABCABE6F33C01C261AA4E01B46C02EAEF199EC6F33C09626A5A0DB1B46C017BA1281EA6F33C00936AE7FD71B46C064062AE3DF6F33C0C3D4963AC81B46C05859DB148F6F33C0033FAA61BF1B46C033C4B12E6E6F33C0033FAA61BF1B46C033C4B12E6E6F33C0033FAA61BF1B46C033C4B12E6E6F33C0C4EBFA05BB1B46C0912A8A57596F33C0C4EBFA05BB1B46C0912A8A57596F33C0C4EBFA05BB1B46C0912A8A57596F33C04D1421753B1B46C0327216F6B46B33C0A9A5B915C21A46C0878A71FE266833C04E61A5828A1A46C00DA661F8886433C068942EFD4B1A46C0A4C343183F6133C08A027D224F1A46C0711E4E603A6133C0D503E621531A46C0234DBC033C6133C0F2B4FCC0551A46C0F0C4AC17436133C057975302621A46C0C4CE143AAF6133C0
\.


--
-- TOC entry 3712 (class 0 OID 21552)
-- Dependencies: 215
-- Data for Name: routes_busstops; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.routes_busstops (id, id_routes, id_bus_stops) FROM stdin;
\.


--
-- TOC entry 3557 (class 0 OID 20833)
-- Dependencies: 207
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
\.


--
-- TOC entry 3706 (class 0 OID 16397)
-- Dependencies: 204
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: me
--

COPY public.users (id, name, email) FROM stdin;
1	Jerry	jerry@example.com
2	George	george@example.com
\.


--
-- TOC entry 3720 (class 0 OID 0)
-- Dependencies: 212
-- Name: bus_stop_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bus_stop_sequence', 93, true);


--
-- TOC entry 3721 (class 0 OID 0)
-- Dependencies: 205
-- Name: route_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.route_seq', 2, true);


--
-- TOC entry 3722 (class 0 OID 0)
-- Dependencies: 214
-- Name: routes_busstops_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.routes_busstops_id_seq', 1, false);


--
-- TOC entry 3723 (class 0 OID 0)
-- Dependencies: 203
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: me
--

SELECT pg_catalog.setval('public.users_id_seq', 2, true);


--
-- TOC entry 3569 (class 2606 OID 21549)
-- Name: bus_stops bus_stops_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bus_stops
    ADD CONSTRAINT bus_stops_pk PRIMARY KEY (id);


--
-- TOC entry 3571 (class 2606 OID 21556)
-- Name: routes_busstops routes_busstops_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.routes_busstops
    ADD CONSTRAINT routes_busstops_pk PRIMARY KEY (id);


--
-- TOC entry 3567 (class 2606 OID 21538)
-- Name: routes routes_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.routes
    ADD CONSTRAINT routes_pk PRIMARY KEY (id);


--
-- TOC entry 3563 (class 2606 OID 16402)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: me
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3573 (class 2606 OID 21562)
-- Name: routes_busstops bus_stops_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.routes_busstops
    ADD CONSTRAINT bus_stops_fk FOREIGN KEY (id_bus_stops) REFERENCES public.bus_stops(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3572 (class 2606 OID 21557)
-- Name: routes_busstops routes_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.routes_busstops
    ADD CONSTRAINT routes_fk FOREIGN KEY (id_routes) REFERENCES public.routes(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


-- Completed on 2019-12-23 18:05:03

--
-- PostgreSQL database dump complete
--
