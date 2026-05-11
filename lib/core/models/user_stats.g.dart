// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_stats.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetUserStatsCollection on Isar {
  IsarCollection<UserStats> get userStats => this.collection();
}

const UserStatsSchema = CollectionSchema(
  name: r'UserStats',
  id: 3718987168289318233,
  properties: {
    r'lastPlayed': PropertySchema(
      id: 0,
      name: r'lastPlayed',
      type: IsarType.dateTime,
    ),
    r'totalDraws': PropertySchema(
      id: 1,
      name: r'totalDraws',
      type: IsarType.long,
    ),
    r'totalLosses': PropertySchema(
      id: 2,
      name: r'totalLosses',
      type: IsarType.long,
    ),
    r'totalStars': PropertySchema(
      id: 3,
      name: r'totalStars',
      type: IsarType.long,
    ),
    r'totalWins': PropertySchema(
      id: 4,
      name: r'totalWins',
      type: IsarType.long,
    )
  },
  estimateSize: _userStatsEstimateSize,
  serialize: _userStatsSerialize,
  deserialize: _userStatsDeserialize,
  deserializeProp: _userStatsDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _userStatsGetId,
  getLinks: _userStatsGetLinks,
  attach: _userStatsAttach,
  version: '3.1.0+1',
);

int _userStatsEstimateSize(
  UserStats object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _userStatsSerialize(
  UserStats object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.lastPlayed);
  writer.writeLong(offsets[1], object.totalDraws);
  writer.writeLong(offsets[2], object.totalLosses);
  writer.writeLong(offsets[3], object.totalStars);
  writer.writeLong(offsets[4], object.totalWins);
}

UserStats _userStatsDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = UserStats();
  object.id = id;
  object.lastPlayed = reader.readDateTimeOrNull(offsets[0]);
  object.totalDraws = reader.readLong(offsets[1]);
  object.totalLosses = reader.readLong(offsets[2]);
  object.totalStars = reader.readLong(offsets[3]);
  object.totalWins = reader.readLong(offsets[4]);
  return object;
}

P _userStatsDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _userStatsGetId(UserStats object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _userStatsGetLinks(UserStats object) {
  return [];
}

void _userStatsAttach(IsarCollection<dynamic> col, Id id, UserStats object) {
  object.id = id;
}

extension UserStatsQueryWhereSort
    on QueryBuilder<UserStats, UserStats, QWhere> {
  QueryBuilder<UserStats, UserStats, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension UserStatsQueryWhere
    on QueryBuilder<UserStats, UserStats, QWhereClause> {
  QueryBuilder<UserStats, UserStats, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<UserStats, UserStats, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<UserStats, UserStats, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<UserStats, UserStats, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<UserStats, UserStats, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension UserStatsQueryFilter
    on QueryBuilder<UserStats, UserStats, QFilterCondition> {
  QueryBuilder<UserStats, UserStats, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<UserStats, UserStats, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<UserStats, UserStats, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<UserStats, UserStats, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<UserStats, UserStats, QAfterFilterCondition> lastPlayedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastPlayed',
      ));
    });
  }

  QueryBuilder<UserStats, UserStats, QAfterFilterCondition>
      lastPlayedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastPlayed',
      ));
    });
  }

  QueryBuilder<UserStats, UserStats, QAfterFilterCondition> lastPlayedEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastPlayed',
        value: value,
      ));
    });
  }

  QueryBuilder<UserStats, UserStats, QAfterFilterCondition>
      lastPlayedGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastPlayed',
        value: value,
      ));
    });
  }

  QueryBuilder<UserStats, UserStats, QAfterFilterCondition> lastPlayedLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastPlayed',
        value: value,
      ));
    });
  }

  QueryBuilder<UserStats, UserStats, QAfterFilterCondition> lastPlayedBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastPlayed',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<UserStats, UserStats, QAfterFilterCondition> totalDrawsEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalDraws',
        value: value,
      ));
    });
  }

  QueryBuilder<UserStats, UserStats, QAfterFilterCondition>
      totalDrawsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalDraws',
        value: value,
      ));
    });
  }

  QueryBuilder<UserStats, UserStats, QAfterFilterCondition> totalDrawsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalDraws',
        value: value,
      ));
    });
  }

  QueryBuilder<UserStats, UserStats, QAfterFilterCondition> totalDrawsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalDraws',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<UserStats, UserStats, QAfterFilterCondition> totalLossesEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalLosses',
        value: value,
      ));
    });
  }

  QueryBuilder<UserStats, UserStats, QAfterFilterCondition>
      totalLossesGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalLosses',
        value: value,
      ));
    });
  }

  QueryBuilder<UserStats, UserStats, QAfterFilterCondition> totalLossesLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalLosses',
        value: value,
      ));
    });
  }

  QueryBuilder<UserStats, UserStats, QAfterFilterCondition> totalLossesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalLosses',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<UserStats, UserStats, QAfterFilterCondition> totalStarsEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalStars',
        value: value,
      ));
    });
  }

  QueryBuilder<UserStats, UserStats, QAfterFilterCondition>
      totalStarsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalStars',
        value: value,
      ));
    });
  }

  QueryBuilder<UserStats, UserStats, QAfterFilterCondition> totalStarsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalStars',
        value: value,
      ));
    });
  }

  QueryBuilder<UserStats, UserStats, QAfterFilterCondition> totalStarsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalStars',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<UserStats, UserStats, QAfterFilterCondition> totalWinsEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalWins',
        value: value,
      ));
    });
  }

  QueryBuilder<UserStats, UserStats, QAfterFilterCondition>
      totalWinsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalWins',
        value: value,
      ));
    });
  }

  QueryBuilder<UserStats, UserStats, QAfterFilterCondition> totalWinsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalWins',
        value: value,
      ));
    });
  }

  QueryBuilder<UserStats, UserStats, QAfterFilterCondition> totalWinsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalWins',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension UserStatsQueryObject
    on QueryBuilder<UserStats, UserStats, QFilterCondition> {}

extension UserStatsQueryLinks
    on QueryBuilder<UserStats, UserStats, QFilterCondition> {}

extension UserStatsQuerySortBy on QueryBuilder<UserStats, UserStats, QSortBy> {
  QueryBuilder<UserStats, UserStats, QAfterSortBy> sortByLastPlayed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastPlayed', Sort.asc);
    });
  }

  QueryBuilder<UserStats, UserStats, QAfterSortBy> sortByLastPlayedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastPlayed', Sort.desc);
    });
  }

  QueryBuilder<UserStats, UserStats, QAfterSortBy> sortByTotalDraws() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalDraws', Sort.asc);
    });
  }

  QueryBuilder<UserStats, UserStats, QAfterSortBy> sortByTotalDrawsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalDraws', Sort.desc);
    });
  }

  QueryBuilder<UserStats, UserStats, QAfterSortBy> sortByTotalLosses() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalLosses', Sort.asc);
    });
  }

  QueryBuilder<UserStats, UserStats, QAfterSortBy> sortByTotalLossesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalLosses', Sort.desc);
    });
  }

  QueryBuilder<UserStats, UserStats, QAfterSortBy> sortByTotalStars() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalStars', Sort.asc);
    });
  }

  QueryBuilder<UserStats, UserStats, QAfterSortBy> sortByTotalStarsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalStars', Sort.desc);
    });
  }

  QueryBuilder<UserStats, UserStats, QAfterSortBy> sortByTotalWins() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalWins', Sort.asc);
    });
  }

  QueryBuilder<UserStats, UserStats, QAfterSortBy> sortByTotalWinsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalWins', Sort.desc);
    });
  }
}

extension UserStatsQuerySortThenBy
    on QueryBuilder<UserStats, UserStats, QSortThenBy> {
  QueryBuilder<UserStats, UserStats, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<UserStats, UserStats, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<UserStats, UserStats, QAfterSortBy> thenByLastPlayed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastPlayed', Sort.asc);
    });
  }

  QueryBuilder<UserStats, UserStats, QAfterSortBy> thenByLastPlayedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastPlayed', Sort.desc);
    });
  }

  QueryBuilder<UserStats, UserStats, QAfterSortBy> thenByTotalDraws() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalDraws', Sort.asc);
    });
  }

  QueryBuilder<UserStats, UserStats, QAfterSortBy> thenByTotalDrawsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalDraws', Sort.desc);
    });
  }

  QueryBuilder<UserStats, UserStats, QAfterSortBy> thenByTotalLosses() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalLosses', Sort.asc);
    });
  }

  QueryBuilder<UserStats, UserStats, QAfterSortBy> thenByTotalLossesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalLosses', Sort.desc);
    });
  }

  QueryBuilder<UserStats, UserStats, QAfterSortBy> thenByTotalStars() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalStars', Sort.asc);
    });
  }

  QueryBuilder<UserStats, UserStats, QAfterSortBy> thenByTotalStarsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalStars', Sort.desc);
    });
  }

  QueryBuilder<UserStats, UserStats, QAfterSortBy> thenByTotalWins() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalWins', Sort.asc);
    });
  }

  QueryBuilder<UserStats, UserStats, QAfterSortBy> thenByTotalWinsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalWins', Sort.desc);
    });
  }
}

extension UserStatsQueryWhereDistinct
    on QueryBuilder<UserStats, UserStats, QDistinct> {
  QueryBuilder<UserStats, UserStats, QDistinct> distinctByLastPlayed() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastPlayed');
    });
  }

  QueryBuilder<UserStats, UserStats, QDistinct> distinctByTotalDraws() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalDraws');
    });
  }

  QueryBuilder<UserStats, UserStats, QDistinct> distinctByTotalLosses() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalLosses');
    });
  }

  QueryBuilder<UserStats, UserStats, QDistinct> distinctByTotalStars() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalStars');
    });
  }

  QueryBuilder<UserStats, UserStats, QDistinct> distinctByTotalWins() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalWins');
    });
  }
}

extension UserStatsQueryProperty
    on QueryBuilder<UserStats, UserStats, QQueryProperty> {
  QueryBuilder<UserStats, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<UserStats, DateTime?, QQueryOperations> lastPlayedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastPlayed');
    });
  }

  QueryBuilder<UserStats, int, QQueryOperations> totalDrawsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalDraws');
    });
  }

  QueryBuilder<UserStats, int, QQueryOperations> totalLossesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalLosses');
    });
  }

  QueryBuilder<UserStats, int, QQueryOperations> totalStarsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalStars');
    });
  }

  QueryBuilder<UserStats, int, QQueryOperations> totalWinsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalWins');
    });
  }
}
