List<String> ids = new List<String>{ARRAY};
List<String> fields = new List<String>(OBJECT_TYPE.SObjectType.getDescribe().fields.getMap().keySet());
String id1 = ids[0];
String id2 = ids[1];

String buildSoql(String[] fields, String id) {
  return ''
        + ' select ' + String.join(fields, ',')
        + ' from OBJECT_TYPE'
        + ' where id = \'' + id + '\' limit 1';
}

String soql1 = buildSoql(fields, id1);
String soql2 = buildSoql(fields, id2);

SObject o1 = Database.query(soql1)[0];
SObject o2 = Database.query(soql2)[0];

for(String field: fields) {
  Object f1 = o1.get(field);
  Object f2 = o2.get(field);
  if (f1 != f2) {
    System.debug(field + ':\t' + f1 + ' <> ' + f2);
  } else {
    System.debug(field + ':\t' + f1); 
  }
}
