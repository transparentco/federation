module Federation
  module V2
    module Directives
      def self.all
        [
          ExternalDirective,
          RequiresDirective,
          ProvidesDirective,
          KeyDirective,
          LinkDirective,
          ShareableDirective,
          InaccessibleDirective,
          TagDirective,
          OverrideDirective,
          ComposeDirectiveDirective,
          InterfaceObjectDirective,
          AuthenticatedDirective,
          RequiresScopesDirective,
          PolicyDirective
        ]
      end

      Any = Oxide::Types::CustomScalar.new(name: "_Any")
      FieldSet = Oxide::Types::CustomScalar.new(name: "FieldSet")
      LinkImport = Oxide::Types::CustomScalar.new(name: "link__Import")
      FederationScope = Oxide::Types::CustomScalar.new(name: "federation__Scope")
      FederationPolicy = Oxide::Types::CustomScalar.new(name: "federation__Policy")

      LinkPurpose = Oxide::Types::EnumType.new(
        name: "link__Purpose",
        values: [
          Oxide::Types::EnumValue.new(name: "SECURITY"),
          Oxide::Types::EnumValue.new(name: "EXECUTION"),
        ]
      )

      # directive @external on FIELD_DEFINITION | OBJECT
      ExternalDirective = Oxide::Directive.new(
        name: "external",
        locations: [Oxide::Directive::Location::FIELD_DEFINITION, Oxide::Directive::Location::OBJECT]
      )

      # directive @requires(fields: FieldSet!) on FIELD_DEFINIT
      RequiresDirective = Oxide::Directive.new(
        name: "requires",
        arguments: {
          "fields" => Oxide::Argument.new(
            type: Oxide::Types::NonNullType.new(
              of_type: FieldSet
            )
          )
        },
        locations: [Oxide::Directive::Location::FIELD_DEFINITION]
      )

      # directive @provides(fields: FieldSet!) on FIELD_DEFINITION
      ProvidesDirective = Oxide::Directive.new(
        name: "provides",
        arguments: {
          "fields" => Oxide::Argument.new(
            type: Oxide::Types::NonNullType.new(
              of_type: FieldSet
            )
          )
        },
        locations: [Oxide::Directive::Location::FIELD_DEFINITION]
      )

      # directive @key(fields: FieldSet!, resolvable: Boolean = true) repeatable on OBJECT | INTERFACE
      KeyDirective = Oxide::Directive.new(
        name: "key",
        arguments: {
          "fields" => Oxide::Argument.new(
            type: Oxide::Types::NonNullType.new(
              of_type: FieldSet
            )
          ),
          "resolvable" => Oxide::Argument.new(
            type: Oxide::Types::BooleanType.new,
            default_value: true
          )
        },
        locations: [
          Oxide::Directive::Location::OBJECT,
          Oxide::Directive::Location::INTERFACE,
        ]
      )

      # directive @link(url: String!, as: String, for: link__Purpose, import: [link__Import]) repeatable on SCHEMA
      LinkDirective = Oxide::Directive.new(
        name: "link",
        arguments: {
          "url" => Oxide::Argument.new(
            type: Oxide::Types::NonNullType.new(
              of_type: Oxide::Types::StringType.new
            )
          ),
          "as" => Oxide::Argument.new(
            type: Oxide::Types::StringType.new
          ),
          "for" => Oxide::Argument.new(
            type: LinkPurpose
          ),
          "import" => Oxide::Argument.new(
            type: Oxide::Types::ListType.new(
              of_type: LinkImport
            )
          )
        },
        locations: [Oxide::Directive::Location::SCHEMA]
      )

      # directive @shareable repeatable on OBJECT | FIELD_DEFINITION
      ShareableDirective = Oxide::Directive.new(
        name: "shareable",
        locations: [
          Oxide::Directive::Location::OBJECT,
          Oxide::Directive::Location::FIELD_DEFINITION
        ],
      )

      # directive @inaccessible on FIELD_DEFINITION | OBJECT | INTERFACE | UNION | ARGUMENT_DEFINITION | SCALAR | ENUM | ENUM_VALUE | INPUT_OBJECT | INPUT_FIELD_DEFINITION
      InaccessibleDirective = Oxide::Directive.new(
        name: "inaccessible",
        locations: [
          Oxide::Directive::Location::OBJECT,
          Oxide::Directive::Location::FIELD_DEFINITION,
          Oxide::Directive::Location::INTERFACE,
          Oxide::Directive::Location::UNION,
          Oxide::Directive::Location::ARGUMENT_DEFINITION,
          Oxide::Directive::Location::SCALAR,
          Oxide::Directive::Location::ENUM,
          Oxide::Directive::Location::ENUM_VALUE,
          Oxide::Directive::Location::INPUT_OBJECT,
          Oxide::Directive::Location::INPUT_FIELD_DEFINITION,
        ],
      )

      # directive @tag(name: String!) repeatable on FIELD_DEFINITION | INTERFACE | OBJECT | UNION | ARGUMENT_DEFINITION | SCALAR | ENUM | ENUM_VALUE | INPUT_OBJECT | INPUT_FIELD_DEFINITION
      TagDirective = Oxide::Directive.new(
        name: "tag",
        arguments: {
          "name" => Oxide::Argument.new(
            type: Oxide::Types::NonNullType.new(
              of_type: Oxide::Types::StringType.new
            )
          )
        },
        locations: [
          Oxide::Directive::Location::OBJECT,
          Oxide::Directive::Location::FIELD_DEFINITION,
          Oxide::Directive::Location::INTERFACE,
          Oxide::Directive::Location::UNION,
          Oxide::Directive::Location::ARGUMENT_DEFINITION,
          Oxide::Directive::Location::SCALAR,
          Oxide::Directive::Location::ENUM,
          Oxide::Directive::Location::ENUM_VALUE,
          Oxide::Directive::Location::INPUT_OBJECT,
          Oxide::Directive::Location::INPUT_FIELD_DEFINITION,
        ],
      )

      # directive @override(from: String!) on FIELD_DEFINITION
      OverrideDirective = Oxide::Directive.new(
        name: "override",
        arguments: {
          "from" => Oxide::Argument.new(
            type: Oxide::Types::NonNullType.new(
              of_type: Oxide::Types::StringType.new
            )
          )
        },
        locations: [
          Oxide::Directive::Location::FIELD_DEFINITION
        ],
      )

      # directive @composeDirective(name: String!) repeatable on SCHEMA
      ComposeDirectiveDirective = Oxide::Directive.new(
        name: "composeDirective",
        arguments: {
          "name" => Oxide::Argument.new(
            type: Oxide::Types::NonNullType.new(
              of_type: Oxide::Types::StringType.new
            )
          )
        },
        locations: [
          Oxide::Directive::Location::SCHEMA
        ],
      )

      # directive @interfaceObject on OBJECT
      InterfaceObjectDirective = Oxide::Directive.new(
        name: "interfaceObject",
        locations: [
          Oxide::Directive::Location::OBJECT
        ],
      )

      # directive @authenticated on FIELD_DEFINITION | OBJECT | INTERFACE | SCALAR | ENUM
      AuthenticatedDirective = Oxide::Directive.new(
        name: "authenticated",
        locations: [
          Oxide::Directive::Location::FIELD_DEFINITION,
          Oxide::Directive::Location::OBJECT,
          Oxide::Directive::Location::INTERFACE,
          Oxide::Directive::Location::SCALAR,
          Oxide::Directive::Location::ENUM,
        ],
      )

      # directive @requiresScopes(scopes: [[federation__Scope!]!]!) on FIELD_DEFINITION | OBJECT | INTERFACE | SCALAR | ENUM
      RequiresScopesDirective = Oxide::Directive.new(
        name: "requiresScopes",
        arguments: {
          "scopes" => Oxide::Argument.new(
            type: Oxide::Types::NonNullType.new(
              of_type: Oxide::Types::ListType.new(
                of_type: Oxide::Types::NonNullType.new(
                  of_type: Oxide::Types::ListType.new(
                    of_type: Oxide::Types::NonNullType.new(
                      of_type: FederationScope
                    )
                  )
                )
              )
            )
          )
        },
        locations: [
          Oxide::Directive::Location::FIELD_DEFINITION,
          Oxide::Directive::Location::OBJECT,
          Oxide::Directive::Location::INTERFACE,
          Oxide::Directive::Location::SCALAR,
          Oxide::Directive::Location::ENUM,
        ],
      )

      # directive @policy(policies: [[federation__Policy!]!]!) on FIELD_DEFINITION | OBJECT | INTERFACE | SCALAR | ENUM
      PolicyDirective = Oxide::Directive.new(
        name: "policy",
        arguments: {
          "policies" => Oxide::Argument.new(
            type: Oxide::Types::NonNullType.new(
              of_type: Oxide::Types::ListType.new(
                of_type: Oxide::Types::NonNullType.new(
                  of_type: Oxide::Types::ListType.new(
                    of_type: Oxide::Types::NonNullType.new(
                      of_type: FederationPolicy
                    )
                  )
                )
              )
            )
          )
        },
        locations: [
          Oxide::Directive::Location::FIELD_DEFINITION,
          Oxide::Directive::Location::OBJECT,
          Oxide::Directive::Location::INTERFACE,
          Oxide::Directive::Location::SCALAR,
          Oxide::Directive::Location::ENUM,
        ],
      )
    end
  end
end