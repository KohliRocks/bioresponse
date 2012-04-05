#Packages
library( "R.utils" );

#Function Includes
source( "Helpers.r" );


#Main
setwd( "data" );

myTrain <- read.csv( "train.csv", head = TRUE, sep = "," );
myTest  <- read.csv( "test.csv", head = TRUE, sep = "," );

dimTrain <- dim( myTrain );
dimTest <- dim( myTest );

infoGainAttr = c ( "D27", "D66", "D64", "D469", "D75", "D107", "D747", "D187", "D217", "D88", "D10", "D43", "D78", "D106", "D84", "D56", "D182", "D659", "D198", "D16", "D87", "D36", "D596", "D8", "D660", "D104", "D61", "D209", "D18", "D146", "D607", "D5", "D62", "D595", "D83", "D14", "D91", "D95", "D60", "D131", "D158", "D32", "D86", "D204", "D739", "D7", "D21", "D19", "D80", "D177", "D100", "D20", "D979", "D951", "D1036", "D70", "D1087", "D11", "D3", "D196", "D200", "D89", "D6", "D105", "D99", "D26", "D9", "D103", "D173", "D911", "D126", "D959", "D1061", "D741", "D85", "D48", "D740", "D77", "D175", "D688", "D117", "D129", "D1169", "D201", "D214", "D90", "D622", "D844", "D1281", "D67", "D210", "D40", "D71", "D1004", "D202", "D183", "D207", "D1196", "D52", "D17", "D1002", "D309", "D163", "D133", "D1083", "D162", "D237", "D807", "D136", "D597", "D310", "D152", "D1309", "D995", "D1089", "D229", "D31", "D208", "D223", "D311", "D954", "D473", "D130", "D700", "D47", "D458", "D79", "D211", "D1066", "D1155", "D164", "D752", "D1143", 
"D449", "D97", "D426", "D313", "D69", "D480", "D993", "D687", "D842", "D312", "D180", "D1434", "D334", "D1106", "D1390", "D108", "D751", "D149", "D1168", "D1125", "D151", "D140", "D101", "D147", "D74", "D194", "D155", "D969", "D762", "D153", "D996", "D154", "D949", "D141", "D1180", "D314", "D205", "D1005", "D947", "D685", "D1341", "D25", "D624", "D843", "D649", "D144", "D978", "D58", "D612", "D46", "D625", "D961", "D672", "D440", "D742", "D1164", "D1001", "D102", "D30", "D913", "D474", "D701", "D1109", "D1338", "D96", "D2", "D137", "D967", "D675", "D161", "D608", "D218", "D459", "D386", "D73", "D377", "D68", "D988", "D1", "D35", "D610", "D598", "D1135", "D221", "D1031", "D181", "D1445", "D966", "D609", "D623", "D912", "D806", "D1078", "D1219", "D1059", "D1163", "D1447", "D1333", "D55", "D132", "D81", "D260", "D1150", "D174", "D139", "D1070", "D1113", "D1133", "D49", "D973", "D950", "D690", "D526", "D1174", "D1077", "D889", "D479", "D59", "D583", "D13", "D960", "D286", "D691", "D750", "D662", "D160", "D42",
"D197", "D936", "D172", "D673", "D315", "D1285", "D41", "D1157", "D1034", "D1426", "D1273", "D952", "D802", "D964", "D506", "D288", "D937", "D775", "D1193", "D1364", "D1204", "D44", "D1176", "D50", "D29", "D611", "D476", "D51", "D1170", "D145", "D981", "D521", "D1160", "D228", "D93", "D1243", "D810", "D1032", "D1421", "D999", "D1017", "D1041", "D178", "D1268", "D1441", "D195", "D1371", "D1137", "D753", "D1213", "D627", "D1337", "D1382", "D1234", "D512", "D948", "D416", "D124", "D1076", "D1407", "D763", "D1259", "D1190", "D1768", "D24", "D755", "D1074", "D318", "D1307", "D119", "D460", "D135", "D1043", "D1037", "D1571", "D222", "D1112", "D442", "D811", "D1187", "D1023", "D1410", "D453", "D1206", "D1054", "D1403", "D1110", "D711", "D1230", "D122", "D504", "D987", "D39", "D661", "D258", "D12", "D138", "D1128", "D939", "D273", "D1681", "D516", "D524", "D1195", "D1379", "D676", "D929", "D265", "D626", "D54", "D1067", "D1729", "D380", "D1252", "D264", "D461", "D569", "D63", "D1069", "D1596", "D293", "D276", 
"D1589", "D1208", "D992", "D703", "D186", "D1463", "D454", "D361", "D927", "D120", "D1363", "D1096", "D38", "D82", "D1299", "D1414", "D121", "D1448", "D986", "D748", "D316", "D1335", "D125", "D689", "D1481", "D613", "D1454", "D455", "D451", "D391", "D803", "D472", "D1226", "D267", "D168", "D252", "D1718", "D462", "D1277", "D278", "D1045", "D527", "D231", "D1149", "D142", "D1415", "D1317", "D1013", "D1251", "D674", "D1397", "D1598", "D1449", "D890", "D584", "D225", "D591", "D754", "D1650", "D1682", "D1391", "D378", "D156", "D227", "D932", "D92", "D444", "D881", "D376", "D593", "D545", "D115", "D1294", "D530", "D490", "D1094", "D360", "D1272", "D1247", "D953", "D1211", "D1763", "D642", "D855", "D702", "D1361", "D563", "D430", "D390", "D525", "D270", "D582", "D448", "D1406", "D446", "D965", "D1739", "D1280", "D261", "D365", "D592", "D1728", "D998", "D1191", "D407", "D850", "D192", "D98", "D872", "D304", "D856", "D1194", "D262", "D259", "D997", "D1543", "D1090", "D1746", "D1167", "D1613", "D150", "D1408",
 "D481", "D1418", "D1202", "D794", "D298", "D556", "D1012", "D159", "D1376", "D560", "D729", "D1201", "D1540", "D1419", "D1496", "D808", "D586", "D1585", "D1242", "D1699", "D1472", "D654", "D1028", "D928", "D374", "D566", "D477", "D425", "D456", "D375", "D127", "D271", "D1541", "D373", "D558", "D331", "D1289", "D1065", "D307", "D1519", "D1580", "D1179", "D1569", "D320", "D1071", "D1010", "D1181", "D1152", "D268", "D379", "D1486", "D1412", "D971", "D883", "D1709", "D559", "D1532", "D1409", "D693", "D1552", "D1539", "D263", "D882", "D533", "D704", "D846", "D306", "D1505", "D116", "D1446", "D1018", "D904", "D1263", "D945", "D1172", "D269", "D531", "D1442", "D761", "D1384", "D1545", "D1456", "D1093", "D989", "D1286", "D1731", "D1347", "D779", "D1127", "D555", "D767", "D491", "D482", "D294", "D319", "D296", "D408", "D699", "D1400", "D1366", "D706", "D1684", "D1116", "D4", "D1582", "D918", "D970", "D1344", "D972", "D1022", "D1427", "D1311", "D885", "D681", "D266", "D1644", "D746", "D1120", "D1354", "D1653",
  "D1178", "D1349", "D1324", "D1637", "D1679", "D1497", "D1060", "D322", "D644", "D1144", "D1677", "D23", "D991", "D1431", "D330", "D274", "D1016", "D1027", "D1509", "D511", "D922", "D367", "D1424", "D1355", "D1708", "D1232", "D1757", "D1645", "D1579", "D935", "D827", "D820", "D148", "D789", "D548", "D870", "D1122", "D1123", "D1775", "D1533", "D1365", "D287", "D1720", "D292", "D1042", "D1712", "D1536", "D1741", "D1086", "D1734", "D1392", "D1663", "D1264", "D1139", "D1450", "D1595", "D1500", "D1673", "D1587", "D1499", "D275", "D887", "D1212", "D1275", "D1258", "D1603", "D1622", "D1238", "D1659", "D1322", "D1758", "D1451", "D1040", "D955", "D1567", "D1565", "D736", "D963", "D1011", "D1716", "D1469", "D1210", "D859", "D234", "D862", "D637", "D305", "D857", "D825", "D1359", "D1430", "D1197", "D1003", "D1185", "D1640", "D1665", "D1052", "D1245", "D1531", "D1246", "D606", "D1257", "D1466", "D571", "D1115", "D1222", "D1189", "D1029", "D1440", "D1255", "D1088", "D994", "D1129", "D1513", "D1705", "D1053", "D1735",
   "D1756", "D1523", "D1117", "D1380", "D1570", "D1607", "D968", "D1574", "D1764", "D1527", "D1636", "D1762", "D1492", "D1623", "D1525", "D822", "D824" );

myTrainSub <- myTrain[ , cbind( "Activity", infoGainAttr ) ];

myTestSub <- myTest[ , infoGainAttr ];
dimTrainSub <- dim( myTrainSub );
dimTestSub <- dim( myTestSub );

#Execute predictors
setwd( "../" );
#source( "RandomForests.r" );
source( "GBM.r" );

