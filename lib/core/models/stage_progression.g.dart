// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stage_progression.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetStageProgressionCollection on Isar {
  IsarCollection<StageProgression> get stageProgressions => this.collection();
}

const StageProgressionSchema = CollectionSchema(
  name: r'StageProgression',
  id: -7596203381479089139,
  properties: {
    r'bestMoves': PropertySchema(
      id: 0,
      name: r'bestMoves',
      type: IsarType.long,
    ),
    r'isUnlocked': PropertySchema(
      id: 1,
      name: r'isUnlocked',
      type: IsarType.bool,
    ),
    r'stageNumber': PropertySchema(
      id: 2,
      name: r'stageNumber',
      type: IsarType.long,
    ),
    r'stars': PropertySchema(
      id: 3,
      name: r'stars',
      type: IsarType.long,
    )
  },
  estimateSize: _stageProgressionEstimateSize,
  serialize: _stageProgressionSerialize,
  deserialize: _stageProgressionDeserialize,
  deserializeProp: _stageProgressionDeserializeProp,
  idName: r'id',
  indexes: {
    r'stageNumber': IndexSchema(
      id: -9111739378591519906,
      name: r'stageNumber',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'stageNumber',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _stageProgressionGetId,
  getLinks: _stageProgressionGetLinks,
  attach: _stageProgressionAttach,
  version: '3.1.0+1',
);

int _stageProgressionEstimateSize(
  StageProgression object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _stageProgressionSerialize(
  StageProgression object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.bestMoves);
  writer.writeBool(offsets[1], object.isUnlocked);
  writer.writeLong(offsets[2], object.stageNumber);
  writer.writeLong(offsets[3], object.stars);
}

StageProgression _stageProgressionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = StageProgression(
    bestMoves: reader.readLongOrNull(offsets[0]) ?? 0,
    isUnlocked: reader.readBoolOrNull(offsets[1]) ?? false,
    stageNumber: reader.readLong(offsets[2]),
    stars: reader.readLongOrNull(offsets[3]) ?? 0,
  );
  object.id = id;
  return object;
}

P _stageProgressionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset) ?? 0) as P;
    case 1:
      return (reader.readBoolOrNull(offset) ?? false) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readLongOrNull(offset) ?? 0) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _stageProgressionGetId(StageProgression object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _stageProgressionGetLinks(StageProgression object) {
  return [];
}

void _stageProgressionAttach(
    IsarCollection<dynamic> col, Id id, StageProgression object) {
  object.id = id;
}

extension StageProgressionByIndex on IsarCollection<StageProgression> {
  Future<StageProgression?> getByStageNumber(int stageNumber) {
    return getByIndex(r'stageNumber', [stageNumber]);
  }

  StageProgression? getByStageNumberSync(int stageNumber) {
    return getByIndexSync(r'stageNumber', [stageNumber]);
  }

  Future<bool> deleteByStageNumber(int stageNumber) {
    return deleteByIndex(r'stageNumber', [stageNumber]);
  }

  bool deleteByStageNumberSync(int stageNumber) {
    return deleteByIndexSync(r'stageNumber', [stageNumber]);
  }

  Future<List<StageProgression?>> getAllByStageNumber(
      List<int> stageNumberValues) {
    final values = stageNumberValues.map((e) => [e]).toList();
    return getAllByIndex(r'stageNumber', values);
  }

  List<StageProgression?> getAllByStageNumberSync(List<int> stageNumberValues) {
    final values = stageNumberValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'stageNumber', values);
  }

  Future<int> deleteAllByStageNumber(List<int> stageNumberValues) {
    final values = stageNumberValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'stageNumber', values);
  }

  int deleteAllByStageNumberSync(List<int> stageNumberValues) {
    final values = stageNumberValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'stageNumber', values);
  }

  Future<Id> putByStageNumber(StageProgression object) {
    return putByIndex(r'stageNumber', object);
  }

  Id putByStageNumberSync(StageProgression object, {bool saveLinks = true}) {
    return putByIndexSync(r'stageNumber', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByStageNumber(List<StageProgression> objects) {
    return putAllByIndex(r'stageNumber', objects);
  }

  List<Id> putAllByStageNumberSync(List<StageProgression> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'stageNumber', objects, saveLinks: saveLinks);
  }
}

extension StageProgressionQueryWhereSort
    on QueryBuilder<StageProgression, StageProgression, QWhere> {
  QueryBuilder<StageProgression, StageProgression, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<StageProgression, StageProgression, QAfterWhere>
      anyStageNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'stageNumber'),
      );
    });
  }
}

extension StageProgressionQueryWhere
    on QueryBuilder<StageProgression, StageProgression, QWhereClause> {
  QueryBuilder<StageProgression, StageProgression, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<StageProgression, StageProgression, QAfterWhereClause>
      idNotEqualTo(Id id) {
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

  QueryBuilder<StageProgression, StageProgression, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<StageProgression, StageProgression, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<StageProgression, StageProgression, QAfterWhereClause> idBetween(
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

  QueryBuilder<StageProgression, StageProgression, QAfterWhereClause>
      stageNumberEqualTo(int stageNumber) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'stageNumber',
        value: [stageNumber],
      ));
    });
  }

  QueryBuilder<StageProgression, StageProgression, QAfterWhereClause>
      stageNumberNotEqualTo(int stageNumber) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'stageNumber',
              lower: [],
              upper: [stageNumber],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'stageNumber',
              lower: [stageNumber],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'stageNumber',
              lower: [stageNumber],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'stageNumber',
              lower: [],
              upper: [stageNumber],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<StageProgression, StageProgression, QAfterWhereClause>
      stageNumberGreaterThan(
    int stageNumber, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'stageNumber',
        lower: [stageNumber],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<StageProgression, StageProgression, QAfterWhereClause>
      stageNumberLessThan(
    int stageNumber, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'stageNumber',
        lower: [],
        upper: [stageNumber],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<StageProgression, StageProgression, QAfterWhereClause>
      stageNumberBetween(
    int lowerStageNumber,
    int upperStageNumber, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'stageNumber',
        lower: [lowerStageNumber],
        includeLower: includeLower,
        upper: [upperStageNumber],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension StageProgressionQueryFilter
    on QueryBuilder<StageProgression, StageProgression, QFilterCondition> {
  QueryBuilder<StageProgression, StageProgression, QAfterFilterCondition>
      bestMovesEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bestMoves',
        value: value,
      ));
    });
  }

  QueryBuilder<StageProgression, StageProgression, QAfterFilterCondition>
      bestMovesGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bestMoves',
        value: value,
      ));
    });
  }

  QueryBuilder<StageProgression, StageProgression, QAfterFilterCondition>
      bestMovesLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bestMoves',
        value: value,
      ));
    });
  }

  QueryBuilder<StageProgression, StageProgression, QAfterFilterCondition>
      bestMovesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bestMoves',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<StageProgression, StageProgression, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<StageProgression, StageProgression, QAfterFilterCondition>
      idGreaterThan(
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

  QueryBuilder<StageProgression, StageProgression, QAfterFilterCondition>
      idLessThan(
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

  QueryBuilder<StageProgression, StageProgression, QAfterFilterCondition>
      idBetween(
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

  QueryBuilder<StageProgression, StageProgression, QAfterFilterCondition>
      isUnlockedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isUnlocked',
        value: value,
      ));
    });
  }

  QueryBuilder<StageProgression, StageProgression, QAfterFilterCondition>
      stageNumberEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stageNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<StageProgression, StageProgression, QAfterFilterCondition>
      stageNumberGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'stageNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<StageProgression, StageProgression, QAfterFilterCondition>
      stageNumberLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'stageNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<StageProgression, StageProgression, QAfterFilterCondition>
      stageNumberBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'stageNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<StageProgression, StageProgression, QAfterFilterCondition>
      starsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stars',
        value: value,
      ));
    });
  }

  QueryBuilder<StageProgression, StageProgression, QAfterFilterCondition>
      starsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'stars',
        value: value,
      ));
    });
  }

  QueryBuilder<StageProgression, StageProgression, QAfterFilterCondition>
      starsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'stars',
        value: value,
      ));
    });
  }

  QueryBuilder<StageProgression, StageProgression, QAfterFilterCondition>
      starsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'stars',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension StageProgressionQueryObject
    on QueryBuilder<StageProgression, StageProgression, QFilterCondition> {}

extension StageProgressionQueryLinks
    on QueryBuilder<StageProgression, StageProgression, QFilterCondition> {}

extension StageProgressionQuerySortBy
    on QueryBuilder<StageProgression, StageProgression, QSortBy> {
  QueryBuilder<StageProgression, StageProgression, QAfterSortBy>
      sortByBestMoves() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bestMoves', Sort.asc);
    });
  }

  QueryBuilder<StageProgression, StageProgression, QAfterSortBy>
      sortByBestMovesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bestMoves', Sort.desc);
    });
  }

  QueryBuilder<StageProgression, StageProgression, QAfterSortBy>
      sortByIsUnlocked() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isUnlocked', Sort.asc);
    });
  }

  QueryBuilder<StageProgression, StageProgression, QAfterSortBy>
      sortByIsUnlockedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isUnlocked', Sort.desc);
    });
  }

  QueryBuilder<StageProgression, StageProgression, QAfterSortBy>
      sortByStageNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stageNumber', Sort.asc);
    });
  }

  QueryBuilder<StageProgression, StageProgression, QAfterSortBy>
      sortByStageNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stageNumber', Sort.desc);
    });
  }

  QueryBuilder<StageProgression, StageProgression, QAfterSortBy> sortByStars() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stars', Sort.asc);
    });
  }

  QueryBuilder<StageProgression, StageProgression, QAfterSortBy>
      sortByStarsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stars', Sort.desc);
    });
  }
}

extension StageProgressionQuerySortThenBy
    on QueryBuilder<StageProgression, StageProgression, QSortThenBy> {
  QueryBuilder<StageProgression, StageProgression, QAfterSortBy>
      thenByBestMoves() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bestMoves', Sort.asc);
    });
  }

  QueryBuilder<StageProgression, StageProgression, QAfterSortBy>
      thenByBestMovesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bestMoves', Sort.desc);
    });
  }

  QueryBuilder<StageProgression, StageProgression, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<StageProgression, StageProgression, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<StageProgression, StageProgression, QAfterSortBy>
      thenByIsUnlocked() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isUnlocked', Sort.asc);
    });
  }

  QueryBuilder<StageProgression, StageProgression, QAfterSortBy>
      thenByIsUnlockedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isUnlocked', Sort.desc);
    });
  }

  QueryBuilder<StageProgression, StageProgression, QAfterSortBy>
      thenByStageNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stageNumber', Sort.asc);
    });
  }

  QueryBuilder<StageProgression, StageProgression, QAfterSortBy>
      thenByStageNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stageNumber', Sort.desc);
    });
  }

  QueryBuilder<StageProgression, StageProgression, QAfterSortBy> thenByStars() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stars', Sort.asc);
    });
  }

  QueryBuilder<StageProgression, StageProgression, QAfterSortBy>
      thenByStarsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stars', Sort.desc);
    });
  }
}

extension StageProgressionQueryWhereDistinct
    on QueryBuilder<StageProgression, StageProgression, QDistinct> {
  QueryBuilder<StageProgression, StageProgression, QDistinct>
      distinctByBestMoves() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bestMoves');
    });
  }

  QueryBuilder<StageProgression, StageProgression, QDistinct>
      distinctByIsUnlocked() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isUnlocked');
    });
  }

  QueryBuilder<StageProgression, StageProgression, QDistinct>
      distinctByStageNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'stageNumber');
    });
  }

  QueryBuilder<StageProgression, StageProgression, QDistinct>
      distinctByStars() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'stars');
    });
  }
}

extension StageProgressionQueryProperty
    on QueryBuilder<StageProgression, StageProgression, QQueryProperty> {
  QueryBuilder<StageProgression, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<StageProgression, int, QQueryOperations> bestMovesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bestMoves');
    });
  }

  QueryBuilder<StageProgression, bool, QQueryOperations> isUnlockedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isUnlocked');
    });
  }

  QueryBuilder<StageProgression, int, QQueryOperations> stageNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'stageNumber');
    });
  }

  QueryBuilder<StageProgression, int, QQueryOperations> starsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'stars');
    });
  }
}
