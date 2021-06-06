-- Project Name : menu-deliver
-- Date/Time    : 2021/03/29 19:54:17
-- Author       : hlike
-- RDBMS Type   : PostgreSQL
-- Application  : A5:SQL Mk-2

/*
  BackupToTempTable, RestoreFromTempTable疑似命令が付加されています。
  これにより、drop table, create table 後もデータが残ります。
  この機能は一時的に $$TableName のような一時テーブルを作成します。
*/

-- 献立素材
--* BackupToTempTable
drop table if exists menu_compositions cascade;

--* RestoreFromTempTable
create table menu_compositions (
  menu_id integer not null
  , composition_item_no integer not null
  , constraint menu_compositions_PKC primary key (menu_id,composition_item_no)
) ;

-- メール拒否
--* BackupToTempTable
drop table if exists bounce cascade;

--* RestoreFromTempTable
create table bounce (
  user_id integer not null
  , bounce boolean default false not null
  , constraint bounce_PKC primary key (user_id)
) ;

-- 食品成分表
--* BackupToTempTable
drop table if exists compositions cascade;

--* RestoreFromTempTable
create table compositions (
  item_no integer default 0 not null
  , item_group integer default 0
  , item_index integer default 0
  , name character varying(128)
  , energy double precision default 0
  , protein double precision default 0
  , lipid double precision default 0
  , carbohydrate double precision default 0
  , calcium double precision default 0
  , iron double precision default 0
  , cholesterol double precision default 0
  , dietary_fibers double precision default 0
  , salt_equivalents double precision default 0
  , refuse double precision default 0
  , constraint compositions_PKC primary key (item_no)
) ;

-- 記事画像
--* BackupToTempTable
drop table if exists article_pictures cascade;

--* RestoreFromTempTable
create table article_pictures (
  id serial not null
  , article_id integer default 0 not null
  , path character varying(1024)
  , order_of integer default 0 not null
  , created_at timestamp with time zone default current_timestamp not null
  , updated_at timestamp with time zone default current_timestamp not null
  , constraint article_pictures_PKC primary key (id)
) ;

-- おすすめ記事
--* BackupToTempTable
drop table if exists recommend_articles cascade;

--* RestoreFromTempTable
create table recommend_articles (
  id serial not null
  , path character varying(1024)
  , content character varying(1024)
  , created_at timestamp with time zone default current_timestamp not null
  , updated_at timestamp with time zone default current_timestamp not null
  , constraint recommend_articles_PKC primary key (id)
) ;

-- お気に入り記事
--* BackupToTempTable
drop table if exists favorite_articles cascade;

--* RestoreFromTempTable
create table favorite_articles (
  id serial not null
  , user_id integer default 0 not null
  , article_id integer default 0 not null
  , created_at timestamp with time zone default current_timestamp not null
  , updated_at timestamp with time zone default current_timestamp not null
  , constraint favorite_articles_PKC primary key (id)
) ;

-- お気に入り献立
--* BackupToTempTable
drop table if exists favorite_menus cascade;

--* RestoreFromTempTable
create table favorite_menus (
  id serial not null
  , user_id integer default 0 not null
  , menu_id integer default 0 not null
  , created_at timestamp with time zone default current_timestamp not null
  , updated_at timestamp with time zone default current_timestamp not null
  , constraint favorite_menus_PKC primary key (id)
) ;

-- 献立カテゴリ
--* BackupToTempTable
drop table if exists menu_categories cascade;

--* RestoreFromTempTable
create table menu_categories (
  id serial not null
  , name character varying(64)
  , created_at timestamp with time zone default current_timestamp not null
  , updated_at timestamp with time zone default current_timestamp not null
  , constraint menu_categories_PKC primary key (id)
) ;

-- 回答画像
--* BackupToTempTable
drop table if exists answer_images cascade;

--* RestoreFromTempTable
create table answer_images (
  id serial not null
  , answer_id integer default 0 not null
  , path character varying(1024)
  , created_at timestamp with time zone default current_timestamp not null
  , updated_at timestamp with time zone default current_timestamp not null
  , constraint answer_images_PKC primary key (id)
) ;

-- 回答
--* BackupToTempTable
drop table if exists answers cascade;

--* RestoreFromTempTable
create table answers (
  id serial not null
  , question_id integer default 0 not null
  , user_id integer default 0 not null
  , contents character varying(2048)
  , created_at timestamp with time zone default current_timestamp not null
  , updated_at timestamp with time zone default current_timestamp not null
  , constraint answers_PKC primary key (id)
) ;

-- 質問画像
--* BackupToTempTable
drop table if exists question_images cascade;

--* RestoreFromTempTable
create table question_images (
  id serial not null
  , question_id integer default 0 not null
  , path character varying(1024)
  , created_at timestamp with time zone default current_timestamp not null
  , updated_at timestamp with time zone default current_timestamp not null
  , constraint question_images_PKC primary key (id)
) ;

-- 質問
--* BackupToTempTable
drop table if exists questions cascade;

--* RestoreFromTempTable
create table questions (
  id serial not null
  , user_id integer default 0 not null
  , contents character varying(2048)
  , answer_id integer default 0 not null
  , created_at timestamp with time zone default current_timestamp not null
  , updated_at timestamp with time zone default current_timestamp not null
  , constraint questions_PKC primary key (id)
) ;

-- フォロワー
--* BackupToTempTable
drop table if exists followers cascade;

--* RestoreFromTempTable
create table followers (
  id serial not null
  , user_id integer default 0 not null
  , follower_user_id integer default 0 not null
  , created_at timestamp with time zone default current_timestamp not null
  , updated_at timestamp with time zone default current_timestamp not null
  , constraint followers_PKC primary key (id)
) ;

-- 献立閲覧数
--* BackupToTempTable
drop table if exists menu_views cascade;

--* RestoreFromTempTable
create table menu_views (
  menu_id integer not null
  , date timestamp with time zone not null
  , count integer default 0 not null
  , constraint menu_views_PKC primary key (menu_id,date)
) ;

-- 記事閲覧数
--* BackupToTempTable
drop table if exists article_views cascade;

--* RestoreFromTempTable
create table article_views (
  article_id integer not null
  , date timestamp with time zone not null
  , count integer default 0 not null
  , constraint article_views_PKC primary key (article_id,date)
) ;

-- 記事詳細
--* BackupToTempTable
drop table if exists article_details cascade;

--* RestoreFromTempTable
create table article_details (
  id serial not null
  , article_id integer default 0 not null
  , path character varying(1024)
  , created_at timestamp with time zone default current_timestamp not null
  , updated_at timestamp with time zone default current_timestamp not null
  , constraint article_details_PKC primary key (id)
) ;

-- 記事
--* BackupToTempTable
drop table if exists articles cascade;

--* RestoreFromTempTable
create table articles (
  id serial not null
  , user_id integer default 0 not null
  , title character varying(128)
  , start_sentence character varying(1024)
  , path character varying(1024)
  , opened boolean default false not null
  , created_at timestamp with time zone default current_timestamp not null
  , updated_at timestamp with time zone default current_timestamp not null
  , constraint articles_PKC primary key (id)
) ;

-- 献立詳細
--* BackupToTempTable
drop table if exists menu_details cascade;

--* RestoreFromTempTable
create table menu_details (
  id serial not null
  , menu_id integer default 0 not null
  , path character varying(1024)
  , created_at timestamp with time zone default current_timestamp not null
  , updated_at timestamp with time zone default current_timestamp not null
  , constraint menu_details_PKC primary key (id)
) ;

-- 献立画像
--* BackupToTempTable
drop table if exists menu_pictures cascade;

--* RestoreFromTempTable
create table menu_pictures (
  id serial not null
  , menu_id integer default 0 not null
  , path character varying(1024)
  , description character varying(64)
  , order_of integer default 0 not null
  , created_at timestamp with time zone default current_timestamp not null
  , updated_at timestamp with time zone default current_timestamp not null
  , constraint menu_pictures_PKC primary key (id)
) ;

-- 献立
--* BackupToTempTable
drop table if exists menus cascade;

--* RestoreFromTempTable
create table menus (
  id serial not null
  , user_id integer default 0 not null
  , title character varying(128)
  , sub_title character varying(256)
  , path character varying(1024)
  , category_id integer default 0 not null
  , opened boolean default false not null
  , created_at timestamp with time zone default current_timestamp not null
  , updated_at timestamp with time zone default current_timestamp not null
  , constraint menus_PKC primary key (id)
) ;

-- お知らせ
--* BackupToTempTable
drop table if exists notices cascade;

--* RestoreFromTempTable
create table notices (
  id serial not null
  , contents character varying(2048)
  , expires timestamp with time zone
  , created_at timestamp with time zone default current_timestamp not null
  , updated_at timestamp with time zone default current_timestamp not null
  , constraint notices_PKC primary key (id)
) ;

-- ユーザ
--* BackupToTempTable
drop table if exists users cascade;

--* RestoreFromTempTable
create table users (
  id serial not null
  , email character varying(256)
  , password character varying(256)
  , name character varying(256)
  , icon character varying(1024)
  , role character varying(32)
  , available boolean default false not null
  , once_password character varying(128)
  , expires timestamp with time zone default current_timestamp not null
  , deleted boolean default false not null
  , created_at timestamp with time zone default current_timestamp not null
  , updated_at timestamp with time zone default current_timestamp not null
  , constraint users_PKC primary key (id)
) ;

comment on table menu_compositions is '献立素材';
comment on column menu_compositions.menu_id is '献立ID:menus.id';
comment on column menu_compositions.composition_item_no is '食品番号:compositions.id';

comment on table bounce is 'メール拒否';
comment on column bounce.user_id is 'ユーザID:users.id';
comment on column bounce.bounce is 'メール拒否:true: メール拒否, false: メール許可';

comment on table compositions is '食品成分表';
comment on column compositions.item_no is '食品番号';
comment on column compositions.item_group is '食品群';
comment on column compositions.item_index is '索引番号';
comment on column compositions.name is '食品名';
comment on column compositions.energy is 'エネルギー';
comment on column compositions.protein is 'たんぱく質';
comment on column compositions.lipid is '脂質';
comment on column compositions.carbohydrate is '炭水化物';
comment on column compositions.calcium is 'カルシウム';
comment on column compositions.iron is '鉄';
comment on column compositions.cholesterol is 'コレステロール';
comment on column compositions.dietary_fibers is '食物繊維';
comment on column compositions.salt_equivalents is '食塩相当量';
comment on column compositions.refuse is '廃棄率';

comment on table article_pictures is '記事画像';
comment on column article_pictures.id is '記事画像ID';
comment on column article_pictures.article_id is '記事ID:articles.id';
comment on column article_pictures.path is 'パス:s3のパス';
comment on column article_pictures.order_of is '表示順';
comment on column article_pictures.created_at is '登録日時';
comment on column article_pictures.updated_at is '更新日時';

comment on table recommend_articles is 'おすすめ記事';
comment on column recommend_articles.id is 'おすすめ記事ID';
comment on column recommend_articles.path is '画像パス:s3のパス';
comment on column recommend_articles.content is '内容:s3のパス';
comment on column recommend_articles.created_at is '登録日時';
comment on column recommend_articles.updated_at is '更新日時';

comment on table favorite_articles is 'お気に入り記事';
comment on column favorite_articles.id is 'お気に入りID';
comment on column favorite_articles.user_id is 'ユーザID:users.id';
comment on column favorite_articles.article_id is '記事ID:articles.id';
comment on column favorite_articles.created_at is '登録日時';
comment on column favorite_articles.updated_at is '更新日時';

comment on table favorite_menus is 'お気に入り献立';
comment on column favorite_menus.id is 'お気に入りID';
comment on column favorite_menus.user_id is 'ユーザID:users.id';
comment on column favorite_menus.menu_id is '献立ID:menus.id';
comment on column favorite_menus.created_at is '登録日時';
comment on column favorite_menus.updated_at is '更新日時';

comment on table menu_categories is '献立カテゴリ';
comment on column menu_categories.id is 'カテゴリID';
comment on column menu_categories.name is 'カテゴリ名';
comment on column menu_categories.created_at is '登録日時';
comment on column menu_categories.updated_at is '更新日時';

comment on table answer_images is '回答画像';
comment on column answer_images.id is '回答画像ID';
comment on column answer_images.answer_id is '回答ID:answers.id';
comment on column answer_images.path is 'パス:s3のパス';
comment on column answer_images.created_at is '登録日時';
comment on column answer_images.updated_at is '更新日時';

comment on table answers is '回答';
comment on column answers.id is '回答ID';
comment on column answers.question_id is '質問ID:questions.id';
comment on column answers.user_id is 'ユーザID:users.id';
comment on column answers.contents is '内容';
comment on column answers.created_at is '登録日時';
comment on column answers.updated_at is '更新日時';

comment on table question_images is '質問画像';
comment on column question_images.id is '質問画像ID';
comment on column question_images.question_id is '質問ID:questions.id';
comment on column question_images.path is 'パス:s3のパス';
comment on column question_images.created_at is '登録日時';
comment on column question_images.updated_at is '更新日時';

comment on table questions is '質問';
comment on column questions.id is '質問ID';
comment on column questions.user_id is 'ユーザID:users.id';
comment on column questions.contents is '内容';
comment on column questions.answer_id is 'ベストアンサー:answers.id';
comment on column questions.created_at is '登録日時';
comment on column questions.updated_at is '更新日時';

comment on table followers is 'フォロワー';
comment on column followers.id is 'フォロワーID';
comment on column followers.user_id is 'ユーザID:users.id　フォローされる側';
comment on column followers.follower_user_id is 'フォロワーユーザID:users.id　フォローする側';
comment on column followers.created_at is '登録日時';
comment on column followers.updated_at is '更新日時';

comment on table menu_views is '献立閲覧数';
comment on column menu_views.menu_id is '献立ID:menus.id';
comment on column menu_views.date is '日付:yyyyMMdd形式';
comment on column menu_views.count is '回数';

comment on table article_views is '記事閲覧数';
comment on column article_views.article_id is '記事ID:articles.id';
comment on column article_views.date is '日付:yyyyMMdd形式';
comment on column article_views.count is '回数';

comment on table article_details is '記事詳細';
comment on column article_details.id is '記事詳細ID';
comment on column article_details.article_id is '記事ID:articles.id';
comment on column article_details.path is 'パス:s3のパス';
comment on column article_details.created_at is '登録日時';
comment on column article_details.updated_at is '更新日時';

comment on table articles is '記事';
comment on column articles.id is '記事ID';
comment on column articles.user_id is 'ユーザID:users.id';
comment on column articles.title is 'タイトル';
comment on column articles.start_sentence is '詳細文頭';
comment on column articles.path is 'サムネイルのパス';
comment on column articles.opened is '公開フラグ:true: 公開, false: 非公開';
comment on column articles.created_at is '登録日時';
comment on column articles.updated_at is '更新日時';

comment on table menu_details is '献立詳細';
comment on column menu_details.id is '献立詳細ID';
comment on column menu_details.menu_id is '献立ID';
comment on column menu_details.path is 'パス:s3のパス';
comment on column menu_details.created_at is '登録日時';
comment on column menu_details.updated_at is '更新日時';

comment on table menu_pictures is '献立画像';
comment on column menu_pictures.id is '献立画像ID';
comment on column menu_pictures.menu_id is '献立ID:menus.id';
comment on column menu_pictures.path is 'パス:s3のパス';
comment on column menu_pictures.description is '画像の説明';
comment on column menu_pictures.order_of is '表示順';
comment on column menu_pictures.created_at is '登録日時';
comment on column menu_pictures.updated_at is '更新日時';

comment on table menus is '献立';
comment on column menus.id is '献立ID';
comment on column menus.user_id is 'ユーザID:users.id';
comment on column menus.title is 'タイトル';
comment on column menus.sub_title is 'サブタイトル';
comment on column menus.path is 'サムネイルパス';
comment on column menus.category_id is 'カテゴリID:categories.id';
comment on column menus.opened is '公開フラグ:true: 公開, false: 非公開';
comment on column menus.created_at is '登録日時';
comment on column menus.updated_at is '更新日時';

comment on table notices is 'お知らせ';
comment on column notices.id is 'お知らせID';
comment on column notices.contents is 'お知らせ内容';
comment on column notices.expires is '有効期限:yyyyMMdd形式';
comment on column notices.created_at is '登録日時';
comment on column notices.updated_at is '更新日時';

comment on table users is 'ユーザ';
comment on column users.id is 'ユーザID';
comment on column users.email is 'メールアドレス';
comment on column users.password is 'パスワード';
comment on column users.name is 'ユーザ名';
comment on column users.icon is 'アイコン:s3のパス';
comment on column users.role is '権限';
comment on column users.available is 'メールアドレス有効性:true: 有効, false: 無効';
comment on column users.once_password is 'ワンタイムパスワード:メールアドレス確認用のワンタイムパスワード';
comment on column users.expires is 'ワンタイムパスワード有効期限:yyyyMMdd hh:mm形式';
comment on column users.deleted is '削除フラグ:true: 退会済み、false: 未退会';
comment on column users.created_at is '登録日時';
comment on column users.updated_at is '更新日時';
