# Testing MiniRecord

This is an app which debugs mini_record with mysql2 driver. All debugging is done in `rails console`

```
$ rails console
Loading development environment (Rails 3.1.3)
ruby-1.9.3-p0 :001 > Post.auto_upgrade!
   (43.7ms)  CREATE TABLE `posts` (`id` int(11) DEFAULT NULL auto_increment PRIMARY KEY, `title` varchar(255), `created_at` datetime, `updated_at` datetime, `author_id` int(11)) ENGINE=InnoDB
   (149.5ms)  CREATE INDEX `index_posts_on_author_id` ON `posts` (`author_id`)

ruby-1.9.3-p0 :001 > exit
```

So far so good. Let's re-initialize and try that again.

```
$ rails console
Loading development environment (Rails 3.1.3)
ruby-1.9.3-p0 :001 > Post.auto_upgrade!
   (50.9ms)  ALTER TABLE `posts` DROP `author_id`
   (206.3ms)  ALTER TABLE `posts` ADD `author_id` int(11)
   (119.6ms)  CREATE INDEX `index_posts_on_author_id` ON `posts` (`author_id`)
 => nil
```

As you can see the foreign key field is dropped, nuking any association data before recreating the same field again.