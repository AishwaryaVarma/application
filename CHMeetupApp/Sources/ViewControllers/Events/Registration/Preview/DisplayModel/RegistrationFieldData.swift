//
//  RegistrationFieldData.swift
//  CHMeetupApp
//
//  Created by Maxim Globak on 05.03.17.
//  Copyright © 2017 CocoaHeads Community. All rights reserved.
//

import Foundation

struct FormData {
  var id: Int
  var name: String
  var sections: [FormFieldItem]

  init(with form: EventRegFormPlainObject) {
    id = form.id
    name = form.name
    sections = form.fields.flatMap(FormFieldItem.init)
  }
}

struct FormFieldItem {
  var id: Int
  var isRequired: Bool
  var name: String
  var type: EventRegFormFieldType
  var fieldAnswers: [FormFieldAnswer]

  init(with field: EventRegFormFieldPlainObject) {
    id = field.id
    isRequired = field.required
    name = field.name
    type = field.type
    fieldAnswers = field.answers.flatMap { FormFieldAnswer(with: $0, fieldType: field.type) }
  }
}

struct FormFieldAnswer {
  var id: Int
  var value: String
  var type: EventRegFormFieldType

  init(with answer: EventRegFormFieldAnswerPlainObject,
       fieldType: EventRegFormFieldType) {
    id = answer.id
    value = answer.value
    type = fieldType
  }
}

struct FieldAnswer {
  var id: Int
  var fieldId: String
  var userId: String
  var answer: String
}
