// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stage_progress.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetStageProgressCollection on Isar {
  IsarCollection<StageProgress> get stageProgress => this.collection();
}

const StageProgressSchema = CollectionSchema(
  name: r'StageProgress',
  id: 7882668812587299567,
  properties: {
    r'isCompleted': PropertySchema(
      id: 0,
      name: r'isCompleted',
      type: IsarType.bool,
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
  estimateSize: _stageProgressEstimateSize,
  serialize: _stageProgressSerialize,
  deserialize: _stageProgressDeserialize,
  deserializeProp: _stageProgressDeserializeProp,
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
  getId: _stageProgressGetId,
  getLinks: _stageProgressGetLinks,
  attach: _stageProgressAttach,
  version: '3.1.0+1',
);

int _stageProgressEstimateSize(
  StageProgress object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _stageProgressSerialize(
  StageProgress object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.isCompleted);
  writer.writeBool(offsets[1], object.isUnlocked);
  writer.writeLong(offsets[2], object.stageNumber);
  writer.writeLong(offsets[3], object.stars);
}

StageProgress _stageProgressDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = StageProgress();
  object.id = id;
  object.isCompleted = reader.readBool(offsets[0]);
  object.isUnlocked = reader.readBool(offsets[1]);
  object.stageNumber = reader.readLong(offsets[2]);
  object.stars = reader.readLong(offsets[3]);
  return object;
}

P _stageProgressDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBool(offset)) as P;
    case 1:
      return (reader.readBool(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _stageProgressGetId(StageProgress object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _stageProgressGetLinks(StageProgress object) {
  return [];
}

void _stageProgressAttach(
    IsarCollection<dynamic> col, Id id, StageProgress object) {
  object.id = id;
}

extension StageProgressByIndex on IsarCollection<StageProgress> {
  Future<StageProgress?> getByStageNumber(int stageNumber) {
    return getByIndex(r'stageNumber', [stageNumber]);
  }

  StageProgress? getByStageNumberSync(int stageNumber) {
    return getByIndexSync(r'stageNumber', [stageNumber]);
  }

  Future<bool> deleteByStageNumber(int stageNumber) {
    return deleteByIndex(r'stageNumber', [stageNumber]);
  }

  bool deleteByStageNumberSync(int stageNumber) {
    return deleteByIndexSync(r'stageNumber', [stageNumber]);
  }

  Future<List<StageProgress?>> getAllByStageNumber(
      List<int> stageNumberValues) {
    final values = stageNumberValues.map((e) => [e]).toList();
    return getAllByIndex(r'stageNumber', values);
  }

  List<StageProgress?> getAllByStageNumberSync(List<int> stageNumberValues) {
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

  Future<Id> putByStageNumber(StageProgress object) {
    return putByIndex(r'stageNumber', object);
  }

  Id putByStageNumberSync(StageProgress object, {bool saveLinks = true}) {
    return putByIndexSync(r'stageNumber', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByStageNumber(List<StageProgress> objects) {
    return putAllByIndex(r'stageNumber', objects);
  }

  List<Id> putAllByStageNumberSync(List<StageProgress> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'stageNumber', objects, saveLinks: saveLinks);
  }
}

extension StageProgressQueryWhereSort
    on QueryBuilder<StageProgress, StageProgress, QWhere> {
  QueryBuilder<StageProgress, StageProgress, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<StageProgress, StageProgress, QAfterWhere> anyStageNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'stageNumber'),
      );
    });
  }
}

extension StageProgressQueryWhere
    on QueryBuilder<StageProgress, StageProgress, QWhereClause> {
  QueryBuilder<StageProgress, StageProgress, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<StageProgress, StageProgress, QAfterWhereClause> idNotEqualTo(
      Id id) {
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

  QueryBuilder<StageProgress, StageProgress, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<StageProgress, StageProgress, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<StageProgress, StageProgress, QAfterWhereClause> idBetween(
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

  QueryBuilder<StageProgress, StageProgress, QAfterWhereClause>
      stageNumberEqualTo(int stageNumber) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'stageNumber',
        value: [stageNumber],
      ));
    });
  }

  QueryBuilder<StageProgress, StageProgress, QAfterWhereClause>
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

  QueryBuilder<StageProgress, StageProgress, QAfterWhereClause>
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

  QueryBuilder<StageProgress, StageProgress, QAfterWhereClause>
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

  QueryBuilder<StageProgress, StageProgress, QAfterWhereClause>
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

extension StageProgressQueryFilter
    on QueryBuilder<StageProgress, StageProgress, QFilterCondition> {
  QueryBuilder<StageProgress, StageProgress, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<StageProgress, StageProgress, QAfterFilterCondition>
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

  QueryBuilder<StageProgress, StageProgress, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<StageProgress, StageProgress, QAfterFilterCondition> idBetween(
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

  QueryBuilder<StageProgress, StageProgress, QAfterFilterCondition>
      isCompletedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isCompleted',
        value: value,
      ));
    });
  }

  QueryBuilder<StageProgress, StageProgress, QAfterFilterCondition>
      isUnlockedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isUnlocked',
        value: value,
      ));
    });
  }

  QueryBuilder<StageProgress, StageProgress, QAfterFilterCondition>
      stageNumberEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stageNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<StageProgress, StageProgress, QAfterFilterCondition>
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

  QueryBuilder<StageProgress, StageProgress, QAfterFilterCondition>
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

  QueryBuilder<StageProgress, StageProgress, QAfterFilterCondition>
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

  QueryBuilder<StageProgress, StageProgress, QAfterFilterCondition>
      starsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stars',
        value: value,
      ));
    });
  }

  QueryBuilder<StageProgress, StageProgress, QAfterFilterCondition>
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

  QueryBuilder<StageProgress, StageProgress, QAfterFilterCondition>
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

  QueryBuilder<StageProgress, StageProgress, QAfterFilterCondition>
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

extension StageProgressQueryObject
    on QueryBuilder<StageProgress, StageProgress, QFilterCondition> {}

extension StageProgressQueryLinks
    on QueryBuilder<StageProgress, StageProgress, QFilterCondition> {}

extension StageProgressQuerySortBy
    on QueryBuilder<StageProgress, StageProgress, QSortBy> {
  QueryBuilder<StageProgress, StageProgress, QAfterSortBy> sortByIsCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.asc);
    });
  }

  QueryBuilder<StageProgress, StageProgress, QAfterSortBy>
      sortByIsCompletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.desc);
    });
  }

  QueryBuilder<StageProgress, StageProgress, QAfterSortBy> sortByIsUnlocked() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isUnlocked', Sort.asc);
    });
  }

  QueryBuilder<StageProgress, StageProgress, QAfterSortBy>
      sortByIsUnlockedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isUnlocked', Sort.desc);
    });
  }

  QueryBuilder<StageProgress, StageProgress, QAfterSortBy> sortByStageNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stageNumber', Sort.asc);
    });
  }

  QueryBuilder<StageProgress, StageProgress, QAfterSortBy>
      sortByStageNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stageNumber', Sort.desc);
    });
  }

  QueryBuilder<StageProgress, StageProgress, QAfterSortBy> sortByStars() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stars', Sort.asc);
    });
  }

  QueryBuilder<StageProgress, StageProgress, QAfterSortBy> sortByStarsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stars', Sort.desc);
    });
  }
}

extension StageProgressQuerySortThenBy
    on QueryBuilder<StageProgress, StageProgress, QSortThenBy> {
  QueryBuilder<StageProgress, StageProgress, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<StageProgress, StageProgress, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<StageProgress, StageProgress, QAfterSortBy> thenByIsCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.asc);
    });
  }

  QueryBuilder<StageProgress, StageProgress, QAfterSortBy>
      thenByIsCompletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.desc);
    });
  }

  QueryBuilder<StageProgress, StageProgress, QAfterSortBy> thenByIsUnlocked() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isUnlocked', Sort.asc);
    });
  }

  QueryBuilder<StageProgress, StageProgress, QAfterSortBy>
      thenByIsUnlockedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isUnlocked', Sort.desc);
    });
  }

  QueryBuilder<StageProgress, StageProgress, QAfterSortBy> thenByStageNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stageNumber', Sort.asc);
    });
  }

  QueryBuilder<StageProgress, StageProgress, QAfterSortBy>
      thenByStageNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stageNumber', Sort.desc);
    });
  }

  QueryBuilder<StageProgress, StageProgress, QAfterSortBy> thenByStars() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stars', Sort.asc);
    });
  }

  QueryBuilder<StageProgress, StageProgress, QAfterSortBy> thenByStarsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stars', Sort.desc);
    });
  }
}

extension StageProgressQueryWhereDistinct
    on QueryBuilder<StageProgress, StageProgress, QDistinct> {
  QueryBuilder<StageProgress, StageProgress, QDistinct>
      distinctByIsCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isCompleted');
    });
  }

  QueryBuilder<StageProgress, StageProgress, QDistinct> distinctByIsUnlocked() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isUnlocked');
    });
  }

  QueryBuilder<StageProgress, StageProgress, QDistinct>
      distinctByStageNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'stageNumber');
    });
  }

  QueryBuilder<StageProgress, StageProgress, QDistinct> distinctByStars() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'stars');
    });
  }
}

extension StageProgressQueryProperty
    on QueryBuilder<StageProgress, StageProgress, QQueryProperty> {
  QueryBuilder<StageProgress, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<StageProgress, bool, QQueryOperations> isCompletedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isCompleted');
    });
  }

  QueryBuilder<StageProgress, bool, QQueryOperations> isUnlockedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isUnlocked');
    });
  }

  QueryBuilder<StageProgress, int, QQueryOperations> stageNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'stageNumber');
    });
  }

  QueryBuilder<StageProgress, int, QQueryOperations> starsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'stars');
    });
  }
}
