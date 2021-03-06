USE [master]
GO
/****** Object:  Database [StockExchanges]    Script Date: 5/1/2019 8:21:41 PM ******/
CREATE DATABASE [StockExchanges]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'StockExchanges', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\StockExchanges.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'StockExchanges_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\StockExchanges_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [StockExchanges] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [StockExchanges].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [StockExchanges] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [StockExchanges] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [StockExchanges] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [StockExchanges] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [StockExchanges] SET ARITHABORT OFF 
GO
ALTER DATABASE [StockExchanges] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [StockExchanges] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [StockExchanges] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [StockExchanges] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [StockExchanges] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [StockExchanges] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [StockExchanges] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [StockExchanges] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [StockExchanges] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [StockExchanges] SET  ENABLE_BROKER 
GO
ALTER DATABASE [StockExchanges] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [StockExchanges] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [StockExchanges] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [StockExchanges] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [StockExchanges] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [StockExchanges] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [StockExchanges] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [StockExchanges] SET RECOVERY FULL 
GO
ALTER DATABASE [StockExchanges] SET  MULTI_USER 
GO
ALTER DATABASE [StockExchanges] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [StockExchanges] SET DB_CHAINING OFF 
GO
ALTER DATABASE [StockExchanges] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [StockExchanges] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [StockExchanges] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'StockExchanges', N'ON'
GO
ALTER DATABASE [StockExchanges] SET QUERY_STORE = OFF
GO
USE [StockExchanges]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 5/1/2019 8:21:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 5/1/2019 8:21:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[CreatedBy] [nvarchar](256) NULL,
	[UpdatedDate] [datetime2](7) NOT NULL,
	[UpdatedBy] [nvarchar](256) NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 5/1/2019 8:21:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[CreatedBy] [nvarchar](256) NULL,
	[UpdatedDate] [datetime2](7) NOT NULL,
	[UpdatedBy] [nvarchar](256) NULL,
	[Title] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NOT NULL,
	[PostId] [int] NOT NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Post]    Script Date: 5/1/2019 8:21:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Post](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[CreatedBy] [nvarchar](256) NULL,
	[UpdatedDate] [datetime2](7) NOT NULL,
	[UpdatedBy] [nvarchar](256) NULL,
	[Slug] [nvarchar](max) NULL,
	[ShortDescription] [nvarchar](max) NULL,
	[Content] [nvarchar](max) NOT NULL,
	[ThumbnailImage] [nvarchar](max) NULL,
	[CategoryId] [int] NOT NULL,
 CONSTRAINT [PK_Post] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20190501130008_Create_Database', N'2.1.4-rtm-31024')
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Id], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [Name], [Description]) VALUES (1, CAST(N'2018-11-11T10:34:09.0000000' AS DateTime2), N'1', CAST(N'2018-11-11T10:34:09.0000000' AS DateTime2), N'1', N'Bitcoin News', N'Bitcoin News')
INSERT [dbo].[Category] ([Id], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [Name], [Description]) VALUES (2, CAST(N'2018-11-11T10:34:09.0000000' AS DateTime2), N'1', CAST(N'2018-11-11T10:34:09.0000000' AS DateTime2), N'1', N'Ethereum News', N'Ethereum News')
INSERT [dbo].[Category] ([Id], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [Name], [Description]) VALUES (3, CAST(N'2018-11-11T10:34:09.0000000' AS DateTime2), N'1', CAST(N'2018-11-11T10:34:09.0000000' AS DateTime2), N'1', N'Altcoin News', N'Altcoin News')
INSERT [dbo].[Category] ([Id], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [Name], [Description]) VALUES (4, CAST(N'2018-11-11T10:34:09.0000000' AS DateTime2), N'1', CAST(N'2018-11-11T10:34:09.0000000' AS DateTime2), N'1', N'Blockchain News', N'Blockchain News')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Comment] ON 

INSERT [dbo].[Comment] ([Id], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [Title], [Description], [PostId]) VALUES (4, CAST(N'2018-11-11T11:34:09.0000000' AS DateTime2), N'1', CAST(N'2018-11-11T11:34:09.0000000' AS DateTime2), N'1', N'tile 1', N'Similar to most of the major currencies, Bitcoin (BTC) is seeing mixed signals with its price fluctuating around $6,400 as of press time', 3)
INSERT [dbo].[Comment] ([Id], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [Title], [Description], [PostId]) VALUES (5, CAST(N'2018-11-11T11:35:09.0000000' AS DateTime2), N'1', CAST(N'2018-11-11T11:34:09.0000000' AS DateTime2), N'1', N'tile 1', N'During this week, the top cryptocurrency had its main peak on Wednesday, Nov. 7, trading over $6,500 at the time, and then mildly declining by the end of the week.', 3)
INSERT [dbo].[Comment] ([Id], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [Title], [Description], [PostId]) VALUES (6, CAST(N'2018-11-11T11:36:09.0000000' AS DateTime2), N'1', CAST(N'2018-11-11T11:34:09.0000000' AS DateTime2), N'1', N'tile 1', N'The second largest currency, Ethereum (ETH), is in the green after several days of decline throughout the week, trading at around $212 at press time.', 3)
SET IDENTITY_INSERT [dbo].[Comment] OFF
SET IDENTITY_INSERT [dbo].[Post] ON 

INSERT [dbo].[Post] ([Id], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [Slug], [ShortDescription], [Content], [ThumbnailImage], [CategoryId]) VALUES (3, CAST(N'2018-11-11T11:35:09.0000000' AS DateTime2), N'1', CAST(N'2018-11-11T11:36:09.0000000' AS DateTime2), N'1', N'1', N'93% of Brits Have Heard of Bitcoin, but Only 4% Have Bought It, Survey Shows', N'The vast majority of British people - 93 percent - have heard of Bitcoin (BTC), but only 4 percent claim to have bought it, according to a recent poll by UK market research company YouGov published Nov. 7.
According to the survey, conducted this month, nine out of ten Brits have heard of Bitcoin, however, they report not understanding it. Only 4 percent of those surveyed claimed they understand Bitcoin “very well,” while 23 percent state they know it “fairly well,” with men almost three times as likely as women to say so (33 percent against 12 percent). Younger Brits prevail among those who claimed to understand Bitcoin, the report states.

In terms of actual investments in Bitcoin, younger citizens are also in first place. One in eleven (9 percent) of British 18 to 24 year olds have purchased Bitcoin, in comparison to one in a hundred (1 percent) for people over 55. However, overall, only 4 percent of respondents have purchased Bitcoin, with the gender break down significantly more male – 6 percent of men, compared to 1 percent of women surveyed.

Additionally, a significant number of young people, 36 percent of those surveyed in the 18 to 24 year old range, claim they personally know someone who has bought Bitcoin before.

Bitcoin buyers most likely to be 18 to 24 years old

Source: yougov.com

The German Consumer Centers of two federal states, Hesse and Saxony, have recently conducted a similar survey. Out of 1,000 Germans between the ages of 18 and 39 polled, 55 percent claimed they have heard of cryptocurrencies before. Further, 28 percent of respondents from 18 to 29 found purchasing cryptocurrencies to be “conceivable.”', N'1', 1)
INSERT [dbo].[Post] ([Id], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [Slug], [ShortDescription], [Content], [ThumbnailImage], [CategoryId]) VALUES (4, CAST(N'2018-11-11T11:36:09.0000000' AS DateTime2), N'1', CAST(N'2018-11-11T11:37:09.0000000' AS DateTime2), N'1', N'1', N'U.S. Law Firm Files Claims Against AT&T, T-Mobile Over SIM Swap-Enabled Crypto Thefts', N'Venture capital investor Tim Draper reaffirmed his prediction that the Bitcoin (BTC) price will reach $250,000 by 2022, during a panel discussion at the Web Summit summit conference Nov. 6

Draper initially predicted that the BTC price will surge up to $250,000 in April of this year. “Believe it, it’s going to happen – they’re going to think you’re crazy but believe it, it’s happening, it’s going to be awesome!,” Draper said then.

When asked at the recent Web Summit conference whether he still thinks the BTC price will experience a 40 times return in a span of four years and reach $250,000, Draper said:

“Yes. We are talking [...] about five percent market share to get to $250,000. That seems like a drop in a bucket and all we need to really do is make it so that Bitcoin can be used to buy Starbucks coffee, and all of a sudden the world just opens up and then they say ‘I’ve got this choice.’ [...] Do I want a currency that I can take from country to country [...] or do I want one that sticks me in one country or one geographic area and I can’t use it anywhere else?”

Draper also questioned the need for fiat currencies or “political currencies,” stating “why do we even trust currencies that are determined by some weird political party or another?” In Draper’s view, banks issue money “whenever they feel like it for whatever reason they want it,” and the emergence of a “totally apolitical,” global, and open currency would cede control of money from banks to common people, he explained.

Speaking at the GovTech Pioneers conference in May, Draper presented his vision of a future in which blockchain utilizing smart contracts in conjunction with artificial intelligence (AI) will massively change the role and responsibilities of states. "If we combine Bitcoin, blockchain with smart contracts and artificial intelligence, we could create the perfect bureaucracy," he said.

In September, Draper made another prediction, saying that the total cryptocurrency market capitalization will hit $80 trillion in the next 15 years. Draper argued that the significant slide in the cryptocurrency market in previous months is attributed to people who had not adopted digital currencies as a new asset class. Draper said then:

“Cryptocurrency will go after trillion dollar markets — these are finance, healthcare and insurance, banking and investment banking, and governments.”', N'1', 1)
INSERT [dbo].[Post] ([Id], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [Slug], [ShortDescription], [Content], [ThumbnailImage], [CategoryId]) VALUES (5, CAST(N'2018-11-11T11:40:09.0000000' AS DateTime2), N'1', CAST(N'2018-11-11T11:40:09.0000000' AS DateTime2), N'1', N'2', N'Ethereum’s Joe Lubin: Blockchain Will ‘Take a Little Longer’ to Develop Than the Web', N'Blockchain will “probably take a little longer” to develop than the internet, because it is “much more complicated,” ConsenSys creator Joseph Lubin told German media outlet t3n in an interview, Cointelegraph auf Deutsch reported Nov. 9.
Lubin, who is also the co-founder of Ethereum (ETH), told reporters that blockchain technology is developing in a similar way to the web, citing its exponential growth with “hundreds of projects that are already practical for humans” to date.

Based on blockchain’s use case for decentralized cryptocurrencies, the digital entrepreneur also suggested that distributed ledger technology (DLT) will be able to “permeate society more than the Internet” and enable a decentralized internet, or Web3. Lubin, however, forecast that the adoption of blockchain on a mass scale will take longer than that of the internet:

“[Blockchain projects] will enable people to build more things that will come in handy again. That''s how the web was developed. It will probably take a little longer, because it is much more complicated. Also, because we work on topics such as digital money, Blockchain will permeate society more than the Internet. Everything will be networked in a Web3.”

In the interview, Lubin stressed the fact that ConsenSys – an Ethereum-focused startup incubator and infrastructure development firm – was “born” prior to the release of Ethereum, with the goal of building the tools and infrastructure to enable a decentralized “ecosystem” in which Ethereum could function.

 Lubin also emphasized that the firm is interested in bringing that ecosystem forward rather than “controlling” it:

“We [ConsenSys] do many things, but we are not interested in controlling the ecosystem. We are interested in promoting the ecosystem.”

Addressing the question of the Ethereum ecosystem’s decentralization, Lubin retorted “[d]o you expect it to be fully mature, three years after its creation?”

When asked about how the dynamics of the current internet could be transformed in Web3, Lubin shrugged off a comparison between ConsenSys and major internet giants like Facebook and Google, insteading pointing to “IBM and Microsoft, Accenture and Deloitte” as possible centralizing forces in blockchain.

Lubin also stated that the principle business models of the internet today are contradictory to the nature of blockchain, which “enables a self-determined, sovereign identity.”

Earlier this year, Lubin predicted that the global community is moving towards a world based on “decentralized governance,” supporting the idea that major cryptocurrency Bitcoin (BTC) is likely to remain the world’s “digital gold,” while Ethereum would serve as a “fuel” for decentralized ecosystems.', N'1', 2)
INSERT [dbo].[Post] ([Id], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [Slug], [ShortDescription], [Content], [ThumbnailImage], [CategoryId]) VALUES (6, CAST(N'2018-11-11T11:41:09.0000000' AS DateTime2), N'1', CAST(N'2018-11-11T11:41:09.0000000' AS DateTime2), N'1', N'2', N'ETH Zero-Proof Prototype Models: Has Ernst & Young Done What Ethereum Could Not?', N'Multinational auditing and consulting firm, Ernst & Young (EY), announced on October 30 the launch of their EY Ops Chain Public Edition (PE) prototype, the world''s first implementation of zero-knowledge proof (ZKP) technology on the public Ethereum blockchain.

This system aims to overcome three main barriers of current transactions and asset transfers on a public blockchain:

The ability for companies to conduct secure transactions on a public network;
Lower some of the barriers to more widespread blockchain adoption; and
Enable a full traceability trail of private transactions.
Although still only a prototype version, and set for live production offering in 2019, this technology could prove hugely significant.

To consider this in greater detail it’s useful to first look at the difference between public and private blockchains and what zero-knowledge proofs are exactly.

Public blockchains versus private blockchains
The biggest difference between public and private blockchains lies in who is allowed to join and participate in the network.

Public blockchains are open to everyone and anyone can, theoretically, join the network, download the protocol, and read and write transactions on its decentralized network. The most well-known public blockchains are Bitcoin and Ethereum. Transactions are verified by thousands upon thousands of independent computers around the world, or nodes, to maintain an ecosystem of trustless consensus. The more decentralized the network is, the more secure and resilient it becomes.

However, this security comes at a cost. Each transaction has to be confirmed by every node and to reach consensus, nodes have to perform resource-intensive calculations to solve complicated cryptographic equations, also known as proof-of-work. This decreases transaction times and increases transaction costs, significantly reducing reliability during times of high network activity.

As a result, scalability has long been recognized as one of the biggest barriers to widespread enterprise adoption of public blockchains.

Another problem of public blockchains is privacy. Transactions on a public network can’t initially be linked to the person behind them but transaction information, such as amount, date, sender and receiver address is publically available for anyone who has access to the network. Pseudonymous addresses can be tracked and followed until the user transacts over a centralized cryptocurrency exchange, at which point their real identity is compromised.

Private blockchains, on the other hand, are only open to parties who have been invited to join the closed network. They are also referred to as permissioned blockchains because to become a network participant, the user will have to be granted permission by the network starter through a set of rules or conditions.

A fully private blockchain is where write permissions are usually controlled by one organization, while private blockchains can also take the form of a consortium, where consensus is reached through a group of pre-selected nodes.

Private and consortium blockchain networks are well-suited to enterprise adoption, especially in the finance industry, because transactions are private and only visible to the limited amount of network participants.

Examples of private and consortium blockchain networks include Hyperledger, private blockchain infrastructure, and R3, a global banking and financial institution blockchain consortium based on their distributed ledger technology product, Corda.

Once again, this privacy of private blockchains comes at a cost. The network is less decentralized and therefore less secure and less resilient to attacks.

Zero-knowledge Proofs (ZKP)
Zero-knowledge proofs have been defined in a 1988 published paper by researchers from MIT and the University of Toronto as “those proofs that convey no additional knowledge other than the correctness of the proposition in questions.”

In cryptography and the blockchain world, ZKP is known as a method that allows one party to prove to another party that a statement is true without giving up any additional information. There are three aspects to ZKPs:

Completeness - if the statement is true, an honest verifier will be convinced by an honest prover;
Soundness - if the statement is false, no dishonest prover can convince an honest verifier; and
Zero-knowledge - if the statement is true, no dishonest verifier learns anything other than the fact that the statement is true.
Application to blockchain
ZKPs allow for greater privacy on public blockchains by enabling nodes, or network participants, to verify the existence and validity of transactions, and therefore maintain distributed consensus, without actually being able to see or make public any of the transaction details, guaranteeing privacy.

This is why the EY Ops Chain PE prototype is so significant. Public blockchains typically offer better security and liquidity through greater decentralization, while private blockchains offer complete protection of customer information.

The EY solution, through the usage of ZKPs, allows the company to harnesses the security and resilience of a public blockchain, such as Ethereum, keeping the consensus algorithm intact, maintaining complete privacy over transaction information and, therefore, leveraging the benefits of both worlds.

According to Paul Brody, EY Global Innovation Leader, Blockchain, this is exactly the desired outcome.

"EY Ops chain PE is a first-of-its-kind application and a major step forward that empowers blockchain adoption. Private blockchains give enterprises transaction privacy, but at the expense of reduced security and resiliency. With zero-knowledge proofs, organizations can transact on the same network as their competition in complete privacy and without giving up the security of the public Ethereum blockchain."

Moreover it could fuel growth in enterprise blockchain adoption by “greatly reducing the expensive and time-consuming process of setting up private networks and on-boarding business partners one at a time."

James Wester, research director of Worldwide Blockchain Strategies at International Data Corporation (IDC), a global provider of market intelligence and advisory services, agrees that the application of ZKP’s to public blockchains will encourage growth and enterprise adoption.

"The development of tools that enhance the capabilities of public blockchains will spur enterprise adoption of public blockchains and are crucial to the growth of blockchain technologies in general. The ability to ensure privacy while retaining the security and resilience of public blockchains is an important consideration. It offers an opportunity for enterprises to begin building real-world solutions on public blockchains and is an important step in the evolution of the technology."

Ethereum’s efforts at zero-knowledge proof prototypes
Ethereum has long been looking at using a version of the ZKP protocol, called Zero-Knowledge Succinct Non-Interactive Argument of Knowledge (ZK-SNARK), pioneered by ZCash, as part of the Byzantium upgrade which, in turn, is part of the Metropolis hard fork.

Vitalik Buterin, co-founder of Ethereum, also more recently stated in an ETH Research post that the network could potentially scale to 500 transactions per second by using ZK-SNARK to mass-validate transactions.

However, he admitted that ZK-SNARK transactions on the Ethereum blockchain would be very expensive and computationally intensive, perhaps insinuating that it’s not quite ready yet for mainstream enterprise adoption.

“FWIW [For what it is worth] I do agree this whole thing is expensive in terms of prover time, though given that I expect the relayers will be GPU farms so it’s less of an issue than it is in, say, Zcash where regular nodes need to be able to make proofs in a few seconds.”

Another issue of ZK-SNARK transactions on the Ethereum blockchain, according to a white paper released by members of the Blockchain team from multinational Dutch bank, ING,  – who also launched a zero-knowledge tool – is that it is notably less efficient.

“ZK-SNARKS are generic; they can verify any function which is particularly relevant for Ethereum which provides the Turing-complete EVM, allowing developers to build any type of logic. Generic ZKPs like ZK-SNARKs, however, come at a price. They are notably less efficient than specific zero-knowledge proofs.”

Detailed technical information is still not available on EY’s Ops Chain PE system but the press release specifically stated that the technology will allow companies to privately and securely create and sell product and service tokens on a public blockchain with private access to their transaction records without breaking the consensus algorithm, i.e. Ethereum’s proof of work consensus algorithm remains intact.

Were E&Y able to do what Ethereum could not, that is, to come up with a scalable, cost-effective solution to private transactions and asset transfers on a secure and resilient public blockchain? E&Y’s positive comments in their press release about enabling growth in enterprise public blockchain adoption would suggest that they did.

A number of questions still remain open: whether E&Y’s ZKP solution is more specific to overcome the barriers of Ethereum’s more generic proposal of using ZK-SNARKS for private transactions, and if so, how would it be different to the ZK-SNARK protocol.', N'1', 2)
INSERT [dbo].[Post] ([Id], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [Slug], [ShortDescription], [Content], [ThumbnailImage], [CategoryId]) VALUES (7, CAST(N'2018-11-11T11:44:09.0000000' AS DateTime2), N'1', CAST(N'2018-11-11T11:44:09.0000000' AS DateTime2), N'1', N'3', N'Israel’s Central Bank ‘Not Recommended’ to Issue Own Digital Currency', N'An Israeli study group exploring digital currency options has recommended that the country’s central bank not issue its own token, a press release confirmed Nov. 6.
The interdepartmental team, set up in November 2017 by the governor of the Bank of Israel to “examine the issue of central bank digital currencies [CBDCs],” revealed its findings in a full report this week.

“Central banks around the world are examining the possibility of issuing digital currency and/or using distributed technologies in the payment systems, but no advanced economy has yet issued digital currency for broad use,” it summarizes, adding:

“The team does not recommend that the Bank of Israel issue digital currency in the near future. It is necessary to continue examining the field and to follow developments around the world before there are proper grounds for a decision to recommend issuing digital currency.”

The result comes as little surprise for the banking sector, multiple jurisdictions including the European Union similarly deciding this year that the atmosphere was not conducive to launching a central bank digital asset for the time being.

In a communique in September, the European Central Bank highlighted the continued popularity of cash and a lack of full risk assessment as key factors behind its decision.

However, a Cointelegraph analysis of the possibilities for CBDCs showed that the People’s Bank of China (PBoC) has been actively looking into the technology, as well as the Bank of Canada and Sweden’s central bank.

Israel has continued to adopt a proactive approach to cryptocurrency more generally this year, with the Supreme Court in February preventing banks from deliberately jettisoning ties with industry businesses.', N'1', 3)
INSERT [dbo].[Post] ([Id], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [Slug], [ShortDescription], [Content], [ThumbnailImage], [CategoryId]) VALUES (8, CAST(N'2018-11-11T11:45:09.0000000' AS DateTime2), N'1', CAST(N'2018-11-11T11:45:09.0000000' AS DateTime2), N'1', N'3', N'Texas Regulator Issues Cease and Desist Order to Cloud Mining Company', N'The Texas State Securities Board has issued an emergency cease and desist order to an Australia-based cloud mining company AWS Mining PTY LTD for selling unregistered securities, according to an official notice filed Nov. 6.

Per the document, AWS Mining along with its multiple agents and Chief Marketing Officer Josiah Kostek have violated the Texas Securities Act by luring the state’s residents in purchasing AWS’ unregistered cloud mining power contracts and promising a “200 percent passive return on every investment.” The company’s website also reportedly offers investors to join a multi-level marketing matrix for $20, after which they could earn commissions by operating as sales agents.

AWS allegedly shirked its commitments to pay out the promised profit, stating that “investors assume the risks associated with the investment.” AWS failed to register as a securities broker-dealer, and moreover, crypto mining power contracts have not been registered and qualified for sale in Texas.

The firm purportedly required investors to secure a digital currency wallet provided by MyCoinDeal to participate in AWS’ crypto mining program, wherein the wallet developers required investors to pay fees for deployment of their wallets and conduct transactions within it.

According to the order, the defendants intentionally failed to disclose that AWS Mining PTY is the business name holder of MyCoinDeal. AWS also allegedly withheld information about its methodology for storing cryptocurrencies, and its means of accounting and implementing security protocols for customer protection from malicious attacks.

The defendants allegedly did not disclose their business data and qualifications, such as their background in selling securities to investors and dealing with cryptocurrencies, nor the commissions they would receive for selling crypto mining power contracts.

AWS now has 31 days to request a hearing with the Securities Commissioner, otherwise the order will become final and non-appealable.

Previously, the Texas State Securities Board issued an emergency cease and desist order to a network of cryptocurrency-related firms, that allegedly offered fraudulent crypto investments to state residents. According to the order, the companies were immediately suspended from offering securities in Texas until the security is registered or exempt.', N'1', 3)
INSERT [dbo].[Post] ([Id], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [Slug], [ShortDescription], [Content], [ThumbnailImage], [CategoryId]) VALUES (9, CAST(N'2018-11-11T11:46:09.0000000' AS DateTime2), N'1', CAST(N'2018-11-11T11:46:09.0000000' AS DateTime2), N'1', N'4', N'Private Blockchains Could Be Compatible with EU Privacy Rules, Research Shows', N'Private blockchains, such as interbanking platforms set to share information on customers,  could be compatible with new E.U. privacy rules, according to research published Nov. 6. The study was conducted by Queen Mary University of London and the University of Cambridge, U.K.
The General Data Protection Regulation (GDPR) act, a recent legislation that regulates the storage of personal data for all individuals within the European Union, came into effect this May. According to the law, all data controllers have to respect citizens’ rights in terms of keeping and transferring their private information. In case a data controller fails to do so, the potential fines are set as €20 million (about $22 million) or four percent of global turnover/revenues, whichever is higher.

The recent U.K. study, published in the Richmond Journal of Law and Technologies, views blockchain and its nodes through the length of GDPR. According to the researchers, crypto-related technologies could fall under these rules and be treated as “controllers,” given that they publicly store private information about E.U. citizens in the chain and allow third parties to operate it. This, the study reveals, might slow down technology implementation in EU:

“There is a risk that this legal uncertainty will have a chilling effect on innovation, at least in the EU and potentially more broadly. For example, if all nodes and miners of a platform were to be deemed joint controllers, they would have joint and several liability, with potential penalties under the GDPR.”

However, the researchers emphasize that blockchain operators could be treated like “processors” instead, the same as the companies behind cloud technologies who act on behalf of users rather than control their data. This, the study continues, is mostly applicable for Blockchain-as-a-Service (BaaS) offerings, where a third party provides the supporting infrastructure for the network while users store their data and control it personally.

As an example for such type of blockchain platform, the researchers cite centralized platforms for land registry and private interbanking solutions that set up “a closed, permissioned blockchain platform with a small number of trusted nodes.” Such closed systems could effectively comply with GDPR rules, the report continues.

To meet the privacy law, blockchain networks might also store personal data externally or allow trusted nodes to delete the private key for encrypted information, thus leaving indecipherable data on the chain, the researchers state.

However, the GDPR rules are extremely difficult to comply with for more decentralized nets, such as those concerned with mining and cryptocurrency. In this case, the nodes, operating with the data of E.U. citizens, might agree to fork a new version of the blockchain from time to time, thus reflecting mass requests for rectification or erasure. “However, in practice, this level of coordination may be difficult to achieve among potentially thousands of nodes,” the study reads.

As a conclusion, the researchers urge the European Data Protection Board, an independent regulatory body behind GDPR, to issue clearer guidance on the application of data protection law to various common blockchain models.

As Cointelegraph wrote earlier, the GDPR could both support and harm blockchain. Despite the fact that current E.U. legislation partially has the same goals as crypto-related technologies, such as decentralizing data control, blockchain companies could also face extremely high fees as data controllers.

Follow us on', N'1', 4)
INSERT [dbo].[Post] ([Id], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [Slug], [ShortDescription], [Content], [ThumbnailImage], [CategoryId]) VALUES (10, CAST(N'2018-11-11T11:47:09.0000000' AS DateTime2), N'1', CAST(N'2018-11-11T11:47:09.0000000' AS DateTime2), N'1', N'4', N'Singapore Exchange Successfully Trials Blockchain for Tokenized Assets Settlement', N'Singapore Exchange Limited (SGX), along with the Monetary Authority of Singapore (MAS), have successfully tested the use of blockchain technology for tokenized assets settlement, according to a SGX release issued Sunday, Nov. 11.
The report reveals the data on the trial that began in August, shortly after MAS and SGX had partnered with U.S. stock market Nasdaq, “big four” consulting company Deloitte, and Singaporean tech company Anquan. As per the release, the partners have developed a blockchain-driven solution for Delivery versus Payment (DvP) capabilities — a settlement procedure where the buyer''s payment for securities is due at the time of delivery.

The trial has shown that financial institutions and corporate investors are able to carry out the exchange and final settlement of tokenized assets on different blockchain platforms simultaneously. SGX believes that this could increase operational efficiency and reduce settlement risks. Moreover, the technology could further help automate DvP settlement processes by using smart contracts, the report concludes.

Tinku Gupta, Head of Technology at SGX, also revealed that the exchange has filed its first-ever patent:

“Based on the unique methodology that SGX developed to enable real-world interoperability of platforms, as well as the simultaneous exchange of digital tokens and securities, we have applied for our first-ever technology patent.”

As Cointelegraph has frequently reported, Singapore-based companies are actively testing blockchain solutions in different areas.

For example, in July, local government-owned service provider CrimsonLogic unveiled its cross-border blockchain network for global trade in order to boost the efficiency of trade corridors between China and the Association of Southeast Asian Nations (ASEAN) nations. And in October, a major corporation providing electricity and gas transmission in Singapore, SP Group, launched a blockchain-powered renewable energy certificate marketplace to buy and sell solar energy worldwide.

In late October, Nasdaq also won a U.S. patent for a smart-contract based information release system, which would allow to keep data safe before the issue. The stock market is awaiting decisions for other blockchain-related patents as well.

Follow us on', N'1', 4)
INSERT [dbo].[Post] ([Id], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [Slug], [ShortDescription], [Content], [ThumbnailImage], [CategoryId]) VALUES (11, CAST(N'2018-11-11T11:34:09.0000000' AS DateTime2), N'1', CAST(N'2018-11-11T11:34:09.0000000' AS DateTime2), N'1', N'1', N'Tim Draper Stands by His Bitcoin Price Prediction of $250K in 2022', N'Venture capital investor Tim Draper reaffirmed his prediction that the Bitcoin (BTC) price will reach $250,000 by 2022, during a panel discussion at the Web Summit summit conference Nov. 6

Draper initially predicted that the BTC price will surge up to $250,000 in April of this year. “Believe it, it’s going to happen – they’re going to think you’re crazy but believe it, it’s happening, it’s going to be awesome!,” Draper said then.

When asked at the recent Web Summit conference whether he still thinks the BTC price will experience a 40 times return in a span of four years and reach $250,000, Draper said:

“Yes. We are talking [...] about five percent market share to get to $250,000. That seems like a drop in a bucket and all we need to really do is make it so that Bitcoin can be used to buy Starbucks coffee, and all of a sudden the world just opens up and then they say ‘I’ve got this choice.’ [...] Do I want a currency that I can take from country to country [...] or do I want one that sticks me in one country or one geographic area and I can’t use it anywhere else?”

Draper also questioned the need for fiat currencies or “political currencies,” stating “why do we even trust currencies that are determined by some weird political party or another?” In Draper’s view, banks issue money “whenever they feel like it for whatever reason they want it,” and the emergence of a “totally apolitical,” global, and open currency would cede control of money from banks to common people, he explained.', N'1', 1)
SET IDENTITY_INSERT [dbo].[Post] OFF
/****** Object:  Index [IX_Comment_PostId]    Script Date: 5/1/2019 8:21:41 PM ******/
CREATE NONCLUSTERED INDEX [IX_Comment_PostId] ON [dbo].[Comment]
(
	[PostId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Post_CategoryId]    Script Date: 5/1/2019 8:21:41 PM ******/
CREATE NONCLUSTERED INDEX [IX_Post_CategoryId] ON [dbo].[Post]
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Post_PostId] FOREIGN KEY([PostId])
REFERENCES [dbo].[Post] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Post_PostId]
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD  CONSTRAINT [FK_Post_Category_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Post] CHECK CONSTRAINT [FK_Post_Category_CategoryId]
GO
USE [master]
GO
ALTER DATABASE [StockExchanges] SET  READ_WRITE 
GO
