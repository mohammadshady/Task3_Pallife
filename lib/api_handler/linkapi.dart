const String baseUrl = "https://rickandmortyapi.com/api";

const String linkAllCharacter = '$baseUrl/character';


linkNameFilterCharacter(value){
  return '$linkAllCharacter/?name=$value';

}


