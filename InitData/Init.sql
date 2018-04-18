/*
	Use this script to add some initial data to the menu sample site. The script uses 
	Identity Insert, so it needs to be run after Cofoundry is initialized (first run), 
	but before any other data is added.
*/

/* ENTITY DEFINITIONS */

if (not exists (select * from Cofoundry.EntityDefinition where EntityDefinitionCode = 'COFCEV'))
	insert [Cofoundry].[EntityDefinition] ([EntityDefinitionCode], [Name]) VALUES (N'COFCEV', N'Custom Entity Version')
if (not exists (select * from Cofoundry.EntityDefinition where EntityDefinitionCode = 'COFCEB'))
	insert [Cofoundry].[EntityDefinition] ([EntityDefinitionCode], [Name]) VALUES (N'COFCEB', N'Custom Entity Version Page Block')
if (not exists (select * from Cofoundry.EntityDefinition where EntityDefinitionCode = 'COFDOC'))
	insert [Cofoundry].[EntityDefinition] ([EntityDefinitionCode], [Name]) VALUES (N'COFDOC', N'Document')
if (not exists (select * from Cofoundry.EntityDefinition where EntityDefinitionCode = 'COFIMG'))
	insert [Cofoundry].[EntityDefinition] ([EntityDefinitionCode], [Name]) VALUES (N'COFIMG', N'Image')
if (not exists (select * from Cofoundry.EntityDefinition where EntityDefinitionCode = 'COFPGE'))
	insert [Cofoundry].[EntityDefinition] ([EntityDefinitionCode], [Name]) VALUES (N'COFPGE', N'Page')
if (not exists (select * from Cofoundry.EntityDefinition where EntityDefinitionCode = 'COFPTL'))
	insert [Cofoundry].[EntityDefinition] ([EntityDefinitionCode], [Name]) VALUES (N'COFPTL', N'Page Template')
if (not exists (select * from Cofoundry.EntityDefinition where EntityDefinitionCode = 'COFPGB'))
	insert [Cofoundry].[EntityDefinition] ([EntityDefinitionCode], [Name]) VALUES (N'COFPGB', N'Page Version Block')

if (not exists (select * from Cofoundry.EntityDefinition where EntityDefinitionCode = 'COFRWR'))
	insert [Cofoundry].[EntityDefinition] ([EntityDefinitionCode], [Name]) VALUES (N'COFRWR', N'Rewrite Rule')
if (not exists (select * from Cofoundry.EntityDefinition where EntityDefinitionCode = 'COFROL'))
	insert [Cofoundry].[EntityDefinition] ([EntityDefinitionCode], [Name]) VALUES (N'COFCEV', N'Role')
if (not exists (select * from Cofoundry.EntityDefinition where EntityDefinitionCode = 'COFSET'))
	insert [Cofoundry].[EntityDefinition] ([EntityDefinitionCode], [Name]) VALUES (N'COFSET', N'Settings')
if (not exists (select * from Cofoundry.EntityDefinition where EntityDefinitionCode = 'COFUSR'))
	insert [Cofoundry].[EntityDefinition] ([EntityDefinitionCode], [Name]) VALUES (N'COFUSR', N'User (Cofoundry)')
if (not exists (select * from Cofoundry.EntityDefinition where EntityDefinitionCode = 'COFCUR'))
	insert [Cofoundry].[EntityDefinition] ([EntityDefinitionCode], [Name]) VALUES (N'COFCUR', N'User (Current)')
if (not exists (select * from Cofoundry.EntityDefinition where EntityDefinitionCode = 'COFUSN'))
	insert [Cofoundry].[EntityDefinition] ([EntityDefinitionCode], [Name]) VALUES (N'COFUSN', N'User (Non Cofoundry)')
if (not exists (select * from Cofoundry.EntityDefinition where EntityDefinitionCode = 'COFDIR'))
	insert [Cofoundry].[EntityDefinition] ([EntityDefinitionCode], [Name]) VALUES (N'COFDIR', N'Web Directory')

/* CUSTOM ENTITY DEFINITIONS */

if (not exists (select * from Cofoundry.EntityDefinition where EntityDefinitionCode = 'MNUMUL'))
	insert [Cofoundry].[EntityDefinition] ([EntityDefinitionCode], [Name]) VALUES (N'MNUMUL', N'Multi-level Menu')
if (not exists (select * from Cofoundry.[CustomEntityDefinition] where [CustomEntityDefinitionCode] = 'MNUMUL'))
	insert [Cofoundry].[CustomEntityDefinition] ([CustomEntityDefinitionCode], [ForceUrlSlugUniqueness], [IsOrderable], [HasLocale]) VALUES (N'MNUMUL', 1, 1, 0)

if (not exists (select * from Cofoundry.EntityDefinition where EntityDefinitionCode = 'MNUNST'))
	insert [Cofoundry].[EntityDefinition] ([EntityDefinitionCode], [Name]) VALUES (N'MNUNST', N'Nested Menu')
if (not exists (select * from Cofoundry.[CustomEntityDefinition] where [CustomEntityDefinitionCode] = 'MNUNST'))
	insert [Cofoundry].[CustomEntityDefinition] ([CustomEntityDefinitionCode], [ForceUrlSlugUniqueness], [IsOrderable], [HasLocale]) VALUES (N'MNUNST', 1, 1, 0)
	
if (not exists (select * from Cofoundry.EntityDefinition where EntityDefinitionCode = 'MNUSPL'))
	insert [Cofoundry].[EntityDefinition] ([EntityDefinitionCode], [Name]) VALUES (N'MNUSPL', N'Simple Menu')
if (not exists (select * from Cofoundry.[CustomEntityDefinition] where [CustomEntityDefinitionCode] = 'MNUSPL'))
	insert [Cofoundry].[CustomEntityDefinition] ([CustomEntityDefinitionCode], [ForceUrlSlugUniqueness], [IsOrderable], [HasLocale]) VALUES (N'MNUSPL', 1, 1, 0)

go

/* PAGE DIRECTORY */

set identity_insert [Cofoundry].[PageDirectory] on 
go

declare @RootPageDirectoryId int
select @RootPageDirectoryId = PageDirectoryId from Cofoundry.PageDirectory where UrlPath = ''

insert [Cofoundry].[PageDirectory] ([PageDirectoryId], [ParentPageDirectoryId], [Name], [UrlPath], [IsActive], [CreateDate], [CreatorId]) VALUES (2, @RootPageDirectoryId, N'Things To Do', N'things-to-do', 1, CAST(N'2018-04-12T16:16:25.3637000' AS DateTime2), 1)
insert [Cofoundry].[PageDirectory] ([PageDirectoryId], [ParentPageDirectoryId], [Name], [UrlPath], [IsActive], [CreateDate], [CreatorId]) VALUES (3, @RootPageDirectoryId, N'Portfolio', N'portfolio', 1, CAST(N'2018-04-12T16:16:44.2269000' AS DateTime2), 1)
insert [Cofoundry].[PageDirectory] ([PageDirectoryId], [ParentPageDirectoryId], [Name], [UrlPath], [IsActive], [CreateDate], [CreatorId]) VALUES (4, 2, N'Events', N'events', 1, CAST(N'2018-04-12T16:18:32.3762000' AS DateTime2), 1)
insert [Cofoundry].[PageDirectory] ([PageDirectoryId], [ParentPageDirectoryId], [Name], [UrlPath], [IsActive], [CreateDate], [CreatorId]) VALUES (5, 2, N'Places', N'places', 1, CAST(N'2018-04-12T16:18:46.3128000' AS DateTime2), 1)
insert [Cofoundry].[PageDirectory] ([PageDirectoryId], [ParentPageDirectoryId], [Name], [UrlPath], [IsActive], [CreateDate], [CreatorId]) VALUES (6, 4, N'Upcoming Events', N'upcoming', 0, CAST(N'2018-04-12T16:19:14.2084000' AS DateTime2), 1)
insert [Cofoundry].[PageDirectory] ([PageDirectoryId], [ParentPageDirectoryId], [Name], [UrlPath], [IsActive], [CreateDate], [CreatorId]) VALUES (7, 4, N'Past Events', N'past', 0, CAST(N'2018-04-12T16:19:45.6998000' AS DateTime2), 1)
go
set identity_insert [Cofoundry].[PageDirectory] off
go

/* PAGE */

set identity_insert [Cofoundry].[Page] on 
go
insert [Cofoundry].[Page] ([PageId], [PageDirectoryId], [LocaleId], [UrlPath], [PageTypeId], [IsDeleted], [CreateDate], [CreatorId], [CustomEntityDefinitionCode], [PublishStatusCode], [PublishDate]) VALUES (1, 1, NULL, N'', 1, 0, CAST(N'2018-04-12T16:14:47.6716000' AS DateTime2), 1, NULL, N'P', CAST(N'2018-04-12T16:14:47.6715753' AS DateTime2))
insert [Cofoundry].[Page] ([PageId], [PageDirectoryId], [LocaleId], [UrlPath], [PageTypeId], [IsDeleted], [CreateDate], [CreatorId], [CustomEntityDefinitionCode], [PublishStatusCode], [PublishDate]) VALUES (2, 1, NULL, N'about-us', 1, 0, CAST(N'2018-04-12T16:15:37.7869000' AS DateTime2), 1, NULL, N'P', CAST(N'2018-04-12T16:15:37.7868641' AS DateTime2))
insert [Cofoundry].[Page] ([PageId], [PageDirectoryId], [LocaleId], [UrlPath], [PageTypeId], [IsDeleted], [CreateDate], [CreatorId], [CustomEntityDefinitionCode], [PublishStatusCode], [PublishDate]) VALUES (3, 1, NULL, N'terms-and-conditions', 1, 0, CAST(N'2018-04-12T16:16:12.7082000' AS DateTime2), 1, NULL, N'P', CAST(N'2018-04-12T16:16:12.7082037' AS DateTime2))
insert [Cofoundry].[Page] ([PageId], [PageDirectoryId], [LocaleId], [UrlPath], [PageTypeId], [IsDeleted], [CreateDate], [CreatorId], [CustomEntityDefinitionCode], [PublishStatusCode], [PublishDate]) VALUES (4, 3, NULL, N'project-1', 1, 0, CAST(N'2018-04-12T16:17:06.7722000' AS DateTime2), 1, NULL, N'P', CAST(N'2018-04-12T16:17:06.7722047' AS DateTime2))
insert [Cofoundry].[Page] ([PageId], [PageDirectoryId], [LocaleId], [UrlPath], [PageTypeId], [IsDeleted], [CreateDate], [CreatorId], [CustomEntityDefinitionCode], [PublishStatusCode], [PublishDate]) VALUES (5, 3, NULL, N'project-2', 1, 0, CAST(N'2018-04-12T16:17:26.2933000' AS DateTime2), 1, NULL, N'P', CAST(N'2018-04-12T16:17:26.2932651' AS DateTime2))
insert [Cofoundry].[Page] ([PageId], [PageDirectoryId], [LocaleId], [UrlPath], [PageTypeId], [IsDeleted], [CreateDate], [CreatorId], [CustomEntityDefinitionCode], [PublishStatusCode], [PublishDate]) VALUES (6, 3, NULL, N'project-3', 1, 0, CAST(N'2018-04-12T16:18:07.3801000' AS DateTime2), 1, NULL, N'P', CAST(N'2018-04-12T16:18:07.3801383' AS DateTime2))
insert [Cofoundry].[Page] ([PageId], [PageDirectoryId], [LocaleId], [UrlPath], [PageTypeId], [IsDeleted], [CreateDate], [CreatorId], [CustomEntityDefinitionCode], [PublishStatusCode], [PublishDate]) VALUES (7, 1, NULL, N'privacy-policy', 1, 0, CAST(N'2018-04-12T16:20:31.4984000' AS DateTime2), 1, NULL, N'P', CAST(N'2018-04-12T16:20:31.4984004' AS DateTime2))
insert [Cofoundry].[Page] ([PageId], [PageDirectoryId], [LocaleId], [UrlPath], [PageTypeId], [IsDeleted], [CreateDate], [CreatorId], [CustomEntityDefinitionCode], [PublishStatusCode], [PublishDate]) VALUES (8, 5, NULL, N'swindon', 1, 0, CAST(N'2018-04-12T16:21:26.3991000' AS DateTime2), 1, NULL, N'P', CAST(N'2018-04-12T16:21:26.3991030' AS DateTime2))
insert [Cofoundry].[Page] ([PageId], [PageDirectoryId], [LocaleId], [UrlPath], [PageTypeId], [IsDeleted], [CreateDate], [CreatorId], [CustomEntityDefinitionCode], [PublishStatusCode], [PublishDate]) VALUES (9, 5, NULL, N'plymouth', 1, 0, CAST(N'2018-04-12T16:22:27.5535000' AS DateTime2), 1, NULL, N'P', CAST(N'2018-04-12T16:22:27.5534597' AS DateTime2))
insert [Cofoundry].[Page] ([PageId], [PageDirectoryId], [LocaleId], [UrlPath], [PageTypeId], [IsDeleted], [CreateDate], [CreatorId], [CustomEntityDefinitionCode], [PublishStatusCode], [PublishDate]) VALUES (10, 5, NULL, N'york', 1, 0, CAST(N'2018-04-12T16:23:24.9564000' AS DateTime2), 1, NULL, N'P', CAST(N'2018-04-12T16:23:24.9564308' AS DateTime2))
insert [Cofoundry].[Page] ([PageId], [PageDirectoryId], [LocaleId], [UrlPath], [PageTypeId], [IsDeleted], [CreateDate], [CreatorId], [CustomEntityDefinitionCode], [PublishStatusCode], [PublishDate]) VALUES (11, 5, NULL, N'', 1, 0, CAST(N'2018-04-12T16:24:25.6935000' AS DateTime2), 1, NULL, N'P', CAST(N'2018-04-12T16:24:25.6935231' AS DateTime2))
insert [Cofoundry].[Page] ([PageId], [PageDirectoryId], [LocaleId], [UrlPath], [PageTypeId], [IsDeleted], [CreateDate], [CreatorId], [CustomEntityDefinitionCode], [PublishStatusCode], [PublishDate]) VALUES (12, 3, NULL, N'', 1, 0, CAST(N'2018-04-12T16:24:51.4430000' AS DateTime2), 1, NULL, N'P', CAST(N'2018-04-12T16:24:51.4429546' AS DateTime2))
insert [Cofoundry].[Page] ([PageId], [PageDirectoryId], [LocaleId], [UrlPath], [PageTypeId], [IsDeleted], [CreateDate], [CreatorId], [CustomEntityDefinitionCode], [PublishStatusCode], [PublishDate]) VALUES (13, 4, NULL, N'', 1, 0, CAST(N'2018-04-12T16:25:13.6494000' AS DateTime2), 1, NULL, N'P', CAST(N'2018-04-12T16:25:13.6493725' AS DateTime2))
insert [Cofoundry].[Page] ([PageId], [PageDirectoryId], [LocaleId], [UrlPath], [PageTypeId], [IsDeleted], [CreateDate], [CreatorId], [CustomEntityDefinitionCode], [PublishStatusCode], [PublishDate]) VALUES (14, 6, NULL, N'', 1, 1, CAST(N'2018-04-12T16:26:05.7655000' AS DateTime2), 1, NULL, N'P', CAST(N'2018-04-12T16:26:05.7655290' AS DateTime2))
insert [Cofoundry].[Page] ([PageId], [PageDirectoryId], [LocaleId], [UrlPath], [PageTypeId], [IsDeleted], [CreateDate], [CreatorId], [CustomEntityDefinitionCode], [PublishStatusCode], [PublishDate]) VALUES (15, 4, NULL, N'upcoming', 1, 0, CAST(N'2018-04-12T16:27:23.3975000' AS DateTime2), 1, NULL, N'P', CAST(N'2018-04-12T16:27:23.3975262' AS DateTime2))
insert [Cofoundry].[Page] ([PageId], [PageDirectoryId], [LocaleId], [UrlPath], [PageTypeId], [IsDeleted], [CreateDate], [CreatorId], [CustomEntityDefinitionCode], [PublishStatusCode], [PublishDate]) VALUES (16, 4, NULL, N'past', 1, 0, CAST(N'2018-04-12T16:27:52.2238000' AS DateTime2), 1, NULL, N'P', CAST(N'2018-04-12T16:27:52.2237608' AS DateTime2))
insert [Cofoundry].[Page] ([PageId], [PageDirectoryId], [LocaleId], [UrlPath], [PageTypeId], [IsDeleted], [CreateDate], [CreatorId], [CustomEntityDefinitionCode], [PublishStatusCode], [PublishDate]) VALUES (17, 2, NULL, N'', 1, 0, CAST(N'2018-04-12T17:36:34.6362000' AS DateTime2), 1, NULL, N'P', CAST(N'2018-04-12T17:36:34.6361966' AS DateTime2))
go
set identity_insert [Cofoundry].[Page] off
go

/* PAGE VERSION */

set identity_insert [Cofoundry].[PageVersion] on 
go
insert [Cofoundry].[PageVersion] ([PageVersionId], [PageId], [PageTemplateId], [BasedOnPageVersionId], [Title], [MetaDescription], [WorkFlowStatusId], [IsDeleted], [CreateDate], [CreatorId], [ExcludeFromSitemap], [OpenGraphTitle], [OpenGraphDescription], [OpenGraphImageId]) VALUES (1, 1, 2, NULL, N'Home', N'', 4, 0, CAST(N'2018-04-12T16:14:47.6716000' AS DateTime2), 1, 0, NULL, NULL, NULL)
insert [Cofoundry].[PageVersion] ([PageVersionId], [PageId], [PageTemplateId], [BasedOnPageVersionId], [Title], [MetaDescription], [WorkFlowStatusId], [IsDeleted], [CreateDate], [CreatorId], [ExcludeFromSitemap], [OpenGraphTitle], [OpenGraphDescription], [OpenGraphImageId]) VALUES (2, 2, 2, NULL, N'About Us', N'', 4, 0, CAST(N'2018-04-12T16:15:37.7869000' AS DateTime2), 1, 0, NULL, NULL, NULL)
insert [Cofoundry].[PageVersion] ([PageVersionId], [PageId], [PageTemplateId], [BasedOnPageVersionId], [Title], [MetaDescription], [WorkFlowStatusId], [IsDeleted], [CreateDate], [CreatorId], [ExcludeFromSitemap], [OpenGraphTitle], [OpenGraphDescription], [OpenGraphImageId]) VALUES (3, 3, 2, NULL, N'Terms & Conditions', N'', 4, 0, CAST(N'2018-04-12T16:16:12.7082000' AS DateTime2), 1, 0, NULL, NULL, NULL)
insert [Cofoundry].[PageVersion] ([PageVersionId], [PageId], [PageTemplateId], [BasedOnPageVersionId], [Title], [MetaDescription], [WorkFlowStatusId], [IsDeleted], [CreateDate], [CreatorId], [ExcludeFromSitemap], [OpenGraphTitle], [OpenGraphDescription], [OpenGraphImageId]) VALUES (4, 4, 2, NULL, N'Project 1', N'', 4, 0, CAST(N'2018-04-12T16:17:06.7722000' AS DateTime2), 1, 0, NULL, NULL, NULL)
insert [Cofoundry].[PageVersion] ([PageVersionId], [PageId], [PageTemplateId], [BasedOnPageVersionId], [Title], [MetaDescription], [WorkFlowStatusId], [IsDeleted], [CreateDate], [CreatorId], [ExcludeFromSitemap], [OpenGraphTitle], [OpenGraphDescription], [OpenGraphImageId]) VALUES (5, 5, 2, NULL, N'Project 2', N'', 4, 0, CAST(N'2018-04-12T16:17:26.2933000' AS DateTime2), 1, 0, NULL, NULL, NULL)
insert [Cofoundry].[PageVersion] ([PageVersionId], [PageId], [PageTemplateId], [BasedOnPageVersionId], [Title], [MetaDescription], [WorkFlowStatusId], [IsDeleted], [CreateDate], [CreatorId], [ExcludeFromSitemap], [OpenGraphTitle], [OpenGraphDescription], [OpenGraphImageId]) VALUES (6, 6, 2, NULL, N'Project 3', N'', 4, 0, CAST(N'2018-04-12T16:18:07.3801000' AS DateTime2), 1, 0, NULL, NULL, NULL)
insert [Cofoundry].[PageVersion] ([PageVersionId], [PageId], [PageTemplateId], [BasedOnPageVersionId], [Title], [MetaDescription], [WorkFlowStatusId], [IsDeleted], [CreateDate], [CreatorId], [ExcludeFromSitemap], [OpenGraphTitle], [OpenGraphDescription], [OpenGraphImageId]) VALUES (7, 7, 2, NULL, N'Privacy Policy', N'', 4, 0, CAST(N'2018-04-12T16:20:31.4984000' AS DateTime2), 1, 0, NULL, NULL, NULL)
insert [Cofoundry].[PageVersion] ([PageVersionId], [PageId], [PageTemplateId], [BasedOnPageVersionId], [Title], [MetaDescription], [WorkFlowStatusId], [IsDeleted], [CreateDate], [CreatorId], [ExcludeFromSitemap], [OpenGraphTitle], [OpenGraphDescription], [OpenGraphImageId]) VALUES (8, 8, 2, NULL, N'Swindon', N'', 4, 0, CAST(N'2018-04-12T16:21:26.3991000' AS DateTime2), 1, 0, NULL, NULL, NULL)
insert [Cofoundry].[PageVersion] ([PageVersionId], [PageId], [PageTemplateId], [BasedOnPageVersionId], [Title], [MetaDescription], [WorkFlowStatusId], [IsDeleted], [CreateDate], [CreatorId], [ExcludeFromSitemap], [OpenGraphTitle], [OpenGraphDescription], [OpenGraphImageId]) VALUES (9, 9, 2, NULL, N'Plymouth', N'', 4, 0, CAST(N'2018-04-12T16:22:27.5535000' AS DateTime2), 1, 0, NULL, NULL, NULL)
insert [Cofoundry].[PageVersion] ([PageVersionId], [PageId], [PageTemplateId], [BasedOnPageVersionId], [Title], [MetaDescription], [WorkFlowStatusId], [IsDeleted], [CreateDate], [CreatorId], [ExcludeFromSitemap], [OpenGraphTitle], [OpenGraphDescription], [OpenGraphImageId]) VALUES (10, 10, 2, NULL, N'York', N'', 4, 0, CAST(N'2018-04-12T16:23:24.9564000' AS DateTime2), 1, 0, NULL, NULL, NULL)
insert [Cofoundry].[PageVersion] ([PageVersionId], [PageId], [PageTemplateId], [BasedOnPageVersionId], [Title], [MetaDescription], [WorkFlowStatusId], [IsDeleted], [CreateDate], [CreatorId], [ExcludeFromSitemap], [OpenGraphTitle], [OpenGraphDescription], [OpenGraphImageId]) VALUES (11, 11, 2, NULL, N'Places', N'', 4, 0, CAST(N'2018-04-12T16:24:25.6935000' AS DateTime2), 1, 0, NULL, NULL, NULL)
insert [Cofoundry].[PageVersion] ([PageVersionId], [PageId], [PageTemplateId], [BasedOnPageVersionId], [Title], [MetaDescription], [WorkFlowStatusId], [IsDeleted], [CreateDate], [CreatorId], [ExcludeFromSitemap], [OpenGraphTitle], [OpenGraphDescription], [OpenGraphImageId]) VALUES (12, 12, 2, NULL, N'Portfolio', N'', 4, 0, CAST(N'2018-04-12T16:24:51.4430000' AS DateTime2), 1, 0, NULL, NULL, NULL)
insert [Cofoundry].[PageVersion] ([PageVersionId], [PageId], [PageTemplateId], [BasedOnPageVersionId], [Title], [MetaDescription], [WorkFlowStatusId], [IsDeleted], [CreateDate], [CreatorId], [ExcludeFromSitemap], [OpenGraphTitle], [OpenGraphDescription], [OpenGraphImageId]) VALUES (13, 13, 2, NULL, N'Events', N'', 4, 0, CAST(N'2018-04-12T16:25:13.6494000' AS DateTime2), 1, 0, NULL, NULL, NULL)
insert [Cofoundry].[PageVersion] ([PageVersionId], [PageId], [PageTemplateId], [BasedOnPageVersionId], [Title], [MetaDescription], [WorkFlowStatusId], [IsDeleted], [CreateDate], [CreatorId], [ExcludeFromSitemap], [OpenGraphTitle], [OpenGraphDescription], [OpenGraphImageId]) VALUES (14, 14, 2, NULL, N'Upcoming Events', N'', 4, 0, CAST(N'2018-04-12T16:26:05.7655000' AS DateTime2), 1, 0, NULL, NULL, NULL)
insert [Cofoundry].[PageVersion] ([PageVersionId], [PageId], [PageTemplateId], [BasedOnPageVersionId], [Title], [MetaDescription], [WorkFlowStatusId], [IsDeleted], [CreateDate], [CreatorId], [ExcludeFromSitemap], [OpenGraphTitle], [OpenGraphDescription], [OpenGraphImageId]) VALUES (15, 15, 2, NULL, N'Upcoming Events', N'', 4, 0, CAST(N'2018-04-12T16:27:23.3975000' AS DateTime2), 1, 0, NULL, NULL, NULL)
insert [Cofoundry].[PageVersion] ([PageVersionId], [PageId], [PageTemplateId], [BasedOnPageVersionId], [Title], [MetaDescription], [WorkFlowStatusId], [IsDeleted], [CreateDate], [CreatorId], [ExcludeFromSitemap], [OpenGraphTitle], [OpenGraphDescription], [OpenGraphImageId]) VALUES (16, 16, 2, NULL, N'Past Events', N'', 4, 0, CAST(N'2018-04-12T16:27:52.2238000' AS DateTime2), 1, 0, NULL, NULL, NULL)
insert [Cofoundry].[PageVersion] ([PageVersionId], [PageId], [PageTemplateId], [BasedOnPageVersionId], [Title], [MetaDescription], [WorkFlowStatusId], [IsDeleted], [CreateDate], [CreatorId], [ExcludeFromSitemap], [OpenGraphTitle], [OpenGraphDescription], [OpenGraphImageId]) VALUES (17, 17, 2, NULL, N'Things To Do', N'', 4, 0, CAST(N'2018-04-12T17:36:34.6362000' AS DateTime2), 1, 0, NULL, NULL, NULL)
go
set identity_insert [Cofoundry].[PageVersion] off
go

/* CUSTOM ENTITY */

set identity_insert [Cofoundry].[CustomEntity] on 
go
insert [Cofoundry].[CustomEntity] ([CustomEntityId], [CustomEntityDefinitionCode], [LocaleId], [UrlSlug], [CreateDate], [CreatorId], [Ordering], [PublishStatusCode], [PublishDate]) VALUES (1, N'MNUSPL', NULL, N'main', CAST(N'2018-04-12T16:38:31.3253000' AS DateTime2), 1, NULL, N'P', CAST(N'2018-04-12T16:38:31.3252621' AS DateTime2))
insert [Cofoundry].[CustomEntity] ([CustomEntityId], [CustomEntityDefinitionCode], [LocaleId], [UrlSlug], [CreateDate], [CreatorId], [Ordering], [PublishStatusCode], [PublishDate]) VALUES (2, N'MNUNST', NULL, N'main', CAST(N'2018-04-12T17:41:41.3619000' AS DateTime2), 1, NULL, N'P', CAST(N'2018-04-12T17:41:41.3618824' AS DateTime2))
insert [Cofoundry].[CustomEntity] ([CustomEntityId], [CustomEntityDefinitionCode], [LocaleId], [UrlSlug], [CreateDate], [CreatorId], [Ordering], [PublishStatusCode], [PublishDate]) VALUES (3, N'MNUMUL', NULL, N'main', CAST(N'2018-04-16T10:01:20.8481000' AS DateTime2), 1, NULL, N'P', CAST(N'2018-04-16T10:01:20.8481313' AS DateTime2))
go
set identity_insert [Cofoundry].[CustomEntity] off
go

/* CUSTOM ENTITY VERSION */

set identity_insert [Cofoundry].[CustomEntityVersion] on 
go
insert [Cofoundry].[CustomEntityVersion] ([CustomEntityVersionId], [CustomEntityId], [Title], [WorkFlowStatusId], [SerializedData], [CreateDate], [CreatorId]) VALUES (1, 1, N'Main', 4, N'{"pageIds":[1,2,12,13]}', CAST(N'2018-04-12T16:38:31.3253000' AS DateTime2), 1)
insert [Cofoundry].[CustomEntityVersion] ([CustomEntityVersionId], [CustomEntityId], [Title], [WorkFlowStatusId], [SerializedData], [CreateDate], [CreatorId]) VALUES (2, 2, N'Main', 4, N'{"items":[{"title":"Home","pageId":1,"childItems":null},{"title":"About","pageId":2,"childItems":null},{"title":"Portfolo","pageId":12,"childItems":[{"title":"Project 1","pageId":4},{"title":"Project 2","pageId":5},{"title":"Project 3","pageId":6}]},{"title":"Things To Do","pageId":17,"childItems":[{"title":"Events","pageId":13},{"title":"Place To See","pageId":11}]}]}', CAST(N'2018-04-12T17:41:41.3619000' AS DateTime2), 1)
insert [Cofoundry].[CustomEntityVersion] ([CustomEntityVersionId], [CustomEntityId], [Title], [WorkFlowStatusId], [SerializedData], [CreateDate], [CreatorId]) VALUES (3, 2, N'Main', 4, N'{"items":[{"title":"Home","pageId":1,"childItems":null},{"title":"About","pageId":2,"childItems":null},{"title":"Portfolio","pageId":12,"childItems":[{"title":"Project 1","pageId":4},{"title":"Project 2","pageId":5},{"title":"Project 3","pageId":6}]},{"title":"Things To Do","pageId":17,"childItems":[{"title":"Events","pageId":13},{"title":"Place To See","pageId":11}]}]}', CAST(N'2018-04-12T17:47:07.2333000' AS DateTime2), 1)
insert [Cofoundry].[CustomEntityVersion] ([CustomEntityVersionId], [CustomEntityId], [Title], [WorkFlowStatusId], [SerializedData], [CreateDate], [CreatorId]) VALUES (4, 3, N'Main', 4, N'{"items":[{"title":"Home","pageId":1,"items":null},{"title":"Things To Do","pageId":17,"items":[{"title":"Events","pageId":13,"items":[{"title":"Upcoming Events","pageId":15,"items":null},{"title":"Past Events","pageId":16,"items":null}]},{"title":"Places To Go","pageId":11,"items":[{"title":"Swindon","pageId":8,"items":null},{"title":"Plymouth","pageId":9,"items":null},{"title":"York","pageId":10,"items":null}]}]},{"title":"Portfolio","pageId":12,"items":[{"title":"Project 1","pageId":4,"items":null},{"title":"Project 2","pageId":5,"items":null},{"title":"Project 3","pageId":6,"items":null}]},{"title":"About Us","pageId":2,"items":null}]}', CAST(N'2018-04-16T10:01:20.8481000' AS DateTime2), 1)
go
set identity_insert [Cofoundry].[CustomEntityVersion] off
go

/* UNSTRUCTURED DATA DEPENDENCIES */

insert [Cofoundry].[UnstructuredDataDependency] ([RootEntityDefinitionCode], [RootEntityId], [RelatedEntityDefinitionCode], [RelatedEntityId], [RelatedEntityCascadeActionId]) VALUES (N'COFCEV', 1, N'COFPGE', 1, 2)
insert [Cofoundry].[UnstructuredDataDependency] ([RootEntityDefinitionCode], [RootEntityId], [RelatedEntityDefinitionCode], [RelatedEntityId], [RelatedEntityCascadeActionId]) VALUES (N'COFCEV', 1, N'COFPGE', 2, 2)
insert [Cofoundry].[UnstructuredDataDependency] ([RootEntityDefinitionCode], [RootEntityId], [RelatedEntityDefinitionCode], [RelatedEntityId], [RelatedEntityCascadeActionId]) VALUES (N'COFCEV', 1, N'COFPGE', 12, 2)
insert [Cofoundry].[UnstructuredDataDependency] ([RootEntityDefinitionCode], [RootEntityId], [RelatedEntityDefinitionCode], [RelatedEntityId], [RelatedEntityCascadeActionId]) VALUES (N'COFCEV', 1, N'COFPGE', 13, 2)
insert [Cofoundry].[UnstructuredDataDependency] ([RootEntityDefinitionCode], [RootEntityId], [RelatedEntityDefinitionCode], [RelatedEntityId], [RelatedEntityCascadeActionId]) VALUES (N'COFCEV', 2, N'COFPGE', 1, 1)
insert [Cofoundry].[UnstructuredDataDependency] ([RootEntityDefinitionCode], [RootEntityId], [RelatedEntityDefinitionCode], [RelatedEntityId], [RelatedEntityCascadeActionId]) VALUES (N'COFCEV', 2, N'COFPGE', 2, 1)
insert [Cofoundry].[UnstructuredDataDependency] ([RootEntityDefinitionCode], [RootEntityId], [RelatedEntityDefinitionCode], [RelatedEntityId], [RelatedEntityCascadeActionId]) VALUES (N'COFCEV', 2, N'COFPGE', 4, 1)
insert [Cofoundry].[UnstructuredDataDependency] ([RootEntityDefinitionCode], [RootEntityId], [RelatedEntityDefinitionCode], [RelatedEntityId], [RelatedEntityCascadeActionId]) VALUES (N'COFCEV', 2, N'COFPGE', 5, 1)
insert [Cofoundry].[UnstructuredDataDependency] ([RootEntityDefinitionCode], [RootEntityId], [RelatedEntityDefinitionCode], [RelatedEntityId], [RelatedEntityCascadeActionId]) VALUES (N'COFCEV', 2, N'COFPGE', 6, 1)
insert [Cofoundry].[UnstructuredDataDependency] ([RootEntityDefinitionCode], [RootEntityId], [RelatedEntityDefinitionCode], [RelatedEntityId], [RelatedEntityCascadeActionId]) VALUES (N'COFCEV', 2, N'COFPGE', 11, 1)
insert [Cofoundry].[UnstructuredDataDependency] ([RootEntityDefinitionCode], [RootEntityId], [RelatedEntityDefinitionCode], [RelatedEntityId], [RelatedEntityCascadeActionId]) VALUES (N'COFCEV', 2, N'COFPGE', 12, 1)
insert [Cofoundry].[UnstructuredDataDependency] ([RootEntityDefinitionCode], [RootEntityId], [RelatedEntityDefinitionCode], [RelatedEntityId], [RelatedEntityCascadeActionId]) VALUES (N'COFCEV', 2, N'COFPGE', 13, 1)
insert [Cofoundry].[UnstructuredDataDependency] ([RootEntityDefinitionCode], [RootEntityId], [RelatedEntityDefinitionCode], [RelatedEntityId], [RelatedEntityCascadeActionId]) VALUES (N'COFCEV', 2, N'COFPGE', 17, 1)
insert [Cofoundry].[UnstructuredDataDependency] ([RootEntityDefinitionCode], [RootEntityId], [RelatedEntityDefinitionCode], [RelatedEntityId], [RelatedEntityCascadeActionId]) VALUES (N'COFCEV', 3, N'COFPGE', 1, 1)
insert [Cofoundry].[UnstructuredDataDependency] ([RootEntityDefinitionCode], [RootEntityId], [RelatedEntityDefinitionCode], [RelatedEntityId], [RelatedEntityCascadeActionId]) VALUES (N'COFCEV', 3, N'COFPGE', 2, 1)
insert [Cofoundry].[UnstructuredDataDependency] ([RootEntityDefinitionCode], [RootEntityId], [RelatedEntityDefinitionCode], [RelatedEntityId], [RelatedEntityCascadeActionId]) VALUES (N'COFCEV', 3, N'COFPGE', 4, 1)
insert [Cofoundry].[UnstructuredDataDependency] ([RootEntityDefinitionCode], [RootEntityId], [RelatedEntityDefinitionCode], [RelatedEntityId], [RelatedEntityCascadeActionId]) VALUES (N'COFCEV', 3, N'COFPGE', 5, 1)
insert [Cofoundry].[UnstructuredDataDependency] ([RootEntityDefinitionCode], [RootEntityId], [RelatedEntityDefinitionCode], [RelatedEntityId], [RelatedEntityCascadeActionId]) VALUES (N'COFCEV', 3, N'COFPGE', 6, 1)
insert [Cofoundry].[UnstructuredDataDependency] ([RootEntityDefinitionCode], [RootEntityId], [RelatedEntityDefinitionCode], [RelatedEntityId], [RelatedEntityCascadeActionId]) VALUES (N'COFCEV', 3, N'COFPGE', 11, 1)
insert [Cofoundry].[UnstructuredDataDependency] ([RootEntityDefinitionCode], [RootEntityId], [RelatedEntityDefinitionCode], [RelatedEntityId], [RelatedEntityCascadeActionId]) VALUES (N'COFCEV', 3, N'COFPGE', 12, 1)
insert [Cofoundry].[UnstructuredDataDependency] ([RootEntityDefinitionCode], [RootEntityId], [RelatedEntityDefinitionCode], [RelatedEntityId], [RelatedEntityCascadeActionId]) VALUES (N'COFCEV', 3, N'COFPGE', 13, 1)
insert [Cofoundry].[UnstructuredDataDependency] ([RootEntityDefinitionCode], [RootEntityId], [RelatedEntityDefinitionCode], [RelatedEntityId], [RelatedEntityCascadeActionId]) VALUES (N'COFCEV', 3, N'COFPGE', 17, 1)
insert [Cofoundry].[UnstructuredDataDependency] ([RootEntityDefinitionCode], [RootEntityId], [RelatedEntityDefinitionCode], [RelatedEntityId], [RelatedEntityCascadeActionId]) VALUES (N'COFCEV', 4, N'COFPGE', 1, 1)
insert [Cofoundry].[UnstructuredDataDependency] ([RootEntityDefinitionCode], [RootEntityId], [RelatedEntityDefinitionCode], [RelatedEntityId], [RelatedEntityCascadeActionId]) VALUES (N'COFCEV', 4, N'COFPGE', 2, 1)
insert [Cofoundry].[UnstructuredDataDependency] ([RootEntityDefinitionCode], [RootEntityId], [RelatedEntityDefinitionCode], [RelatedEntityId], [RelatedEntityCascadeActionId]) VALUES (N'COFCEV', 4, N'COFPGE', 4, 1)
insert [Cofoundry].[UnstructuredDataDependency] ([RootEntityDefinitionCode], [RootEntityId], [RelatedEntityDefinitionCode], [RelatedEntityId], [RelatedEntityCascadeActionId]) VALUES (N'COFCEV', 4, N'COFPGE', 5, 1)
insert [Cofoundry].[UnstructuredDataDependency] ([RootEntityDefinitionCode], [RootEntityId], [RelatedEntityDefinitionCode], [RelatedEntityId], [RelatedEntityCascadeActionId]) VALUES (N'COFCEV', 4, N'COFPGE', 6, 1)
insert [Cofoundry].[UnstructuredDataDependency] ([RootEntityDefinitionCode], [RootEntityId], [RelatedEntityDefinitionCode], [RelatedEntityId], [RelatedEntityCascadeActionId]) VALUES (N'COFCEV', 4, N'COFPGE', 8, 1)
insert [Cofoundry].[UnstructuredDataDependency] ([RootEntityDefinitionCode], [RootEntityId], [RelatedEntityDefinitionCode], [RelatedEntityId], [RelatedEntityCascadeActionId]) VALUES (N'COFCEV', 4, N'COFPGE', 9, 1)
insert [Cofoundry].[UnstructuredDataDependency] ([RootEntityDefinitionCode], [RootEntityId], [RelatedEntityDefinitionCode], [RelatedEntityId], [RelatedEntityCascadeActionId]) VALUES (N'COFCEV', 4, N'COFPGE', 10, 1)
insert [Cofoundry].[UnstructuredDataDependency] ([RootEntityDefinitionCode], [RootEntityId], [RelatedEntityDefinitionCode], [RelatedEntityId], [RelatedEntityCascadeActionId]) VALUES (N'COFCEV', 4, N'COFPGE', 11, 1)
insert [Cofoundry].[UnstructuredDataDependency] ([RootEntityDefinitionCode], [RootEntityId], [RelatedEntityDefinitionCode], [RelatedEntityId], [RelatedEntityCascadeActionId]) VALUES (N'COFCEV', 4, N'COFPGE', 12, 1)
insert [Cofoundry].[UnstructuredDataDependency] ([RootEntityDefinitionCode], [RootEntityId], [RelatedEntityDefinitionCode], [RelatedEntityId], [RelatedEntityCascadeActionId]) VALUES (N'COFCEV', 4, N'COFPGE', 13, 1)
insert [Cofoundry].[UnstructuredDataDependency] ([RootEntityDefinitionCode], [RootEntityId], [RelatedEntityDefinitionCode], [RelatedEntityId], [RelatedEntityCascadeActionId]) VALUES (N'COFCEV', 4, N'COFPGE', 15, 1)
insert [Cofoundry].[UnstructuredDataDependency] ([RootEntityDefinitionCode], [RootEntityId], [RelatedEntityDefinitionCode], [RelatedEntityId], [RelatedEntityCascadeActionId]) VALUES (N'COFCEV', 4, N'COFPGE', 16, 1)
insert [Cofoundry].[UnstructuredDataDependency] ([RootEntityDefinitionCode], [RootEntityId], [RelatedEntityDefinitionCode], [RelatedEntityId], [RelatedEntityCascadeActionId]) VALUES (N'COFCEV', 4, N'COFPGE', 17, 1)
go

/* Update versioning lookup tables */

exec Cofoundry.CustomEntityPublishStatusQuery_Update @CustomEntityId = 1
exec Cofoundry.CustomEntityPublishStatusQuery_Update @CustomEntityId = 2
exec Cofoundry.CustomEntityPublishStatusQuery_Update @CustomEntityId = 3

exec Cofoundry.PagePublishStatusQuery_Update @PageId = 1
exec Cofoundry.PagePublishStatusQuery_Update @PageId = 2
exec Cofoundry.PagePublishStatusQuery_Update @PageId = 3
exec Cofoundry.PagePublishStatusQuery_Update @PageId = 4
exec Cofoundry.PagePublishStatusQuery_Update @PageId = 5
exec Cofoundry.PagePublishStatusQuery_Update @PageId = 6
exec Cofoundry.PagePublishStatusQuery_Update @PageId = 7
exec Cofoundry.PagePublishStatusQuery_Update @PageId = 8
exec Cofoundry.PagePublishStatusQuery_Update @PageId = 9
exec Cofoundry.PagePublishStatusQuery_Update @PageId = 10
exec Cofoundry.PagePublishStatusQuery_Update @PageId = 11
exec Cofoundry.PagePublishStatusQuery_Update @PageId = 12
exec Cofoundry.PagePublishStatusQuery_Update @PageId = 13
exec Cofoundry.PagePublishStatusQuery_Update @PageId = 14
exec Cofoundry.PagePublishStatusQuery_Update @PageId = 15
exec Cofoundry.PagePublishStatusQuery_Update @PageId = 16
exec Cofoundry.PagePublishStatusQuery_Update @PageId = 17
go
