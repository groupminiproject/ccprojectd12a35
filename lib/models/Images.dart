/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, annotate_overrides, dead_code, dead_codepublic_member_api_docs, depend_on_referenced_packages, file_names, library_private_types_in_public_api, no_leading_underscores_for_library_prefixes, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, null_check_on_nullable_type_parameter, prefer_adjacent_string_concatenation, prefer_const_constructors, prefer_if_null_operators, prefer_interpolation_to_compose_strings, slash_for_doc_comments, sort_child_properties_last, unnecessary_const, unnecessary_constructor_name, unnecessary_late, unnecessary_new, unnecessary_null_aware_assignments, unnecessary_nullable_for_final_variable_declarations, unnecessary_string_interpolations, use_build_context_synchronously

import 'ModelProvider.dart';
import 'package:amplify_core/amplify_core.dart' as amplify_core;
import 'package:collection/collection.dart';


/** This is an auto generated class representing the Images type in your schema. */
class Images extends amplify_core.Model {
  static const classType = const _ImagesModelType();
  final String id;
  final String? _imageUrl;
  final String? _imageTitle;
  final List<String>? _labels;
  final String? _userId;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  ImagesModelIdentifier get modelIdentifier {
      return ImagesModelIdentifier(
        id: id
      );
  }
  
  String get imageUrl {
    try {
      return _imageUrl!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get imageTitle {
    try {
      return _imageTitle!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  List<String> get labels {
    try {
      return _labels!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get userId {
    try {
      return _userId!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Images._internal({required this.id, required imageUrl, required imageTitle, required labels, required userId, createdAt, updatedAt}): _imageUrl = imageUrl, _imageTitle = imageTitle, _labels = labels, _userId = userId, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Images({String? id, required String imageUrl, required String imageTitle, required List<String> labels, required String userId}) {
    return Images._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      imageUrl: imageUrl,
      imageTitle: imageTitle,
      labels: labels != null ? List<String>.unmodifiable(labels) : labels,
      userId: userId);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Images &&
      id == other.id &&
      _imageUrl == other._imageUrl &&
      _imageTitle == other._imageTitle &&
      DeepCollectionEquality().equals(_labels, other._labels) &&
      _userId == other._userId;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Images {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("imageUrl=" + "$_imageUrl" + ", ");
    buffer.write("imageTitle=" + "$_imageTitle" + ", ");
    buffer.write("labels=" + (_labels != null ? _labels!.toString() : "null") + ", ");
    buffer.write("userId=" + "$_userId" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Images copyWith({String? imageUrl, String? imageTitle, List<String>? labels, String? userId}) {
    return Images._internal(
      id: id,
      imageUrl: imageUrl ?? this.imageUrl,
      imageTitle: imageTitle ?? this.imageTitle,
      labels: labels ?? this.labels,
      userId: userId ?? this.userId);
  }
  
  Images copyWithModelFieldValues({
    ModelFieldValue<String>? imageUrl,
    ModelFieldValue<String>? imageTitle,
    ModelFieldValue<List<String>?>? labels,
    ModelFieldValue<String>? userId
  }) {
    return Images._internal(
      id: id,
      imageUrl: imageUrl == null ? this.imageUrl : imageUrl.value,
      imageTitle: imageTitle == null ? this.imageTitle : imageTitle.value,
      labels: labels == null ? this.labels : labels.value,
      userId: userId == null ? this.userId : userId.value
    );
  }
  
  Images.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _imageUrl = json['imageUrl'],
      _imageTitle = json['imageTitle'],
      _labels = json['labels']?.cast<String>(),
      _userId = json['userId'],
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'imageUrl': _imageUrl, 'imageTitle': _imageTitle, 'labels': _labels, 'userId': _userId, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'imageUrl': _imageUrl,
    'imageTitle': _imageTitle,
    'labels': _labels,
    'userId': _userId,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<ImagesModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<ImagesModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final IMAGEURL = amplify_core.QueryField(fieldName: "imageUrl");
  static final IMAGETITLE = amplify_core.QueryField(fieldName: "imageTitle");
  static final LABELS = amplify_core.QueryField(fieldName: "labels");
  static final USERID = amplify_core.QueryField(fieldName: "userId");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Images";
    modelSchemaDefinition.pluralName = "Images";
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Images.IMAGEURL,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Images.IMAGETITLE,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Images.LABELS,
      isRequired: true,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Images.USERID,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.nonQueryField(
      fieldName: 'createdAt',
      isRequired: false,
      isReadOnly: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.nonQueryField(
      fieldName: 'updatedAt',
      isRequired: false,
      isReadOnly: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _ImagesModelType extends amplify_core.ModelType<Images> {
  const _ImagesModelType();
  
  @override
  Images fromJson(Map<String, dynamic> jsonData) {
    return Images.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Images';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Images] in your schema.
 */
class ImagesModelIdentifier implements amplify_core.ModelIdentifier<Images> {
  final String id;

  /** Create an instance of ImagesModelIdentifier using [id] the primary key. */
  const ImagesModelIdentifier({
    required this.id});
  
  @override
  Map<String, dynamic> serializeAsMap() => (<String, dynamic>{
    'id': id
  });
  
  @override
  List<Map<String, dynamic>> serializeAsList() => serializeAsMap()
    .entries
    .map((entry) => (<String, dynamic>{ entry.key: entry.value }))
    .toList();
  
  @override
  String serializeAsString() => serializeAsMap().values.join('#');
  
  @override
  String toString() => 'ImagesModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is ImagesModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}