import 'dart:core';

class MovieDetails {
  bool adult;
  String backdropPath;
  Null belongsToCollection;
  int budget;
  List<Genres> genres;
  String homepage;
  int id;
  String imdbId;
  String originalLanguage;
  String originalTitle;
  String overview;
  double popularity;
  String posterPath;
  List<ProductionCompanies> productionCompanies;
  List<ProductionCountries> productionCountries;
  String releaseDate;
  int revenue;
  int runtime;
  List<SpokenLanguages> spokenLanguages;
  String status;
  String tagline;
  String title;
  bool video;
  double voteAverage;
  int voteCount;
  Credits credits;

  MovieDetails(
      {this.adult,
        this.backdropPath,
        this.belongsToCollection,
        this.budget,
        this.genres,
        this.homepage,
        this.id,
        this.imdbId,
        this.originalLanguage,
        this.originalTitle,
        this.overview,
        this.popularity,
        this.posterPath,
        this.productionCompanies,
        this.productionCountries,
        this.releaseDate,
        this.revenue,
        this.runtime,
        this.spokenLanguages,
        this.status,
        this.tagline,
        this.title,
        this.video,
        this.voteAverage,
        this.voteCount,
        this.credits});

  MovieDetails.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    belongsToCollection = json['belongs_to_collection'];
    budget = json['budget'];
    if (json['genres'] != null) {
      genres = new List<Genres>();
      json['genres'].forEach((v) {
        genres.add(new Genres.fromJson(v));
      });
    }
    homepage = json['homepage'];
    id = json['id'];
    imdbId = json['imdb_id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    if (json['production_companies'] != null) {
      productionCompanies = new List<ProductionCompanies>();
      json['production_companies'].forEach((v) {
        productionCompanies.add(new ProductionCompanies.fromJson(v));
      });
    }
    if (json['production_countries'] != null) {
      productionCountries = new List<ProductionCountries>();
      json['production_countries'].forEach((v) {
        productionCountries.add(new ProductionCountries.fromJson(v));
      });
    }
    releaseDate = json['release_date'];
    revenue = json['revenue'];
    runtime = json['runtime'];
    if (json['spoken_languages'] != null) {
      spokenLanguages = new List<SpokenLanguages>();
      json['spoken_languages'].forEach((v) {
        spokenLanguages.add(new SpokenLanguages.fromJson(v));
      });
    }
    status = json['status'];
    tagline = json['tagline'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
    credits =
    json['credits'] != null ? new Credits.fromJson(json['credits']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['adult'] = this.adult;
    data['backdrop_path'] = this.backdropPath;
    data['belongs_to_collection'] = this.belongsToCollection;
    data['budget'] = this.budget;
    if (this.genres != null) {
      data['genres'] = this.genres.map((v) => v.toJson()).toList();
    }
    data['homepage'] = this.homepage;
    data['id'] = this.id;
    data['imdb_id'] = this.imdbId;
    data['original_language'] = this.originalLanguage;
    data['original_title'] = this.originalTitle;
    data['overview'] = this.overview;
    data['popularity'] = this.popularity;
    data['poster_path'] = this.posterPath;
    if (this.productionCompanies != null) {
      data['production_companies'] =
          this.productionCompanies.map((v) => v.toJson()).toList();
    }
    if (this.productionCountries != null) {
      data['production_countries'] =
          this.productionCountries.map((v) => v.toJson()).toList();
    }
    data['release_date'] = this.releaseDate;
    data['revenue'] = this.revenue;
    data['runtime'] = this.runtime;
    if (this.spokenLanguages != null) {
      data['spoken_languages'] =
          this.spokenLanguages.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    data['tagline'] = this.tagline;
    data['title'] = this.title;
    data['video'] = this.video;
    data['vote_average'] = this.voteAverage;
    data['vote_count'] = this.voteCount;
    if (this.credits != null) {
      data['credits'] = this.credits.toJson();
    }
    return data;
  }
}

class Genres {
  int id;
  String name;

  Genres({this.id, this.name});

  Genres.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class ProductionCompanies {
  int id;
  String logoPath;
  String name;
  String originCountry;

  ProductionCompanies({this.id, this.logoPath, this.name, this.originCountry});

  ProductionCompanies.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    logoPath = json['logo_path'];
    name = json['name'];
    originCountry = json['origin_country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['logo_path'] = this.logoPath;
    data['name'] = this.name;
    data['origin_country'] = this.originCountry;
    return data;
  }
}

class ProductionCountries {
  String iso31661;
  String name;

  ProductionCountries({this.iso31661, this.name});

  ProductionCountries.fromJson(Map<String, dynamic> json) {
    iso31661 = json['iso_3166_1'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['iso_3166_1'] = this.iso31661;
    data['name'] = this.name;
    return data;
  }
}

class SpokenLanguages {
  String iso6391;
  String name;

  SpokenLanguages({this.iso6391, this.name});

  SpokenLanguages.fromJson(Map<String, dynamic> json) {
    iso6391 = json['iso_639_1'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['iso_639_1'] = this.iso6391;
    data['name'] = this.name;
    return data;
  }
}

class Credits {
  List<Cast> cast;
  List<Crew> crew;

  Credits({this.cast, this.crew});

  Credits.fromJson(Map<String, dynamic> json) {
    if (json['cast'] != null) {
      cast = new List<Cast>();
      json['cast'].forEach((v) {
        cast.add(new Cast.fromJson(v));
      });
    }
    if (json['crew'] != null) {
      crew = new List<Crew>();
      json['crew'].forEach((v) {
        crew.add(new Crew.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.cast != null) {
      data['cast'] = this.cast.map((v) => v.toJson()).toList();
    }
    if (this.crew != null) {
      data['crew'] = this.crew.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Cast {
  int castId;
  String character;
  String creditId;
  int gender;
  int id;
  String name;
  int order;
  String profilePath;

  Cast(
      {this.castId,
        this.character,
        this.creditId,
        this.gender,
        this.id,
        this.name,
        this.order,
        this.profilePath});

  Cast.fromJson(Map<String, dynamic> json) {
    castId = json['cast_id'];
    character = json['character'];
    creditId = json['credit_id'];
    gender = json['gender'];
    id = json['id'];
    name = json['name'];
    order = json['order'];
    profilePath = json['profile_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cast_id'] = this.castId;
    data['character'] = this.character;
    data['credit_id'] = this.creditId;
    data['gender'] = this.gender;
    data['id'] = this.id;
    data['name'] = this.name;
    data['order'] = this.order;
    data['profile_path'] = this.profilePath;
    return data;
  }
}

class Crew {
  String creditId;
  String department;
  int gender;
  int id;
  String job;
  String name;
  String profilePath;

  Crew(
      {this.creditId,
        this.department,
        this.gender,
        this.id,
        this.job,
        this.name,
        this.profilePath});

  Crew.fromJson(Map<String, dynamic> json) {
    creditId = json['credit_id'];
    department = json['department'];
    gender = json['gender'];
    id = json['id'];
    job = json['job'];
    name = json['name'];
    profilePath = json['profile_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['credit_id'] = this.creditId;
    data['department'] = this.department;
    data['gender'] = this.gender;
    data['id'] = this.id;
    data['job'] = this.job;
    data['name'] = this.name;
    data['profile_path'] = this.profilePath;
    return data;
  }
}


/*
class MovieDetails {
  bool _adult;
  String _backdropPath;
  Null _belongsToCollection;
  int _budget;
  List<Genres> _genres;
  String _homepage;
  int _id;
  String _imdbId;
  String _originalLanguage;
  String _originalTitle;
  String _overview;
  double _popularity;
  String _posterPath;
  List<ProductionCompanies> _productionCompanies;
  List<ProductionCountries> _productionCountries;
  String _releaseDate;
  int _revenue;
  int _runtime;
  List<SpokenLanguages> _spokenLanguages;
  String _status;
  String _tagline;
  String _title;
  bool _video;
  double _voteAverage;
  int _voteCount;

  MovieDetails(
      {bool adult,
        String backdropPath,
        Null belongsToCollection,
        int budget,
        List<Genres> genres,
        String homepage,
        int id,
        String imdbId,
        String originalLanguage,
        String originalTitle,
        String overview,
        double popularity,
        String posterPath,
        List<ProductionCompanies> productionCompanies,
        List<ProductionCountries> productionCountries,
        String releaseDate,
        int revenue,
        int runtime,
        List<SpokenLanguages> spokenLanguages,
        String status,
        String tagline,
        String title,
        bool video,
        double voteAverage,
        int voteCount}) {
    this._adult = adult;
    this._backdropPath = backdropPath;
    this._belongsToCollection = belongsToCollection;
    this._budget = budget;
    this._genres = genres;
    this._homepage = homepage;
    this._id = id;
    this._imdbId = imdbId;
    this._originalLanguage = originalLanguage;
    this._originalTitle = originalTitle;
    this._overview = overview;
    this._popularity = popularity;
    this._posterPath = posterPath;
    this._productionCompanies = productionCompanies;
    this._productionCountries = productionCountries;
    this._releaseDate = releaseDate;
    this._revenue = revenue;
    this._runtime = runtime;
    this._spokenLanguages = spokenLanguages;
    this._status = status;
    this._tagline = tagline;
    this._title = title;
    this._video = video;
    this._voteAverage = voteAverage;
    this._voteCount = voteCount;
  }

  bool get adult => _adult;
  set adult(bool adult) => _adult = adult;
  String get backdropPath => _backdropPath;
  set backdropPath(String backdropPath) => _backdropPath = backdropPath;
  Null get belongsToCollection => _belongsToCollection;
  set belongsToCollection(Null belongsToCollection) =>
      _belongsToCollection = belongsToCollection;
  int get budget => _budget;
  set budget(int budget) => _budget = budget;
  List<Genres> get genres => _genres;
  set genres(List<Genres> genres) => _genres = genres;
  String get homepage => _homepage;
  set homepage(String homepage) => _homepage = homepage;
  int get id => _id;
  set id(int id) => _id = id;
  String get imdbId => _imdbId;
  set imdbId(String imdbId) => _imdbId = imdbId;
  String get originalLanguage => _originalLanguage;
  set originalLanguage(String originalLanguage) =>
      _originalLanguage = originalLanguage;
  String get originalTitle => _originalTitle;
  set originalTitle(String originalTitle) => _originalTitle = originalTitle;
  String get overview => _overview;
  set overview(String overview) => _overview = overview;
  double get popularity => _popularity;
  set popularity(double popularity) => _popularity = popularity;
  String get posterPath => _posterPath;
  set posterPath(String posterPath) => _posterPath = posterPath;
  List<ProductionCompanies> get productionCompanies => _productionCompanies;
  set productionCompanies(List<ProductionCompanies> productionCompanies) =>
      _productionCompanies = productionCompanies;
  List<ProductionCountries> get productionCountries => _productionCountries;
  set productionCountries(List<ProductionCountries> productionCountries) =>
      _productionCountries = productionCountries;
  String get releaseDate => _releaseDate;
  set releaseDate(String releaseDate) => _releaseDate = releaseDate;
  int get revenue => _revenue;
  set revenue(int revenue) => _revenue = revenue;
  int get runtime => _runtime;
  set runtime(int runtime) => _runtime = runtime;
  List<SpokenLanguages> get spokenLanguages => _spokenLanguages;
  set spokenLanguages(List<SpokenLanguages> spokenLanguages) =>
      _spokenLanguages = spokenLanguages;
  String get status => _status;
  set status(String status) => _status = status;
  String get tagline => _tagline;
  set tagline(String tagline) => _tagline = tagline;
  String get title => _title;
  set title(String title) => _title = title;
  bool get video => _video;
  set video(bool video) => _video = video;
  double get voteAverage => _voteAverage;
  set voteAverage(double voteAverage) => _voteAverage = voteAverage;
  int get voteCount => _voteCount;
  set voteCount(int voteCount) => _voteCount = voteCount;

  MovieDetails.fromJson(Map<String, dynamic> json) {
    _adult = json['adult'];
    _backdropPath = json['backdrop_path'];
    _belongsToCollection = json['belongs_to_collection'];
    _budget = json['budget'];
    if (json['genres'] != null) {
      _genres = new List<Genres>();
      json['genres'].forEach((v) {
        _genres.add(new Genres.fromJson(v));
      });
    }
    _homepage = json['homepage'];
    _id = json['id'];
    _imdbId = json['imdb_id'];
    _originalLanguage = json['original_language'];
    _originalTitle = json['original_title'];
    _overview = json['overview'];
    _popularity = json['popularity'];
    _posterPath = json['poster_path'];
    if (json['production_companies'] != null) {
      _productionCompanies = new List<ProductionCompanies>();
      json['production_companies'].forEach((v) {
        _productionCompanies.add(new ProductionCompanies.fromJson(v));
      });
    }
    if (json['production_countries'] != null) {
      _productionCountries = new List<ProductionCountries>();
      json['production_countries'].forEach((v) {
        _productionCountries.add(new ProductionCountries.fromJson(v));
      });
    }
    _releaseDate = json['release_date'];
    _revenue = json['revenue'];
    _runtime = json['runtime'];
    if (json['spoken_languages'] != null) {
      _spokenLanguages = new List<SpokenLanguages>();
      json['spoken_languages'].forEach((v) {
        _spokenLanguages.add(new SpokenLanguages.fromJson(v));
      });
    }
    _status = json['status'];
    _tagline = json['tagline'];
    _title = json['title'];
    _video = json['video'];
    _voteAverage = json['vote_average'];
    _voteCount = json['vote_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['adult'] = this._adult;
    data['backdrop_path'] = this._backdropPath;
    data['belongs_to_collection'] = this._belongsToCollection;
    data['budget'] = this._budget;
    if (this._genres != null) {
      data['genres'] = this._genres.map((v) => v.toJson()).toList();
    }
    data['homepage'] = this._homepage;
    data['id'] = this._id;
    data['imdb_id'] = this._imdbId;
    data['original_language'] = this._originalLanguage;
    data['original_title'] = this._originalTitle;
    data['overview'] = this._overview;
    data['popularity'] = this._popularity;
    data['poster_path'] = this._posterPath;
    if (this._productionCompanies != null) {
      data['production_companies'] =
          this._productionCompanies.map((v) => v.toJson()).toList();
    }
    if (this._productionCountries != null) {
      data['production_countries'] =
          this._productionCountries.map((v) => v.toJson()).toList();
    }
    data['release_date'] = this._releaseDate;
    data['revenue'] = this._revenue;
    data['runtime'] = this._runtime;
    if (this._spokenLanguages != null) {
      data['spoken_languages'] =
          this._spokenLanguages.map((v) => v.toJson()).toList();
    }
    data['status'] = this._status;
    data['tagline'] = this._tagline;
    data['title'] = this._title;
    data['video'] = this._video;
    data['vote_average'] = this._voteAverage;
    data['vote_count'] = this._voteCount;
    return data;
  }
}

class Genres {
  int _id;
  String _name;

  Genres({int id, String name}) {
    this._id = id;
    this._name = name;
  }

  int get id => _id;
  set id(int id) => _id = id;
  String get name => _name;
  set name(String name) => _name = name;

  Genres.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    return data;
  }
}

class ProductionCompanies {
  int _id;
  String _logoPath;
  String _name;
  String _originCountry;

  ProductionCompanies(
      {int id, String logoPath, String name, String originCountry}) {
    this._id = id;
    this._logoPath = logoPath;
    this._name = name;
    this._originCountry = originCountry;
  }

  int get id => _id;
  set id(int id) => _id = id;
  String get logoPath => _logoPath;
  set logoPath(String logoPath) => _logoPath = logoPath;
  String get name => _name;
  set name(String name) => _name = name;
  String get originCountry => _originCountry;
  set originCountry(String originCountry) => _originCountry = originCountry;

  ProductionCompanies.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _logoPath = json['logo_path'];
    _name = json['name'];
    _originCountry = json['origin_country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['logo_path'] = this._logoPath;
    data['name'] = this._name;
    data['origin_country'] = this._originCountry;
    return data;
  }
}

class ProductionCountries {
  String _iso31661;
  String _name;

  ProductionCountries({String iso31661, String name}) {
    this._iso31661 = iso31661;
    this._name = name;
  }

  String get iso31661 => _iso31661;
  set iso31661(String iso31661) => _iso31661 = iso31661;
  String get name => _name;
  set name(String name) => _name = name;

  ProductionCountries.fromJson(Map<String, dynamic> json) {
    _iso31661 = json['iso_3166_1'];
    _name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['iso_3166_1'] = this._iso31661;
    data['name'] = this._name;
    return data;
  }
}

class SpokenLanguages {
  String _iso6391;
  String _name;

  SpokenLanguages({String iso6391, String name}) {
    this._iso6391 = iso6391;
    this._name = name;
  }

  String get iso6391 => _iso6391;
  set iso6391(String iso6391) => _iso6391 = iso6391;
  String get name => _name;
  set name(String name) => _name = name;

  SpokenLanguages.fromJson(Map<String, dynamic> json) {
    _iso6391 = json['iso_639_1'];
    _name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['iso_639_1'] = this._iso6391;
    data['name'] = this._name;
    return data;
  }
}
*/


