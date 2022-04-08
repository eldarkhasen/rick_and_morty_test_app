mixin GqlQuery{
  static String charactersQuery = '''
  query (\$page: Int!){
    characters(page: \$page){
      results{
        id
        name
        status
        gender
        type
        species
        image
        location{
          name
        }
        origin{
          name
        }
      }
    }
  }
  ''';
}