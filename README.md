# Cofoundry.Samples.Menus

A bare website showing various examples of creating content editable menus.

#### To get started:

1. Create a database named 'Cofoundry.Samples.Menus' and check the Cofoundry connection string in the appsettings.josn file is correct for you sql server instance
2. Run the website and navigate to *"/admin"*, which will display the setup screen
3. Enter an application name and setup your user account. Submit the form to complete the site setup. 
4. Either log in and enter your own data or follow the steps below to import some test data

#### Importing test data:

To get you started we've put together some optional test data:

1. Run `InitData\Init.sql` script against your db to populate some initial pages
2. Either restart the site, or go to the *settings* module in the admin panel and clear the cache.
 
## Menu Types

Each menu type is created using [Custom Entities](https://github.com/cofoundry-cms/cofoundry/wiki/Custom-Entities) to store the data and asp.net [View Components](https://docs.microsoft.com/en-us/aspnet/core/mvc/views/view-components) to render the data.

#### Simple Menu

![Simple menu output](readme/SimpleMenu.png)

The simple menu demonstrates how you can build a content manageable list of pages using the `[PageCollection]` attribute.

#### Nested Menu

![Nested menu output](readme/NestedMenu.png)

The nested menu demonstrates how you can build menus with a pre-defined number of menu levels. This is achieved using [nested data models](https://github.com/cofoundry-cms/cofoundry/wiki/Data-Model-Annotations#nested-data-models) and the `[NestedDataModelCollection]` attribute.

This example only contains one nested menu level, but you could define more by creating and nested more menu types. To use an indeterminate number of menu levels (i.e. a tree structure) have a look at the multi-level menu example.

#### Multi-level Menu

![Multi-level menu output](readme/MultiLevelMenu.png)

The multi-level menu example demonstrates how to create a menu with an unlimited number of menu levels (i.e a tree structure) using a recursive data model definition.