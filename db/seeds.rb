# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.delete_all
Product.delete_all

User.create!(name: 'admin', password: '123', password_confirmation: '123', admin_enabled: true)
User.create!(name: 'guest', password: '123', password_confirmation: '123', admin_enabled: false)

Product.create!(title: 'JavaScript Cookbook, 3rd Edition',
                description: %{Problem solving with JavaScript is a lot trickier now that its use has expanded considerably in size, scope, and complexity. This cookbook has your back, with recipes for common tasks across the JavaScript world, whether you're working in the browser, the server, or a mobile environment. Each recipe includes reusable code and practical advice for tackling JavaScript objects, Node, Ajax, JSON, data persistence, graphical and media applications, complex frameworks, modular JavaScript, APIs, and many related technologies.
                               Aimed at people who have some experience with JavaScript, the first part covers traditional uses of JavaScript, along with new ideas and improved functionality. The second part dives into the server, mobile development, and a plethora of leading-edge tools. You'll save time - and learn more about JavaScript in the process.},
                image_url: 'https://it-ebooks.org/img/books/oreilly/javascript_cookbook_2nd_edition.jpg',
                price: 24.95)

Product.create!(title: 'Visio Services Quick Guide',
                description: %{In this fast-paced 100-page guide, you'll learn to load, display and interact with dynamic, data-powered Visio diagrams in SharePoint 2013 or Office 365.

Visio Services Quick Guide gives you the tools to build anything from a simple project workflow to an organizational infrastructure diagram, powered by real data from SharePoint or SQL Server. Colleagues can load your diagrams entirely in the browser, meaning that a single Visio client installation is enough to get started. Readers with JavaScript experience will also find out how to get additional control over Visio diagrams using the JavaScript mashup API, and how to build a custom data provider. The final chapter covers some useful information on administering Visio Services.

Get started bringing your Visio diagrams to life with the Visio Services Quick Guide.},
                image_url: 'http://it-ebooks.org/img/books/apress/visio_services_quick_guide.jpg',
                price: 14.95)

Product.create!(title: 'Data Mining Algorithms',
                description: %{Data Mining Algorithms is a practical, technically-oriented guide to data mining algorithms that covers the most important algorithms for building classification, regression, and clustering models, as well as techniques used for attribute selection and transformation, model quality evaluation, and creating model ensembles. The author presents many of the important topics and methodologies widely used in data mining, whilst demonstrating the internal operation and usage of data mining algorithms using examples in R.},
                image_url: 'http://it-ebooks.org/img/books/wiley/data_mining_algorithms.jpg',
                price: 21.00)

Product.create!(title: 'Programming Chrome Apps',
                description: %{Put your web app design skills to work by learning how to create powerful and portable Chrome Apps. With this practical book, you'll learn how to build Google's unique apps to behave just like native apps so they can interact with hardware devices, access external files, and send notifications.

Author Marc Rochkind takes you through a hands-on, objective tour of Chrome Apps, which run on any platform that supports the Chrome browserâ€”including OS X, Windows, Linux, as well as Android and iOS. If you know how to work with HTML, CSS, JavaScript, and the DOM, you're ready to get started.},
                image_url: 'http://it-ebooks.org/img/books/oreilly/programming_chrome_apps.jpg',
                price: 32.95)

Product.create!(title: 'Android Recipes, 4th Edition',
                description: %{Android Recipes, Fourth Edition offers more than 100 down-to-earth code recipes, and guides you step-by-step through a wide range of useful topics using complete and real-world working code examples. This book is updated to include the Android 5.0 SDK, as well as earlier releases.

Instead of abstract descriptions of complex concepts, in Android Recipes, you'll find live code examples. When you start a new project you can consider copying and pasting the code and configuration files from this book and then modifying them for your own customization needs.

Crammed with insightful instruction and helpful examples, this fourth edition of Android Recipes is your guide to writing apps for one of today's hottest mobile platforms. It offers pragmatic advice that will help you get the job done quickly and well. This can save you a great deal of work over creating a project from scratch!},
                image_url: 'http://it-ebooks.org/img/books/apress/android_recipes_4th_edition.jpg',
                price: 24.95)

Product.create!(title: 'Learning MySQL and MariaDB',
                description: %{If you're a programmer new to databases - or just new to MySQL and its community-driven variant, MariaDB - you've found the perfect introduction. This hands-on guide provides an easy, step-by-step approach to installing, using, and maintaining these popular relational database engines.

Author Russell Dyer, Curriculum Manager at MariaDB and former editor of the MySQL Knowledge Base, takes you through database design and the basics of data management and manipulation, using real-world examples and many practical tips. Exercises and review questions help you practice what you've just learned.},
                image_url: 'http://it-ebooks.org/img/books/oreilly/learning_mysql_and_mariadb.jpg',
                price: 19.95)

Product.create!(title: 'Developing Web Components',
                description: %{Although web components are still on the bleeding edge - barely supported in modern browsersâ€”the technology is also moving extremely fast. This practical guide gets you up to speed on the concepts underlying W3C's emerging standard and shows you how to build custom, reusable HTML5 Web Components.

Regardless of your experience with libraries such as jQuery and Polymer, this book teaches JavaScript developers the DOM manipulations these libraries perform. You'll learn how to build a basic widget with vanilla JavaScript and then convert it into a web component that's semantic, declarative, encapsulated, consumable, and maintainable. With custom components, the Web can finally fulfill its potential as a natively extensible application platform. This book gets you in at the right time.},
                image_url: 'http://it-ebooks.org/img/books/oreilly/developing_web_components.jpg',
                price: 34.95)