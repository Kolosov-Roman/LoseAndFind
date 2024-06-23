-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Июн 22 2024 г., 17:39
-- Версия сервера: 5.7.35-38
-- Версия PHP: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `liteweb_topka`
--

-- --------------------------------------------------------

--
-- Структура таблицы `Ad`
--

CREATE TABLE IF NOT EXISTS `Ad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idClient` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `town` varchar(300) NOT NULL,
  `image` varchar(100) NOT NULL,
  `metro` varchar(50) DEFAULT NULL,
  `region` varchar(300) DEFAULT NULL,
  `street` varchar(300) DEFAULT NULL,
  `house` varchar(10) DEFAULT NULL,
  `dataPublication` datetime NOT NULL,
  `description` text,
  `idStatus` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idClient` (`idClient`),
  KEY `idStatus` (`idStatus`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `Ad`
--

INSERT INTO `Ad` (`id`, `idClient`, `title`, `town`, `image`, `metro`, `region`, `street`, `house`, `dataPublication`, `description`, `idStatus`) VALUES
(43, 16, 'фывфы', 'Московская область', 'a18d76e9-1a58-4232-940b-e23d48501750', NULL, NULL, ' Средняя улица', ' 7', '2024-06-21 18:41:13', 'фывыф', 1),
(44, 16, 'ыфавыа', 'Москва', '79ed6917-6b59-41a7-959a-d8b9850b59ce', NULL, NULL, ' Трубниковский переулок', 'Москва', '2024-06-21 18:42:17', 'ываыв', 1),
(45, 16, 'ываыва', 'Москва', '2fae62d8-7726-4917-b29c-42d04e4fa581', NULL, NULL, ' Трубниковский переулок', 'Москва', '2024-06-21 18:42:59', 'яаыва', 2),
(46, 17, 'hjk', 'Москва', '071b0649-a44c-4f3b-8ce5-e6fdc1d48dc6', NULL, NULL, ' улица Новый Арбат', ' 21с1', '2024-06-22 16:50:31', 'asd', 2),
(47, 17, 'dsfd', 'Москва', '53649267-d9c0-4b47-9809-16941e7d2bce', NULL, NULL, ' улица Новый Арбат', 'Москва', '2024-06-22 16:50:57', 'kl;', 1),
(48, 17, 'dfs', 'Москва', 'e7637c13-cb36-4076-8683-238d09fcd1a7', NULL, NULL, ' улица Новый Арбат', 'Москва', '2024-06-22 16:51:46', 'asd', 1),
(49, 17, 'sdfsd', 'Москва', 'cf097283-7372-4e9e-8c32-6f7e0706c07b', NULL, NULL, ' улица Новый Арбат', 'Московская', '2024-06-22 16:52:29', 'dsf', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `AdInLikes`
--

CREATE TABLE IF NOT EXISTS `AdInLikes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idClient` int(11) NOT NULL,
  `idAd` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idClient` (`idClient`),
  KEY `AdInLikes_ibfk_1` (`idAd`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `AdInLikes`
--

INSERT INTO `AdInLikes` (`id`, `idClient`, `idAd`) VALUES
(87, 16, 43),
(88, 16, 44),
(93, 17, 43);

-- --------------------------------------------------------

--
-- Структура таблицы `BreedCat`
--

CREATE TABLE IF NOT EXISTS `BreedCat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `BreedCat`
--

INSERT INTO `BreedCat` (`id`, `title`) VALUES
(1, 'Мейн-кун'),
(2, 'Сфинкс'),
(3, 'Манчкин'),
(4, 'Бурма'),
(5, 'Шартрез'),
(6, 'Тойгер'),
(7, 'Сиамская'),
(8, 'Персидская'),
(9, 'Питерболд'),
(10, 'Экзотическая'),
(11, 'Сококе'),
(12, 'Европейская'),
(13, 'Египетская мау'),
(14, 'Сибирская'),
(15, 'Пиксибоб'),
(16, 'Тайская'),
(17, 'Сомали'),
(18, 'Метис');

-- --------------------------------------------------------

--
-- Структура таблицы `BreedDog`
--

CREATE TABLE IF NOT EXISTS `BreedDog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `BreedDog`
--

INSERT INTO `BreedDog` (`id`, `title`) VALUES
(1, 'Лабрадор'),
(2, 'Бульдог'),
(3, 'Шпиц'),
(4, 'Чихуахуа'),
(5, 'Самоед'),
(6, 'Пекинес'),
(7, 'Такса'),
(8, 'Долматинец'),
(9, 'Корги'),
(10, 'Хаски'),
(11, 'Мопс'),
(12, 'Спаниель'),
(13, 'Бультерьер'),
(14, 'Питбуль'),
(15, 'Пудель'),
(16, 'Метис');

-- --------------------------------------------------------

--
-- Структура таблицы `Client`
--

CREATE TABLE IF NOT EXISTS `Client` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `image` varchar(300) NOT NULL,
  `numberPhone` char(12) NOT NULL,
  `dateRegistration` date NOT NULL,
  `idTypeUser` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idTypeUser` (`idTypeUser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `Client`
--

INSERT INTO `Client` (`id`, `name`, `image`, `numberPhone`, `dateRegistration`, `idTypeUser`) VALUES
(10, 'Роман', 'f7020a43-85fa-4198-a343-e467207e6c7a', '89214496940', '2024-06-15', 1),
(11, 'Санёк', '53d43eae-1db5-41cb-9db8-928ed684c9d6', '89117541707', '2024-06-15', 1),
(12, 'Василий', 'f78d3f9f-7f38-41b5-a4de-613e0dbdda9f', '89213594334', '2024-06-20', 1),
(13, 'Роман', 'e8cd3522-afb0-4423-a6eb-c97b25a30e26', '89213947194', '2024-06-20', 1),
(16, 'Александр', 'c93122d5-67d1-4b22-a4c3-6c37739861f2', '89117141917', '2024-06-21', 1),
(17, 'Роман', '96f220ae-6358-425c-8fcb-92ae8169d13e', '89214496940', '2024-06-21', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `Color`
--

CREATE TABLE IF NOT EXISTS `Color` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `Color`
--

INSERT INTO `Color` (`id`, `title`) VALUES
(1, 'Белый'),
(2, 'Чёрный'),
(3, 'Голубой'),
(4, 'Шоколадный'),
(5, 'Серый'),
(6, 'Лиловый'),
(7, 'Коричный'),
(8, 'Красный'),
(9, 'Кремовый'),
(10, 'Серебристый');

-- --------------------------------------------------------

--
-- Структура таблицы `LoseOrFind`
--

CREATE TABLE IF NOT EXISTS `LoseOrFind` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `LoseOrFind`
--

INSERT INTO `LoseOrFind` (`id`, `title`) VALUES
(1, 'Потерялся(ась)'),
(2, 'Нашёлся(лась)'),
(3, 'В добрые руки');

-- --------------------------------------------------------

--
-- Структура таблицы `MaleCat`
--

CREATE TABLE IF NOT EXISTS `MaleCat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `MaleCat`
--

INSERT INTO `MaleCat` (`id`, `title`) VALUES
(1, 'Кот'),
(2, 'Кошка');

-- --------------------------------------------------------

--
-- Структура таблицы `MaleDog`
--

CREATE TABLE IF NOT EXISTS `MaleDog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `MaleDog`
--

INSERT INTO `MaleDog` (`id`, `title`) VALUES
(1, 'Кобель'),
(2, 'Сучка');

-- --------------------------------------------------------

--
-- Структура таблицы `Pet`
--

CREATE TABLE IF NOT EXISTS `Pet` (
  `id` int(11) NOT NULL,
  `idBreed` int(11) NOT NULL,
  `idType` int(11) NOT NULL,
  `idColor` int(11) NOT NULL,
  `idMale` int(11) NOT NULL,
  `IsChipping` tinyint(1) NOT NULL,
  `IsCollar` tinyint(1) NOT NULL,
  `IsCastrated` tinyint(1) NOT NULL,
  `idLoseOrFind` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idColor` (`idColor`),
  KEY `idLoseOrFind` (`idLoseOrFind`),
  KEY `idType` (`idType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `Pet`
--

INSERT INTO `Pet` (`id`, `idBreed`, `idType`, `idColor`, `idMale`, `IsChipping`, `IsCollar`, `IsCastrated`, `idLoseOrFind`) VALUES
(43, 1, 2, 1, 2, 1, 0, 0, 1),
(44, 1, 1, 2, 2, 0, 1, 0, 1),
(45, 3, 2, 1, 2, 0, 1, 0, 3),
(46, 1, 2, 3, 2, 1, 0, 0, 2),
(47, 2, 2, 2, 1, 0, 0, 1, 2),
(48, 2, 1, 1, 1, 1, 1, 0, 1),
(49, 2, 2, 2, 1, 1, 1, 0, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `Role`
--

CREATE TABLE IF NOT EXISTS `Role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `Role`
--

INSERT INTO `Role` (`id`, `title`) VALUES
(1, 'Клиент'),
(2, 'Менеджер'),
(3, 'Администратор');

-- --------------------------------------------------------

--
-- Структура таблицы `Service`
--

CREATE TABLE IF NOT EXISTS `Service` (
  `id` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `type` varchar(50) NOT NULL,
  `experience` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `StatusAd`
--

CREATE TABLE IF NOT EXISTS `StatusAd` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `StatusAd`
--

INSERT INTO `StatusAd` (`id`, `title`) VALUES
(1, 'Активное'),
(2, 'Удалённое'),
(3, 'В обработке');

-- --------------------------------------------------------

--
-- Структура таблицы `Type`
--

CREATE TABLE IF NOT EXISTS `Type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `Type`
--

INSERT INTO `Type` (`id`, `title`) VALUES
(1, 'Собака'),
(2, 'Кошка');

-- --------------------------------------------------------

--
-- Структура таблицы `TypeUser`
--

CREATE TABLE IF NOT EXISTS `TypeUser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `TypeUser`
--

INSERT INTO `TypeUser` (`id`, `title`) VALUES
(1, 'Частное лицо'),
(2, 'Компания');

-- --------------------------------------------------------

--
-- Структура таблицы `User`
--

CREATE TABLE IF NOT EXISTS `User` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idRole` int(11) NOT NULL,
  `login` varchar(100) NOT NULL,
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idRole` (`idRole`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `User`
--

INSERT INTO `User` (`id`, `idRole`, `login`, `password`) VALUES
(10, 1, 'romantica69@yandex.ru', 'password2'),
(11, 1, 'caxa_2004@mail.ru', 'password2'),
(12, 1, 'alekkolosov63@gmail.com', 'password2'),
(13, 1, 'alekkolosov64@gmail.com', 'password2'),
(16, 1, 'alekkolosov62@gmail.com', 'password2'),
(17, 1, 'alekkolosov61@gmail.com', 'password2');

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `Ad`
--
ALTER TABLE `Ad`
  ADD CONSTRAINT `Ad_ibfk_1` FOREIGN KEY (`idClient`) REFERENCES `Client` (`id`),
  ADD CONSTRAINT `Ad_ibfk_2` FOREIGN KEY (`idStatus`) REFERENCES `StatusAd` (`id`);

--
-- Ограничения внешнего ключа таблицы `AdInLikes`
--
ALTER TABLE `AdInLikes`
  ADD CONSTRAINT `AdInLikes_ibfk_1` FOREIGN KEY (`idAd`) REFERENCES `Ad` (`id`),
  ADD CONSTRAINT `AdInLikes_ibfk_2` FOREIGN KEY (`idClient`) REFERENCES `Client` (`id`);

--
-- Ограничения внешнего ключа таблицы `Client`
--
ALTER TABLE `Client`
  ADD CONSTRAINT `Client_ibfk_1` FOREIGN KEY (`id`) REFERENCES `User` (`id`),
  ADD CONSTRAINT `Client_ibfk_2` FOREIGN KEY (`idTypeUser`) REFERENCES `TypeUser` (`id`);

--
-- Ограничения внешнего ключа таблицы `Pet`
--
ALTER TABLE `Pet`
  ADD CONSTRAINT `Pet_ibfk_1` FOREIGN KEY (`idColor`) REFERENCES `Color` (`id`),
  ADD CONSTRAINT `Pet_ibfk_2` FOREIGN KEY (`idLoseOrFind`) REFERENCES `LoseOrFind` (`id`),
  ADD CONSTRAINT `Pet_ibfk_3` FOREIGN KEY (`idType`) REFERENCES `Type` (`id`),
  ADD CONSTRAINT `Pet_ibfk_4` FOREIGN KEY (`id`) REFERENCES `Ad` (`id`);

--
-- Ограничения внешнего ключа таблицы `Service`
--
ALTER TABLE `Service`
  ADD CONSTRAINT `Service_ibfk_1` FOREIGN KEY (`id`) REFERENCES `Ad` (`id`);

--
-- Ограничения внешнего ключа таблицы `User`
--
ALTER TABLE `User`
  ADD CONSTRAINT `User_ibfk_1` FOREIGN KEY (`idRole`) REFERENCES `Role` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
