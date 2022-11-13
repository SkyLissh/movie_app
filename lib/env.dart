import "package:envied/envied.dart";

part "env.g.dart";

@Envied(path: ".env")
abstract class Env {
  @EnviedField(varName: "TMDB_KEY", obfuscate: true)
  static final tmdbKey = _Env.tmdbKey;
}
