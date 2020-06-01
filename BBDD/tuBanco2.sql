CREATE DATABASE  IF NOT EXISTS `bankonter` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `bankonter`;
-- MySQL dump 10.13  Distrib 8.0.20, for macos10.15 (x86_64)
--
-- Host: 127.0.0.1    Database: bankonter
-- ------------------------------------------------------
-- Server version	8.0.20

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `contrato`
--

DROP TABLE IF EXISTS `contrato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contrato` (
  `id` int NOT NULL,
  `descriptor` varchar(45) NOT NULL,
  `saldo` float NOT NULL,
  `limite` float DEFAULT NULL,
  `idTipoContrato` int NOT NULL,
  `idUsuario` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_contrato_tipoContrato1_idx` (`idTipoContrato`),
  KEY `fk_contrato_usuario1_idx` (`idUsuario`),
  CONSTRAINT `fk_contrato_tipoContrato1` FOREIGN KEY (`idTipoContrato`) REFERENCES `tipocontrato` (`id`),
  CONSTRAINT `fk_contrato_usuario1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contrato`
--

LOCK TABLES `contrato` WRITE;
/*!40000 ALTER TABLE `contrato` DISABLE KEYS */;
INSERT INTO `contrato` VALUES (1,'ES11 1111 1111 0000 0001',42453.9,0,1,1),(2,'ES11 1111 1111 0000 0002',7698.65,0,1,1),(3,'ES11 1111 1111 0000 0003',174223,0,1,1),(4,'ES11 1111 2222 0000 0001',234.65,0,2,1),(5,'ES11 1111 2222 0000 0002',654.87,3000,3,1),(6,'ES11 1111 3333 0000 0001',42452.3,0,4,1),(7,'ES11 1111 3333 0000 0002',7698.96,0,4,1);
/*!40000 ALTER TABLE `contrato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imagen`
--

DROP TABLE IF EXISTS `imagen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imagen` (
  `id` int NOT NULL,
  `contenido` longblob,
  `miniatura` longblob,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagen`
--

LOCK TABLES `imagen` WRITE;
/*!40000 ALTER TABLE `imagen` DISABLE KEYS */;
INSERT INTO `imagen` VALUES (1,_binary '�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0_\0\0\0d\0\0\0���\0\0\0bKGD\0�\0�\0�����\0\0\0	pHYs\0\0\0\0\0��\0\0\0tIME�	$�>\0\0\0iTXtComment\0\0\0\0\0Created with GIMPd.e\0\0 \0IDATx��w|TU�ǿ�LK&e� �T�$��mi�Ե���\n*� ��\n�eQv���bX��₈�\"H	]B��RI#�Lf��\\2		&����g>��e��;�y��SιBmm��/�\'i�/��ϲ�?ٍeY�������l�_�o������`���TWWNRR�۷�Yu��S\0��G���SXX��f��͍��\0�ʳ�>Kpp0uuu�<���d;�$Q\\\\LRR�ϟw�����y�嗙4i���(ʭK�n���h4�ر���R�ǭV+<��3<���B$I���jeee���랷u�V�����/PA\\]Ah��/�_�L&�ؼ���C��;�P^^�,�h�Z4\Z\r��`�X����ҥK��f�v�z�,�H���17���l6:v��D1��jkky��W���\"99���ZJJJ())������:EA����ၟ�~~~�k׎��BCC�����,�\Z\\Q���\"66�����>  �����2!Y�	&<<�Ν;���ȠA�����f�Q__��_t:���?~���I��ù��;y��\'�֭��Y�����G�ɿ���uoooF������\Z������\"++�������ѣy�������I����Í����������ٳ���W��n�c6�9t�6l`ݺu���T����%K��i�&�͛ǯ�k�f�O�4s���n�\r%���<֯_���wjj*���8�V�(�Ȳ�N�#22�aÆ��3�лwo���)..�j��(\n�[���L�^��j��>��(b��X�dɏ���ngϞ=TWWӫW/�zLQu4���0q�D�����̤���Պ�ng�Ν���гgO�F�� ��Ȟ={X�zu�]w߾}TVV�����hl���lX�V���x���Q���L���\08|�0.\\�o߾����z���F�!%%�)S�PSSӪ�?x� �q�xyy�d2V�A��{�����ɓ�=HOO����!C�����\0_�׳r�J�M�FIII��#==�cǎ1`�\0|||\Zu��V+�����ݛ\'N���\r@ZZ\Z����9��ڬQ,�\"�$��EQlv��PM�^ϗ_~�SO=ENNN�wtbb\"�V�\"22��Ҥ�?y�$O<�T����y��\'���C�$\\W�������\Z,6�\rI�0x{{����t���E��/I���L�0��{����_~٢k�K�[�d8k��up��k4\Z�w�NNN���lܸ�&�X�e����رcU�w�}GXX�N�����:u�3gΐ��Mnn.eee��fEQ?��t:AAAt�҅��$�Bpp�P[[��姴�T�2e��e�@y�嗕�{�:�k�#��K��.�&\ZE�����`�\0�^9f��a���ŋ��(ʉ\'�ɤ�=Z���T��ꔚ��F�QQ��w�U�z�(�(*>>>���{�������[QE�o�K���~ː!C��_��W���P]]Mppp��O��W}Aqs��k���\"�k�c�6mb���xzzңG�w�N߾}���������FGEA��s�}��e˖f�hAAq�x�\n�U�vl6������ٺu��U��Y���b֬Y�vXXo��Z�OOOBCC�\ZfxË���!�\0�P���5�`������L�:��Ǐ���͢E�E��={2b�����С&�	���{�Gbb���DQ��h����ހ^�G�7`2�������������͊��LUU%%%�\\(����2��J��6_E6o�����U=��/��(��H�Ν�v-��wx���k	>������8q\"iii���1g�***رc;v�`�����ȑ#6l}��%&&�I�&1o�<\0�������7\0_?����6y#�2�b�����rY6@\0��:_�DP\n/p<#K]��Hh3�Ea�����]w����ÑeY��qqq|��W.�_��8I�p�SXs/�8�i�O��d4s֬Y�;����h�\"��n���ؽ{7��9)))�Z��A�1r�H*++�F�����{�*��R��O���O7�pv��/�2�7o&33\0����Q�\r\rU�� t�ҥ�k|^�{A{G�@��Z�����1x�+����1��5�,���[<�裼���̛7O��0���d�͛Ƕm�سgO� [��rjkk��%��v�vf�� ��̵��/V�;w�����x�;vl��v��1c��||x`��N������`،�yg��DFD��4��\r\Z����O��w���>H}}=nnn:���j�9��E�\'~�$�>���Mu�A�j�Ү];.]���	X�lY��ynn.111X�Vt:�=�ӦM���Wub.\\�&�t��hHNNf˖-<x�:\0��g�1m�4.\\���g0x���5��z�-iFw���J�H�F��믿V�6�L8��nnnt���F�����ӧ��qwww�����_ee%���\\7&�t�R?~<�ׯgѢE̜9�iD���ݿ���n	m�ou�QK����W�^.%H��Mxxx������>}:\'O�$%%����&����bɒ%�{���׏��\'�޽G\"o�e~��.��������F����\ri\'�ڢG��Ҝ��ԩ�� �F�!\"\"����KYjj*O=�[�l���u�(--����������C�<�������e�]�ղ��?�a�ϓ�}�E�O�FCA~� �-�YYYj�SHH�J=]y����4Z�vm���`Μ9<�������<p��m۶�I�&���S[[���楗_��?LG��F��:���̣ ?�C��՗�ju�zf77w���͊��@�Ѵ��q���\nU7z~mm-�6m�ҥK����HII�k׮�FJKK���`߾}TWW���O3~�x��Û|��\'O����k�RPP�tlȰ_�Ą���9�\nl�����_�#e�\nBBB��WR�JP�F�޶��z���ȶ������~�&�������4�|wwwN�:Ŷm�0�͸����O?�СC��̻ۚ^�x�7�|�O?����\'`����Ë3�s� <=��ULe6�yj�3177w�CB��o<\\- `p3�~�jޛ�6�y�t�t��	/\\m�k, ((//�	��}��u�V,V�UM����&umyy9o��K�.������}2��<��7�$5��MQ܍F:��5�F�M���p�/�+媳զ�k4\ZU�)��r�k;�СC:t��ӧ�q���/IR��ƕzy��wY�b�K��9&��^~�.]�9z#a��ښ\Z��|1KിgϞm��Ǳ]XX貃�-[F@@\0�ƍ㫯�jQjQQjjj���`׮]|��l߾��}������eԘ�\\H� *9�1sA�n�s� ���=�o����gΜ�+����h�*�ϳ}��=z��� j�.[�~=Ç\'((oooJKK��퍪)��Lii)%%%ddd�q�F6n��ŋ]�:�E0x�p�O���K]]m�m6��r�L&;u\",,↪�5\Z\r��K��[sgS|M�?~|�U�w�����ٸq#�O�V���ŋо}{l6�,�k�.���������tPVV�t͒�\n�p��ϟ����>|�}���l��L\\׮��7�����v���P[[�R���:����8}�$��֙%�LiQ�(^���Hg�\'���58\'<<����%3�[C������/���I�***ؼy3���\ZI�X�j�$a�Zٲeeee�;w�9s�PSSCQQEEE��瓛��dE�F����=��+����\'t��n�b�p���I�������Z<u�Vk�u:=���|�jV����g\\��(A�Q�5�FCee%��IIIq��%I\"((�ɤ2���\\������^�\0�$���ۉ=���o_�%� ((�v��#�2�+���555�[�	;w|�}Cň�c�뵊��F�a��,_���d�}���j�\\N�?���̚5˩��G����ٹs\'O?�4�N�r�t}��IUU%iG�o5{Lb��$�я���0\Z�������\ZT�D]��f�jkq7\Z�-��t���ض�K��Y��7�;���g�y��+W�������<�,�̜9���~�IR�F���#F�Ϸۿ慩�o��� \"�;ҹsq]��oo�ʟ�6�?��^Q�Z�u�dEQDQV,]��E���%�����CxD$���V����l2�$����|~�����7�8���I}xqƫ�GDR__Ϡ����Ƣ�h��#I�/S:��V���h��n����ɇ��ڵG�Ѣ(v�ص���:�ZǊ�`���n�7��˛���:7ܸ���:|$Z����W_~��Ӈ���FDn.�v���۷3y�d5=x�V2v�oxb�S���A���w~H,����~ũ��_�XZ�$���s�s�b*��yv��v��Q!�\"\nP~�����X�d�p�����N��LDd�A9zd?yy�U�<`�\0�����!7���z>��C^y�\'O�wR���s��ۏ����yu��-�������a�Z�C���%Ե�������Cz��|�~\r������EEw�_�A�Nꃢ(���+��Ήj&&&r�=�4I ��o�Zy�7�7o�j��z==�OLx_?�ԺU5YF#�X��f��lv:����!�(͔z�F�,k�<}�ݻv�c�6�����h���Jb��$�썻��it�t:֯[MQ���#G��#�z���S��d�U�۵d��<�WH�Ԫ�6�V�ٳ�9|� �{$Ѭ0�����Ѯ}{;��?��YGrD%�g�����ٿo/�3�������ѯ?�cb����j�:���8�v�o�٪��ҥ&L�.mn�j��z{�1V�\\�ݑg��퉽�d�d�N��n�b��f�^w�������%��Y��X��3��슽y��J1��H�(�F�$��޽�՟����)..j@o�ԙ{#*�#�+�k�)J�U�|���>uRI�~�)�G�����ƀ�2e\n)))W��61�q�5d�$q��f�4\r77w^����vi҃�$�����dgS]]��3��;�I������x&W|�11�b��n�\'�+�CΞ9C}}�頝;�2|�h\"���$Y�TW�T�v>���d�>��衇��K��z=˗/gٲe�			��7�!6�k�<P�Vǻ��!\'�\0��Z��Kuu}�41�Wq]�ٻ�;���O��n-r�S�y��Y��֬��SE����wK`Ĩ���vc�[@��o���ۯ�s���y���������e��Ǐ3w�\\�X��db�ks��ֽ���n�ѩSG@�������⠛���/��x{�Z<G��|���R]]Ez�Q>��c�������2�F#q]�:l�!�\r���jG�b�OU�d0X�f\r�+|�E�;��,�̙3����gx�=TUVB3íf����N��プ�7#F�qYt�,nn����9�.]��������ܾ��[6S\\\\�2���ߎ�n	��ן���X,�fǔDQ�xF:�XFM�%U���� >>�EEV�Ւ��~����A���c�/S�ƹ5Z-��yŮ`6׵(�Ҕ�	��$IȲ��l�L�iΞ9MZ���O�ˉ��\\�&8$���H��ӵ[FO,fs���9th?��r55(I�f�\"99���m��=z��aN�<��2�,f�\r�浭4�PDd��V��l��xF:iG�p,�(�O�\"��I����Ãظ���)�ȨhB;�!�\"V��E� h�Z�޺��[��j7DQ���gʔ)7�	���999��u\'$��O�8�e��\\	[Wp�@*���9��\n\n(..lt:i\\��$tO$\"2\n_??<<<U&��e_$IB>�$���~��Q�<y2ӧO�`0�N��gm6���xyy9�3�usL�����8{6��=�س�;�g�SUUImMm��\Z�\"H��]�0zx���eY\r��H�e���JR>�\'��w*�y���y���j�7,��CE��v��|Na��m�H�cƞc���s��>���a_�����0 {��988��;��=���~\r���Q�H3~�ϥd��r������/��ec��G�DDD����]�����̘5�Aw݋p�d��&���T*v;6�E�S]]M橓dK#-�{ҏ~Oy��&�%	Y��N��$ܞH�v�*=l�U�f3����8���˖-#99�U��Q���9s&��_����ߟAw�G|���#pw7\"�2�(\"8�\r���jN�/^������<rsϓ�}���3T6�\0wr�zF����H���5//oUw��=E	��L�>��59|Щ�u�Ɗ+���o�x�SlG�$���x���裏(//o�yyy_�N���`3�P�����*O<==���\" �a�DDD�!L]#�j�5;Z��j��)�����T6o��d�L&�ƍc���Ny�V�ad�V+k֬a�ڵ�ܹ����V��F�&|L>������@\0��h��n���J�\ZtQ��=ϡ��Iݳ���<�s�����ɓ=z�˂�Vߡ�t:;vL��9q�9996K��C0�������__<��/\'��F<��=<��t��U:�CR,��������ӏ�{޹���ۛiӦ1v�X\"##��Z�t4U��pݭV+���\\�t���Z����xmm��	7nd���N����\'y��$$܎�nW��)Ķn�(���?N��0;vl\'��I*+*\ZH�	�2e\n����VU3-���յ�Ƒ�Z�`�g�V\r� ��\'0r���b���S�~%�#I%�E���ͮ��RVV��bi��Æ\rc���t�������R8Zu6�^�g���L�4�.8=�(�t�O���C������:�(\n���9|�}�{8{�4�]q#�߿?�g�&11Q�9���ػw/��~;���m&,�>T��QTTĳ�>˦M�\\��==����v�v�\'4,�N�,�H�e��Aa���*�\r�݆�z�0W_��|�9N�:���(�jj���`0���ŀx��HJJR�ł PYYIxx8555��׏�?������q4�b�Q�j�lݺ���{O]���־} �A!��c2���鉛��Vse�eЭW�Luu�唕�Q\\\\ȅ���c��-AAADDD0|�p����СC��eEQ�ĉt���\n+3�p�B~�����c��z(��֭[ٰa���#--���Ws���݉���cǎt�ޝ���ӧODQlr]e��N׮]9{�,\0����;w��_�k��:k��9}�4G��ȑ#9r���t�/1�����Ett4�:u\"66���h|OOO�v;���j.\0h4D0�|f̘q9B\Z�ʕ+���mu���!�2�����������$\'\'�.PZZ�.X]__�&���������ח���LDDaaa�����兏�>>>h4\Z5�XI������?$&&��~�e��̙3�z���7r�w��޿�K��l6DQ$00P��y�wb�Xԙ�W��\0����dYV�9\'I��*�kAu�~Ĉ�;w���@|||2dH�sCBBx饗x��y��G���i�#�\no��h4����h�\"����2e�˹W� ���E]]� 0q�D/^�R�8���oo��xQ���d����ܹ�rb�C��~\'&�x�����Y�f\r�����N~~>���\r:�j����\r�-�8�]p�����`�Z���~��hD����`h�6G����ܹs��緺S�_��n\'  �^�z��w���ٳgt��je���,\\��ٳg3gΜF��u�V�ZŐ!C;v,����������vF�\Z������b�\n�E&�b�����_|��gA�����k�r��9���ϒ%KZ��Q���q�q��Xߕ����a6��e��r�z��___\"#X�bŊ��=��wT\'�=Z����|8�R��r�vŊ��׏�˗7��N��많���\"6o���5��;�����ե<<<���n�j����L�:�]�v�ꫯ����@����8p �ŋ���e����xzzr��V�\\Ijj*&��Q�T�$����ߺb<6����PU��m�Faaa�p�[�e�v���� ƍ��dj��~��\Z\Zʂ5j.$**�e(�1c0�L����V�~�V}�$ITVV\"�r��|:�N��M�I�x�gHMM�G�,\\��UR��$�����w߱r�J����0a�2�\\��\"���ޅ\n\nj�wkݒ�[�V��C�\0X��Z�\0\0OIDAT�|9�=�X��>|�����ĉ]&���֌l�ܢ��z\0�o��������j�W.**b�ܹ�]��NG�Ν�۷o�L�����^��}�Qu{۶m�?ޥ���jQ��lfѢE���������5����8|�pu�`G			jǬ_��A���[ؼ��3f���n�:�3�EaĈ�����h�ر��:�6�[�jlذ���d�3>�4���z=6l�̙3<��#xxx��oY�+�\"			:��{�r�}����@����ᦾ\'���|A���\"##���$5@��|�2��#˲�;s�S��-�nd�MS���~��i���si�l{}�J�w	\0\0\0\0IEND�B`�',_binary '�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\0\0\0\0\0\0\\r�f\0\0JIDATx��wX���?pTA@,4A�{��c�QQc71Fc�&��&��Ǝ1��Q#�X��Q�J�w���X!\ZAA���y�{ngg��wgg�b$���A���\r\r����ܺu��ׯs��]�����Q�JJ�*E�2e�P��+W�J�*8;;K��B�HQ\0�����9~�8˗/�ƍ/��������k���������<==�3g-Z��bŊ�T*���P@(\n����tܾ}�!C�p��\0,--)]�4ݺuc�С4m��855��7�e�n߾Mtt4� P�fM֭[���\'������s���W�����q��8::bkk�����]��������#���V\0@���v��Q u���Ȫ;/###a���BZZ��]��`\0$%%	}��T*�\0u��nݺ%�����G����C���lٲ;w����>�o�V�Z%4k�,�����P�bE�ĉRw��s s:$�-[V\0�2e��/_222�]�\r�*U���� T�REؼy�$$&&\nϞ=>��S,,,��˗�XWtt�p������J������5k\nG�����=��1ӦM����J%|��2�޳g�P�R�����E��;w��X���˂���\0�RSS_[��;w�)S��������н{w!99Y�,�(\n@�t��Q\0www�ܹs������B�Ν@puuV�Z����Ijj�лwo ������ׯ�z��z=X�n]��\\�\0dFrr�P�Z5\Z5j$<y�$_�edd۷o,--aܸqBRR�[�5t�PF�����-[�666 ,_�\\�h4Eާ�EȈ���bŊ t��1ߋ|III¸q�@����-c׮]@�;wn��svv\0a����x��; 4\ZM���ԩS��KMM\Z4h 	��N��Z�vm�;������@����?A���L\n٣(\0���d�رc��+g�����[tt�`nn.8;;��:�Z-xxxFFF_~Y�2)d��\0d��)S@h֬���j�]����[=���?� \0�����t��Ǐ���\\,4�DS`=��ǇQ�FaffƘ1cx��I�YnJJ\n)))9^kkk���)������p��%BBB�4i�F���ۻP��h4Ԯ]�\'O����U�����e��T�V��7om�3�Gh4\Z�ݻ����9}�4AAA\\�~�Z�R9��`l�l��:��B�A�ҵ���ajj���+�*U�jժԯ_�\r\ZP�Z�|�g׮]8�!C��e˖<]��{�u�V�.]�ԩS��+���k׮q��E8��3g�\\t�JB����m�A�\nP��;�����/\"\Zb��xB��c��Ș�999ѹsgڶmKÆ\r�Y�f�����QQQ���baa��ko߾MժU���$66s�|4Z!GP�h�Z�ܹ�֭[Y�nO�>Ee.N⓽Em��\Z<%p�\ng�¡p?B�B�F<gccÔ)S�޽;իW���:Wu�ܹ�A����G�F��$ϰa����_��Z�ܡ(�\" ##���(6l���ٳ���J��~���ͤ�2{�^�_�C@�&���K�>}���O�^��k�����)_�<�+W&((##�\\�;00����S�~}.^���kr��\0\n�\'N0|�pBCC�[~�\n5<����X�Kw�6���z�쉏�O�F@\\�LHH :::k127$%%Q�dI\0��ⰵ�������\"iii�;;;;ڷo��&��_���p�G�~���!���>\r��o�>���iݺ5Ϟ��������{Y[[ӻwo\0����n�A�(�$!!��#G���Ⱥu�hT9�u�:7����5&&�hS�����\nx���������LӦM����*?t�P������Ç�n�A�(� --�����f�Mt��ș�cTv�g��Z�	�p���!���6mJ���9y�$%K�����<�߮];\0._�,uS\r%P[>ٿ?\'N�ѣG���fC�ZRK%\r%,`@;���ױz�	:t8�����)�XZZbll�����n�A�(��$..��cǲk�.�a�T�Yj��0�;jK��X�}#ii�L�ٳg8::�.###e��Q^� \\�rv��E��p~�2����捂;��F����<~�Xj���(�<����ƍ���F�I�����+�Y�+,�͠AU��sg�P�re:Dnv�3�(���AQ\0y`�С�=\Z���W��RK$����-��F�=�8q����� ##�М��;�����4jԈ�۷3��8�4塔;t:�h���J��`d7+W�|���{�.�[�\"(�E����\Z6l�ŋY0���_�]}E�-kU/a�~?L�+W����FHHH�מ<y\0��a�(\n�5���ҤI���~���K-�<�h�O��GU�0�+�̅\'O�P�vm�ܹ�ʵ���@�L�r��\0r **\n///�޽ˊ��^\'�%�/Oc�@�lf�=�ñe�N��Y�f/\0III���333J�*%u3EdC\\\\��ބ���z&�(�D�氟x�P.������E�N��u��Y3�G�0p�@%�h!�(����hx��w	\r\ra�T�^j�������\Z(_:�2����E�>}HII�֭[\0Y.�\n��V�âE�8|�0�V�{\n\n�1Tus��a�D���-z�聙�fffxx��}R�Q����͛1b\r�^\n������	��J�y�h�S�|y�<y�ʿ�s�ܹäI�pq�m�2��������+Z�3F���2xN�&M��ǟ߃we��Qh=��333���;�BBy������Ϗ��S�>p�8�?|���iӦ\r���R�e�{���3�,Y�we�<Pji\0�_���`�л%ܸq��;wJ-�AR�_t:����ڵ+��)O�C�B�\Z\"\"\"(S���\"�zp��]�^�������W,�������~�����v������=\Z����D/5���Hxi���\r6�Z����\0��ߏF�a�Te�ˁ�s�mAeP��@LL���h�⹻J(i�dA��p�1.\\PfD���ر���xV�P����}q�vٲeR�b0�@bb\"�+W�H�ͼe�V��N����			�t������S�f\0���\'\"\"��J-���0��^|�R�b��N��nݺ�=�νRK��T6�+s��m�E�=�j����i[OjI�ð.��\0�O�R\0�V��d\n�sc�8i�$�E�=����Ύj.�Z\"�$\n�A���� Q[���0�ő5�f�n�:�������=��b����H%�X>)6\n`Æ\rX�A�6RK�P4�-.�*���X�h4\Zlmm�P/��RK�P����@P��V�E�RI-�,)3��[����J�RK�PPX�C�f�����R�#[�����o1�՗Z������ٳgR�\"[������I�s�+�e��ڵk�E���{�.111��.�$\n���x\\�z�Ԣ��W\0_�5\0�+J-�BAS���s���K-�,1h��hصkf�9�S�/FF��m|�������V\0��񤥥ѽ)��J-�Ba0��x|��Ԣ��V\0���+��gy1�����Ԣ��V\0>>>\0T� �$\n���9���K-�,1h�믿�l�4��+��b�\n !!���p�������(&&*E�-�\0\"\"\"\0h[_\\-V0\\���cdd�Ԣ��U\0��B�:K-�BQQ��\n�U\0��(��ŁU�cLL�Ԣ��U\0gΜ���L��D��PR���T\0!!!���aa&.)((d�A)����L����+��axW%N��B����ח!C���hp*�_B-�HA��hڴ)�����tl��x�y��7�GGGG�E��V\0����jՊ\'O�0�+�	�RK�PԨ5�Q��wd�\0<x@������������E+?4Z�hgg\'�(�C�\n 11�!C����ڏa@[�%R���011��B���+�|f�]�???wP��i�F�\ZR�!Kd�\0t:�|�\r�`�T��Q��5P�re�Ő%�S\0���<{���u��DA_H�@�:u�C��NС�Ԓ(��\0A�&M�H-�,��\"�N�������M��+\r)jHRCr�e�,��ؗ�J�0���\'������~o��j����	������� ;`j*F�|	޹|�{+~��A���Z�jԮ\\��U�R�j�W�{��1����n�b����=�l��7L5=�틿��p�.�E�}��x�5�vbB\r�2Э)tn֖Ҷ#?��&K�*%�(�Dv�Aϝ;G�-��Ϲ�N�/����Q��z��ѡC:v�Hݺu)]�t��ƩS�طo������tj�C��E�v��o��?�<��wvv�^�zxyy���Dٲe_�V����Ǐ�v�\Z׮]C��bj���OK��F^�\Z-8�NNN�D�R�$;d�\0���)S��8�����{�ܟ�\'���)�;wfܸqt��9k��>}�ٰa			��3�@i��is�N|�/�.NyK�(A�V��ԩÆ\r˓\"�$--�Ç�w�^N�8App0f04��Y���x�\Z...<y�Djqd��\0��q������,���$2�,��~`eeŀX�f\rff��X{��صkNv\Z~�u+l�A�����{F���0z�h>��3LL\n��mϞ=|��W\\�|SkfB�&`����@�10{�l.\\(�8�Dv�\0\0�F�B\'1���;ޣ��%@RR6l(���e��;�ָm\'�ƃSoZ:L_M�����|��w<~�������x�w   ����ZhD��P�ݗ/��Ǟ={J-�l��\0`����ر���`�^X�,--9q�d[B-Z��ܹs�����_]n}!1z����Q�mٸq#�F��D�>���ߓb0P\'\'\'�ő%�U\0!!!���bj\".u��___���$�I�Ѱp�B�ϟOeW8�\nL���>{\rσd5?~�6m�`,���Çy�w�q�*ݛ��9�aٱ��둒����-�Y����ӳgO4Z�6m\Z{��t����8g�V�Zŝ\'�I�Vކ>���ln߾M�v�$�\0�:u�i�g��,|�F2Q^!8\\�5j�P>��@&��9�����w�eѢE����[LLL;v,w��e�ҥ�w������w��O�L��ann.uS\0��v�$\'\'�r�J\\�`B_�������O>�ZY#�W��ҽ{w�����ݻ�\'GZ�l�ٳgY=�&A��0h;	l�]����v_j�Z-}��e߾}�4\r��$�<3W��æJ$�|\";K��Չ����̌�͛3c�:u�T(����B�\n��>��*������4�9>�\'  \0�E~-��|\r��J#C���6n<z�H�.�5�[�<yrVگ��tN�<I������?�-[6m�F���6{3��[Wf�\Z��\0gϞ��Ã�e�sP���8h�@��/�R\0AAAl޼9�sݻw\'>>^j_�u������W|/r���K|��߿�Ԣ暓\'O��b�����|G<N�2Eꮐ=�R\0ӦM{��LWa}��/���Ύu�^�~�b���b���R��\'�����/8\0����^{{{Z�l)uW��(���d�;��2���R��-%K�d���D�����w��Vv�\'O����R��gfΜI�\Z5X�S��>}*U*`��b�l��ŋ�h49�777�bE��2b�J�,ɮ��߮����&M�aÆ���!�i���.�Y|����{籸�P���f�	�Q\0[����l�ҥ���K-f����1o�<������8v�%88�e˖�F	t�֍:u������+�_�~R7� ��6���\r]�taȐ!����Z���̌?���3g�}b��w��:xeBB%K��Z�7r��!�u��_+�&@��p$����R7� ���s�U�Taǎ8Pjq�E�ƍ���c���XY$�������	7�.�/|_�Q�V��O�����,^v��	�F5r\'��Z�g3����ӭ[7�CRj��{aQ�@Æ\r�n�� p��\0\\]]�Y�������`���]��Lf͚@\\R��g�Y�ءC��l0�BdRἤ���\0�m�s:#�Jř3g�5Odn�8_��9~I<�o�>)d!�9x��w�DHH\0_}�\'N�������666=z777�E����#o^�ȑ���ۉ��>��^�j�J�}B��g�A���=��Ç�T*�6�넄���?����@ժUe���_2]�/�|����+A\'@Eg����2	���)��$�,Hd�\0�\'O�����Z�T*���	\r\r%-���!]C���d	��p�\n`�1Ⳓ�`��+���\r�k-���6v���\0�<��E�P�� &,	�ʾ\\��dv�)))R7_��BԮ]@/���Ǌ����Qb���BE��ׁ\"\"\"�R�\nVVV���K�Y\"���I��2,�ŉ�*c1eYb*T(�j9���_6�MMM�nݺܹ#�GFFJ�Y\"��h-�(\nș+�q�D1yiN�qV�h޼y�w�Ǐ\'22RI�Od�\0:u��]�׬Y���B����L�\\�<f�~X���n�/�r�x���8w��7o��������7d�\0������   @jQ򅧧�A.X���P�-��\0A��C���wB�˩�@|��|+V�\n�:s�LX�v-������Q�n�%�P\0 \Z�߿_j1�E�r���g�J-J��V�hP5��dZ\r~���	��A��w	������7�ƍC�߿������-���T�����^��tf��P�oC�kM�\\F�J����Q�k{����[b�}���h���/���d�ܹ<~,&�裏$M�\"gd�kӧO�ȑ#R��ָ��bii������tR�S`8p\0xy:�:~?#F������R����߭z��_�L/^�ݻw�>}:���YAb�\"u�Y�Ȥt��ԬY�\'N�V�O�2�U�VkFA� P�R%<�O���ޛ�7G��6�~_���C:�������hjO�r�pvv�����t:J�,IJJ\nIII����+�\ZE�;w���Ӳ^;v,����ٳGjQ\n���P�߿O�&������%h�����!���)S�0a���|����W���B�:u���d�\0~��LMM�;w�Ԣ�5��?�O�NFFF>k��}���2�u�����{�������,�L�®]��T�}���z(v\0�CV\n��ё1c�p��Q||$�G]\0XZZ�b�\n\"##�z�������d�̙Ci[(a��k��CY�����?7�(��[�o����Ç\'!!��K�f�۶mVVVt��-w7V�Y)\0�/������3k�,Y��t�,���c����y�ڵ��ƲrF�ʟ��`D0}��:�􇌌N�8Aݺu�ҥ �>|������\n�Cv\n��ё�~����Hz��-�8y������ٓ�].]��޽{�뭈��㫯�����e�����Z�z.�y<�L�p/DTddd�bŊ���ŋIKK�M�6Rw�쑝\0�ӧ�}�/^�]�vY�h�HLLG��m۶4oޜ�d�@8�\\aܸqDEE��FĒ	HN�f�ܕ�hŜ~\r�B�lr��z����y(���=goo���w��N�Ĥ*\n�C�Af̘����Y�z5mڴ�����$%%����;�V�Z��JC��td������Ʋe����������F���n¿�˛>�n3��4i[�l�������ٺu+���>E��C�>��\\Fu?�B��ݻwcii�����qqq�V�ZRw�쑭\0X�jFFF�^�\ZWWW�Z�*F�N�V����dٲe�����ɓ������·B�گ��W>�\r?mߎ��;_���]�F�>}�رc��>��5:X�<g@Ӛٗ�eZ��&�^����E���={����ڵC!��Z\0�\\���}�ңGjժ����Y�~}��III�W�^�;w.˶��ԯ\n��}M�K�[Y��^���3tl\0m냹��y�>�b4DD�w�}GӦM�~]�V�Zh��6?��$������>���̔ߎv��P�&�~�!�����ѣ��]a�^�\'>88�ѣG�a�|}}�ڵ+���K�2��ۗ����F�*0o�h�ng��qKn��߄�1�8n?�1h� ���Gǎ���WHMM��ӓ�O�rf��C��?�\0��s���p��gF��R���Æ\r��Ky�t悲e˲w�^�4iBbb\";w�T�R�nݚ_�5ۅ7oR�L���C��i����ˠu](�;˶���~_�]��֭?���^�\n\\�v\r\"\"\"8�c�m�AL�����w/��k2����ʹs��Q�vmه��F\0�������׆��;���={�aÆ���D��1c���g�Νx{{#�?��K��L|�K��\r\\h�<y2�|�^A=x� \r\Z4@�C���]n�,��&-����������ZT\0�K�~%K�͛7y��-[��K��@RRO�>ţ4�kg�����hhP)�@��,Y���={2h� ��9�Z�K��-�g.��\n/��>}�d��5j���?���ݻ�QNC�q=$/d���M������ec���_���D�����o۶\r�)�\02DVy!��������+x��Z)��2Q������R���\n�*��8v�J�*�e����o;�������w�}K���,si��\"W���G�M�W�.�[=y�$fffY!��A)�7n\0��s��o���z6��դ�8g���>�Q6��C�R�R%.]�Thk� E���iܸ1a����$ߖ�g�E�-��\\V�!*�Cb8�֭��y���7oҪU��LD\n�G��\0�����_����ښk׮P�#���@�R�SV�)m���s0��iР����߿�@�����???\0�v����O��~�����d��� ��g&��������ҷo�������ӧ�߿���%�5��p��)�g�,�L���;�#��йsgJ�,IŊ1bÇϳ����Y�j�O�~n]�N����kS>l�\0�}JT}[����,��-[@�f��Z��k�UD��+W2u�Tt�|�W�ƛ?J�kჯE뻿�d}f$��^v;��i��̺�� �Ё��1�K����	[[ۗg^$..���x\"##IM�o�{��A�I��]����S�u���ܽ�W\Z,�	x��wٺu�K���݉��\'***��)����[��5knN�l�B���/FFP�5�k����|?�6\r���%�f0��P��{O9w�)ϗA�훊�P���~���T��e�\n�����]�Kaǳj�W���jF���F6�9v�Xt�d���~���l�:��xq{�P�.���}b�1�ר���8��h�����.]R�\nY����p��Fv�J�Y�\Z�m__WقwT��.��tn��r�#a��tDF��`ԨQ8;;��g�q��et:...XX��^��k���1cIII�s��疾���A��^�P9 F��\Zg=u�����V\\���L�}�Y\\�0ք���_Q�^=Z�nMHH��M3H��@�ղy�f��CU����{�����QʉVf\n�Ƿb��W��5�u��Ӵ&�X��ҎO���乳������G�Fo0)T�z?HMM%55�y#__.Y��\ZW��w��oV(x�=��ur���<\r�܅ճ`�w����Z��px���Ӽys���P(8�^�������F�a�ѭL�e��(���F�[e�,�.N�G���n�8���_�ބ������%:mV�@��A�@�H)�|V��d������D���9$>�����|����<��&�u��#�\\�x��;wJ�T�A���07�7,\0�{�Nj����F��#���e�Ǫpp��қΎ�b��2w��]�q�F��j0��y�&usპ�����\rY�����I��U�t\rh埜GohVK4.*,l��3g�H�T�A�@v������\0��nZ�f�\r����q�`�QAg�9�i\r1#�ŋ�� ��m��X�;8\'z��+\r���zA��G������e6to*�(=�?�3WE�aSSq�pHG1[��d.ߺu��\rJ-����@͚5�����6|\n�@��M��~&�����O2�\rLMU�������߆[�p�ڿ�o^f�Qq�{�����\Z����?�\r�q3��(���4jԈ7n��~ٱ��V�MW�.zƽ�5L\\\n��4\r���3r7���p� ~�9�g�4��Y\\K��\0���z22�U6:����E���\\��36S���D��������Uј�Mk\Zr篫0a	th\0[��7p�,�=�v�9���ۡ��ڱcG֯_Olҫ�e*cX4v����Ī=�x�X�JE\'��i��[iT�\'@]�֠C˪�F���QO��?w�Q�������;qTZ����\\������\"F�02�����$Z��`�R������ku����8�ԄE�s7�)Ccy{N��Ņ��v�Էok��D�H��?��>s_�e`xW�vT�P@���ڭ[7���	�ᜃ3؄~�\r�~���<ʬ�_LmC��/\r�15QQ�Ł\n.�k^�h\Z���:�@\\B\nO�yG��\'ݏ��d�\'���u�D���rj[�d�8��kM�!������.<{qD����%��B�\\y\'�K��l|�>��R���u3�%,�����{;+���U��-E����$n݋����|��_��W�]�_k1�����eށ#~��PNr��xդ8��r�B�o,F�055�[�n���������#��}��e;a�z(aiƼ��i�T��,��i�ȋ����4�\r�O�9x���<b��LT0�����y�W�.��N��pK&�������%uY���Ņ�u��}���DS��`�	(S�$+�\Z�������{��X���E���N�\n�~6Tv˝���%����y�n�:X�QQQ��\r����ۀ\0�ʕ�R�J�^��V����ѻN@{��4�X~\0�\n�,�|\0{��6�^����`����F5�� �Tu���w����2�Y(\0�;v��3Wd�z������E2�[@1�wC��<�.���ù�RK�2Aϓխ��k�B�ڵ�~�B��FԩS�ѣG��E�E�S�w~��X�Y_LM�����07e�g��a^?�-���1����R����X!����n�;;m۶��	�l\0��5k�ԩ+����u��6C��X0�;��ɴ?7ԩ���߼G��u9�7x���R�yK�\r��{�\'uY)\0v��Ͱa�8�Ն��b��ÜI��q���ڂ�#Z�=�R�x,��+�Le�2��K�]Hٲ26~�3d�\0@L���öm�p,��?h׼2���LiѠ\"ۗ���W>^)�BgR-j2sd��\r����8�0a�4B(�S\0�t�҅��d��L��A��u�K����b嗃�ڦ:���6��IE/G71hȳ�ܕOM���֭K�n�rw�B��{C��ؼy3q��|3����bY�5�#v6�l���p���������}sWV�׼�$X�z�4f��r����G}D�2�4���\n�!c��`Ԁ�\\���xV��\r1��q�hܸq��SxY*\0\0f�m/�(�f�;��rF�@�qRK�*oB���u�~�AjqY��OOO2��شD	]8q��k�Ӽ��F�S 5�.û���ʒ����Ѓ?u�8~�8>�eC����ڦ�4��u�~G�֝�N=`췹�f���|(SΝ7n(����غu+�&��Y/��)\0�	�{�4�yO���\n�nkK1	Ȯp���e#c��E��*�nМ��@<==���Fv�\0^^^X�RX�`�Ԣ$>��4u2~�\\�U�k��xq����лY�]£����͹�3̙1c_~�$n(\nd�\0>|���\'��iȘ���0��#�!ь�����3X�i��$����L9��ծ]�-[�P�fM���� �W����F��_�Q�Ł�m���Y��?��ebe)f\r:�#4�*�)P�Tԭ[��+W��h�z��2��Y�\0���˞={8��#�����:e%L���p���z����!us�5��<x�\0�\n���_Ȩ��ٿ1���_\n�:�������JDFF��B�m�£C�ԬR��G���Tl���R7��#+���Sʗ��Z�b�Je̐�\r����<x\Z+]]]�nf�G6\n�Ν;�t:��_�B�hZϓj^e�vLjI\n�(��P�yܺ��%�(ַ1Oc��5�%Q(d�\0n߾\r����(�Y�*�c�]s�(\0i(ieA���D�KAH��P���Բ*\Z��W��P��)�$n���c�GQ\0\no���w�R�x\0�)RK�P��Ndd��XҧS\0b��D� ���Q�\0�	���I�m��BLS�0\\jI\n�(��� @���P����111.PA鑍عs\'�&�x���Z�b������%\ZU��Q\0���tk[��\'��\n���ʘ���D� ���?>111to���\n###��ڡ�$\n���+���T���k\Z{W���\n,)��3/g�ev_�C�@FF:t --���[)�@$��������]A��8�<�ϟgX�F��{˜�\nF	K3@��T���4\Z��M*����tL�6\r3SC�i(�8\n�{Y��� z�\0����Uc/�Le��XAA��[��6�Z��d�a++1���*��7oR��\'��O_�y7�R6RK�PP���t(Q����\"���Z��Bo���\Z���/h���5x���X�1Q�ۼ\nҢ�\n�V�Z�k28v6HjQ\0m��VG�ڐqu���X��U��[ТEJ�*Ų\r�HIM�Z�bOXd<���Y�Bo���5���\')9��gm!*F1@�\nA���4\0�*H-�BA��\n\0�Y�f����f������+$&���ީj\r1q���%��R���&$��|#�RP������EŢ -�����QQQ\0�s�aԀ&tlY�P�w�N8��|�y��Ҷie��B.\\~��o��flW0u���IU��(H�,\0�Z�����̛7�Ç�Ra]��XZ��P�\nG�ק�huԭ�B�65�=-(�iv���w3SK>�K�*��\"g�̈́E��%,\n��~s��nnn�����G��{�an�d~*JdcckaaAÆ\r9t����ܻw��7or��Yy��1?�U]��\n�������sg��2��5�:p��)���xC��`Y�c���sss�^����χ~H�6mX�x15k*���(�qpp����ƍ3jԨ��5\Z\r�����6%%��ݻs��^�\n �Y�ao�Å�\'n`d+�S��Yne�j�%�n�\"!!���\0v���ƍiܸ1+V�`�ȑR7�����	SSS\\\\\\�XnڴiL��a��JZ�<�-ek)u�����=zW\'�T���MT��.n����Ю];ڵk�ĉ�߿?�ƍ��ˋ-ZH�\r�^�&&9�N��f����]sX70Tv�D��c����_�JAb⫑Ejժ��ÇQ�TL�4I�.0x��������4�s�5\\�a^?�J�e}giaʧ:ѢaE�E/2Ƴ��\r��C�6_����Trr�+�<<<�ԩ���Y�����^r�J�B��!C�Ce���S݅�?��;a\0T�p���4���5�֟B��1{X��o�\\�^�~�&M��r��͛������n�:�ϰB�X�\0\Z7n����9�166�VUgjUu.v���;��_	�S#�YH�������r.22��w��e��Ҋ�!VaR,@Æ�A����{+���n�Q`���]��L{�\'O��rn���\08�Z��������X*��%K�~�z�Rҙ��o$)J ��W�ɣ�X��B4y�{n���@ZZ\Z˖-��ɉ�˗0a�e-��(�\n\0`�С�?���2�_���Z$���ѿ���	c{�J�)^�̛7���F�\Z��������ӧ<Υ��Bސ�)pa���X�h.$%%����ץ.�.��ۖ����4d�)i��k��3��8����\\�*�+���>��àiӦ�?�3g�ЩS\'��ܸ~�:���$&&R�T)&M����/u7�Zdr��=&N�ș3gHMӏ������UF���q��bܐ���@j����TM�����,�F���)jp����N�\Z5HII��?��U�V�5�lٲDEE������u�n�����E���8|�0�[��A����F�Z��I�0���///v��.��1��4���F�&���f���hh�Z����Q�qqq�X�\"k���e;o�<\0�\\�\"uw� ����ѤI��nK�N��\'_��i6mϢ���M)��7O�����֭[ǘ1c�-kff�������%�5�B�䑆\rҤI~�t�T�|W��F%2l�8��*���wa���3g�K�]�����z�pQ@166f�֭h3t������T�E�3Wo�0v�V��$���0�l��Ķc�H��X�|9,@�R�X�C�������\'a���#III�X�]����F\\�<�@�N�ڭg����\Z5���G�V��T��{�p1��v����L�8c���+f:���_Ru�A����Vˮ]���O		�L�2��������;Q��Ij1s$��c��|���	4�˧�G!o����Wa�2x&n��޽�r�r/���+^^^�<y��{�pQf\0��ĉx{{3d����Y�zuVĚ� �Y4���b��Y����\'����C�\\����&�߿.���}��\'W�O?������i�T�V�s�Α�T��� RSS9y�$�Ǐ�ɓ\'���3f����\0ʖ-Kdd$��+wa�\"���RV�oz*{8�RI�_��B#�Y�s���05�6ް�E+�F�7��,�w777���G��o�{����3m�4:D�.]��1��\0^@�ӑ���eb,�ѣG�t�Ҭ��Z�SSS�� ��x�:������Wg�Ļ�+f�&�;kF�u��ߏ\\e��\Zm�&м��J�]?\n�E��y��C1R�7�|�ԩS�U�͛7�Q�3g���o�-�0�xξ}��6m\Z���h�Z�������C�XX�&,>>;;;\ZU�#K��^ 1~�	���3QcmeN���ԣ>e6����P��ι���k�������Y�y���;���U��Q�F?~++���wvv�R�J�:u�he�(\n\0�����A�ҥK�,���󕁟Ihh(...|��\Z�}���p��������0�D	3�,�q���l�T�,�+9�Cc���)��)��Z�S�>_s���:C��b�H��W&�\0�OA�Z�e�jժU���ݻ7ǏW�\n�b�E���O���C�N�X�v-nnno�&�x��kB�Z�f����~����ߗ�h���ƃd��\0p���\\�kl5<�f-�_Et٭�Vp{�J�\Z~�\r�i��R�ӂ233����?ԫW��{����O�F��i�Q��Z�fРA����jժ\\\r~ �5�q.��K��U�ϋ�u��ŧ���G2GeΎ`eE�.�:¢`�q২��֖E�>a�ĉ��Ӽ���СC�(\0����tL�:���8\0��}>���V@@\0&*q@�[�㖻7\0� 8���{!-*V�Ȑ!CX�`A�ܿ~���T*.\\� uW�Vܿ�իWS�Z5\"##9y�$k׮e�ĉo�����۾8�Ӊ�/�}a�Qq=�R�J̘1��c���y�T�RT�V���`��� (���:��N�:q��)?~L���iݺ5�/_&\"\"�%J�x� X[[c,��[��*i�p7���sx�-[�+Vзo_��\Z;v,�7oΊݠ���o�\\�x��ǏӥKʗ߭Y����D>���^MJJ\n5=\r{��������wrr���ۄ��K:����Q��H�M�ǀ��sf���X[[����]ժU8p �6m�ٳg9^�îm=�[Q�$$�ȯ��7|��4�NXX���T����3�<(�(���)��G����ǐ!C^���޽;Z���)����ࡽ[Jݒ�!5M�^l6<�A9���ر�gϞ��?��f���XQ��t��Q�E�=�n\r`��;v��� ʔyy�=99LLLr�|��g|��WD�<T��{�O��I�����Ջ���Ӿ}���O�����J ��v�@`` ���t�����`eeŔ)S����JN�_���(URꖼqI�*~����DX�;�q���y��>{��s��z?��4iBll��bȞb50`\0{���Ν;���g[�֭[T�^���˿��B��P�dI*8�qa�ԭ��jqo���y,�ҥKӰaC�͛�m^>9�t�RfϞ��\r�\'�����O�r��!�u�����E�\\�p�������ݻGZZ\Z-�Jݚףъօ������\Z�#�refϞ�{ｇ����V�\\���t�$8��W�ٳg��������Xv�ܹh�Z�ϟ���ׯ_�cC�[�*:1�����*~����]F��[3u�T����}�6#G������o����Ql��Ç�W�^�-��h�@L����_�dlr��YLT�Q�r��\n����6�&C|�y��!���,]���%e�p��3�R�=�B,[����0�L��+�t{{{F�� <x� ��K�.�Z����¢��d<2�d�o��HLLd�Ν����bA�m�T�h�Z�ő-z�\\��\\�z��}��9s�\0�d�\0�x�\"�J�\Z��(h?�=0e�ʕ���0k�,�W�^,�ge�<p�\0nnn|��g�i�[`�\n 22�{����bc��h<���\0lذ���Ν;�F�ɵpa3pD\'��~��l�����/^�����=:������*U����?��h�Q6�����>|x�����Ȳ�t�R�����?7¢E��9s&�ڵ��2bݺu3j�(�L�BDD�-B�V��мys�^�*������\0bbb(_�<U�V}�ĒIII���3d�����?ʽҶ)M#.��r(ǹs��ׯ�/_��ǇaÆI+\\HӦMqtt$$$�sj��1cưc�t:���g֬YY�\\^Šg\0�6m\"--��������ݝM�6�w%i�#0g��x���xxxp�����Y�|������\Z4�NǪU�^9oaa�����ŋqqqa޼y�.]:+��«��j�L�6\r _�\"��.\0���4�&m�G��;͛7�^=���ё�={r�f��\nʕ֭[s��=>��sz��c��u�r��}&O�LRR���8qBj���U\0�/_`	�ھ} �3Ҷ�+m���d:t���$99�ӧOK+`!ұcG._��G}ħ�~���&&&,]��.`nnNǎ�\n�b�\n�����Ԕ�?������vvv<z�+++\0Ig\0{NÝǰx��W���֭��X�dddеkW�;Ɣ)S���ޘH4ccc\Z7ṋ[��X�\"��=q6T=��@TT�~�-۶m���{{�<�q��M�ԩC||<��cƌ��%i��(��R�\n�&MzŘ�R�J���\\�\\�Z̀8|�0Æ\r�o�y�P����ѱcG|}}�ԩ��M�Bܹs�~��V�Z�������<��9�gϞ�U�V�T*����իWV����iߏ� 9�$�\'���)-[���W`��jƍǞ={h۶-�V��W��R�J�g�����ѣG�С��M�d�\0���ؽ{7�7�J�*L�:������%�=:Ou�9s���ۣR��r�J��a��թU�\'���wÊߠK�.�m�6�r�{�6�V��8q\">>>4k֌#G�d���+++�o�N�^�8~�8ݻw/��ĲS\0O�<��O?��ё������#���Í7x��ӦM#555�+�<�cǎ���q���,K�LڷoO�S�T�흳LL-ٴi�k�ծ]�V˟�Y�0���3����ӹsgΝ;W�ދ������ұcG<H���IOO�:���Ahh(W�\\���K�.ԨQ##�W>��ִlْO>��\'N���#��#2!!!Ax�w@P�T����p���W�͘1C\0��������H���N(Y���m�3g��0�3B�����9 ̜9�mx��\0s�̑�O�֤���7\0�{��z/�V+4l�P\0�ɓ\'�������������+�%J��悱�qVy�J%���O��Ҥ��7����Z���͛s��%222�ݻ7?��#...ٮ�.]�ҥK��Gu�R�P��ܺu�\n*d[F�����L	�.�/��{�5ey�����bcc�������%F9���͕+W?~<+V���j�ے��F͚5�w�����tb��:u�0a����I���t:222�h4����q�F�nݚu�D��9�E����(��W\0�Føq㰷���ߟ~�����~��7��ܲ��رc������+W���_���%..�3g��8�A�R\Z6l��qD���M!n��ƥ�T�R899���CY��V�T�+W��d�~���B����ˋ���0x�`�\\�B\\\\W�\\�>���kkk,,,^R�333,--����cǎlٲ�Zͽ{�X�t)� �r�J����ӧ111Rw�H=Ɏ�{�\n��� t��It:���ٳ�\0����--t��5k�v�ĉ\\�u��!��.�鿵%B۶m����\\�[���@�������n�*ddd������:u�dM�.]*ܹs�P�.���_B�N�@���F�Y���+z�\0���w�}WP�T�����o߾\\_�V�kkk�]�v�-w�����C\0###a˖-��Grr�`ee%��-��}�֢b�|�r��履~\0!,,�H�no����`jj*XXX\'O�,�{��ja��邹��`ee%|���B|||��500P�ի�\0�ʕ.^�Xd�~�L	\'�y(�\0\0\0\0IEND�B`�                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             ');
/*!40000 ALTER TABLE `imagen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequence`
--

DROP TABLE IF EXISTS `sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sequence` (
  `SEQ_COUNT` int NOT NULL,
  `SEQ_NAME` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`SEQ_COUNT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequence`
--

LOCK TABLES `sequence` WRITE;
/*!40000 ALTER TABLE `sequence` DISABLE KEYS */;
/*!40000 ALTER TABLE `sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipocontrato`
--

DROP TABLE IF EXISTS `tipocontrato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipocontrato` (
  `id` int NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipocontrato`
--

LOCK TABLES `tipocontrato` WRITE;
/*!40000 ALTER TABLE `tipocontrato` DISABLE KEYS */;
INSERT INTO `tipocontrato` VALUES (1,'Cuenta'),(2,'Tarjeta débito'),(3,'Tarjeta crédito'),(4,'Préstamo');
/*!40000 ALTER TABLE `tipocontrato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id` int NOT NULL,
  `nombreUsuario` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `idImagen` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_usuario_imagen` (`idImagen`),
  CONSTRAINT `fk_usuario_imagen` FOREIGN KEY (`idImagen`) REFERENCES `imagen` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'rafa','1234','rafa@rafa.com',NULL);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'bankonter'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-01 13:16:28
