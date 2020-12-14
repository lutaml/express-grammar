grammar Express;

// A.1.5 Interpreted identifiers

attributeRef
	: attributeId
	; // 150

constantRef
	: constantId
	; // 151

entityRef
	: entityId
	; // 152

enumerationRef
	: enumerationId
	; // 153

functionRef
	: functionId
	; // 154

parameterRef
	: parameterId
	; // 155

procedureRef
	: procedureId
	; // 156

ruleLabelRef
	: ruleLabelId
	; // 157

ruleRef
	: ruleId
	; // 158

schemaRef
	: schemaId
	; // 159

subtypeConstraintRef
	: subtypeConstraintId
	; // 160

typeLabelRef
	: typeLabelId
	; // 161

typeRef
	: typeId
	; // 162

variableRef
	: variableId
	; // 163

// A.2 Grammar rules

abstractEntityDeclaration
	: ABSTRACT
	; // 164

abstractSupertype
	: ABSTRACT SUPERTYPE ';'
	; // 165

abstractSupertypeDeclaration
	: ABSTRACT SUPERTYPE subtypeConstraint?
	; // 166

actualParameterList
	: '(' parameter (',' parameter)* ')'
	; // 167

addLikeOp
	: '+'
	| '-'
	| OR
	| XOR
	; // 168

aggregateInitializer
	: '[' (element (',' element)*)? ']'
	; // 169

aggregateSource
	: simpleExpression
	; // 170

aggregateType
	: AGGREGATE (':' typeLabel)? OF parameterType
	; // 171

aggregationTypes
	: arrayType
	| bagType
	| listType
	| setType
	; // 172

algorithmHead
	: declaration* constantDecl? localDecl?
	; // 173

aliasStmt
	: ALIAS variableId FOR generalRef qualifier* ';' stmt stmt* END_ALIAS ';'
	; // 174

arrayType
	: ARRAY boundSpec OF OPTIONAL? UNIQUE? instantiableType
	; // 175

assignmentStmt
	: generalRef qualifier* ':=' expression ';'
	; // 176

attributeDecl
	: attributeId
	| redeclaredAttribute
	; // 177

attributeId
	: SimpleId
	; // 178

attributeQualifier
	: '.' attributeRef
	; // 179

bagType
	: BAG boundSpec? OF instantiableType
	; // 180

binaryType
	: BINARY widthSpec?
	; // 181

booleanType
	: BOOLEAN
	; // 182

bound1
	: numericExpression
	; // 183

bound2
	: numericExpression
	; // 184

boundSpec
	: '[' bound1 ':' bound2 ']'
	; // 185

builtInConstant	
	: CONST_E
	| PI
	| SELF
	| '?'
	; // 186

builtInFunction
	: ABS
	| ACOS
	| ASIN
	| ATAN
	| BLENGTH
	| COS
	| EXISTS
	| EXP
	| FORMAT
	| HIBOUND
	| HIINDEX
	| LENGTH
	| LOBOUND
	| LOINDEX
	| LOG
	| LOG2
	| LOG10
	| NVL
	| ODD
	| ROLESOF
	| SIN
	| SIZEOF
	| SQRT
	| TAN
	| TYPEOF
	| USEDIN
	| VALUE_
	| VALUE_IN
	| VALUE_UNIQUE
	; // 187

builtInProcedure
	: INSERT
	| REMOVE
	; // 188

caseAction
	: caseLabel (',' caseLabel)* ':' stmt
	; // 189

caseLabel	
	: expression
	; // 190

caseStmt
	: CASE selector OF caseAction* (OTHERWISE ':' stmt)? END_CASE ';'
	; // 191

compoundStmt
	: BEGIN_ stmt stmt* END_ ';'
	; // 192

concreteTypes
	: aggregationTypes
	| simpleTypes
	| typeRef
	; // 193

constantBody
	: constantId ':' instantiableType ':=' expression ';'
	; // 194

constantDecl
	: CONSTANT constantBody constantBody* END_CONSTANT ';'
	; // 195

constantFactor
	: builtInConstant
	| constantRef
	; // 196

constantId
	: SimpleId
	; // 197

constructedTypes
	: enumerationType
	| selectType
	; // 198

declaration
	: entityDecl
	| functionDecl
	| procedureDecl
	| subtypeConstraintDecl
	| typeDecl
	; // 199

derivedAttr
	: attributeDecl ':' parameterType ':=' expression ';'
	; // 200

deriveClause
	: DERIVE derivedAttr derivedAttr*
	; // 201

domainRule
	: (ruleLabelId ':')? expression
	; // 202

element
	: expression (':' repetition)?
	; // 203

entityBody
	: explicitAttr* deriveClause? inverseClause? uniqueClause? whereClause?
	; // 204

entityConstructor
	: entityRef '(' (expression (',' expression)*)? ')'
	; // 205

entityDecl
	: entityHead entityBody END_ENTITY ';'
	; // 206

entityHead
	: ENTITY entityId subsuper ';'
	; // 207

entityId
	: SimpleId
	; // 208

enumerationExtension
	: BASED_ON typeRef (WITH enumerationItems)?
	; // 209

enumerationId
	: SimpleId
	; // 210

enumerationItems
	: '(' enumerationId (',' enumerationId)* ')'
	; // 211

enumerationReference
	: (typeRef '.')? enumerationRef
	; // 212

enumerationType
	: EXTENSIBLE? ENUMERATION (OF enumerationItems | enumerationExtension)?
	; // 213

escapeStmt
	: ESCAPE ';'
	; // 214

explicitAttr
	: attributeDecl (',' attributeDecl)* ':' OPTIONAL? parameterType ';'
	; // 215

expression
	: simpleExpression (relOpExtended simpleExpression)?
	; // 216

factor
	: simpleFactor ('**' simpleFactor)?
	; // 217

formalParameter
	: parameterId (',' parameterId)* ':' parameterType
	; // 218

functionCall
	: (builtInFunction | functionRef) actualParameterList?
	; // 219

functionDecl
	: functionHead algorithmHead stmt stmt* END_FUNCTION ';'
	; // 220

functionHead
	: FUNCTION functionId ('(' formalParameter (';' formalParameter)* ')')? ':' parameterType ';'
	; // 221

functionId
	: SimpleId
	; // 222

generalizedTypes
	: aggregateType
	| generalAggregationTypes
	| genericEntityType
	| genericType
	; // 223

generalAggregationTypes
	: generalArrayType
	| generalBagType
	| generalListType
	| generalSetType
	; // 224

generalArrayType
	: ARRAY boundSpec? OF OPTIONAL? UNIQUE? parameterType
	; // 225

generalBagType
	: BAG boundSpec? OF parameterType
	; // 226

generalListType
	: LIST boundSpec? OF UNIQUE? parameterType
	; // 227

generalRef
	: parameterRef
	| variableId
	; // 228

generalSetType
	: SET boundSpec? OF parameterType
	; // 229

genericEntityType
	: GENERIC_ENTITY (':' typeLabel)?
	; // 230

genericType
	: GENERIC (':' typeLabel)?
	; // 231

groupQualifier
	: '\\' entityRef
	; // 232

ifStmt
	: IF logicalExpression THEN ifStmtStatements (ELSE ifStmtElseStatements)? END_IF ';'
	; // 233

ifStmtStatements
	: stmt stmt*
	; // custom

ifStmtElseStatements
	: stmt stmt*
	; // custom

increment
	: numericExpression
	; // 234

incrementControl
	: variableId ':=' bound1 TO bound2 (BY increment)?
	; // 235

index
	: numericExpression
	; // 236

index1
	: index
	; // 237

index2
	: index
	; // 238

indexQualifier
	: '[' index1 (':' index2)? ']'
	; // 239

instantiableType
	: concreteTypes
	| entityRef
	; // 240

integerType
	: INTEGER
	; // 241

interfaceSpecification
	: referenceClause
	| useClause
	; // 242

interval
	: '{' intervalLow intervalOp intervalItem intervalOp intervalHigh '}'
	; // 243

intervalHigh
	: simpleExpression
	; // 244

intervalItem
	: simpleExpression
	; // 245

intervalLow
	: simpleExpression
	; // 246

intervalOp
	: '<'
	| '<='
	; // 247

inverseAttr
	: attributeDecl ':' ((SET | BAG) boundSpec? OF)? entityRef FOR (entityRef '.')? attributeRef ';'
	; // 248

inverseClause
	: INVERSE inverseAttr inverseAttr*
	; // 249

listType
	: LIST boundSpec? OF UNIQUE? instantiableType
	; // 250

literal
	: BinaryLiteral
	| IntegerLiteral
	| logicalLiteral
	| RealLiteral
	| stringLiteral
	; // 251

localDecl
	: LOCAL localVariable localVariable* END_LOCAL ';'
	; // 252

localVariable
	: variableId (',' variableId)* ':' parameterType (':=' expression)? ';'
	; // 253

logicalExpression
	: expression
	; // 254

logicalLiteral
	: FALSE
	| TRUE
	| UNKNOWN
	; // 255

logicalType
	: LOGICAL
	; // 256

multiplicationLikeOp
	: '*'
	| '/'
	| DIV
	| MOD
	| AND
	| '||'
	; // 257

namedTypes
	: entityRef
	| typeRef
	; // 258

namedTypeOrRename
	: namedTypes (AS (entityId | typeId))?
	; // 259

nullStmt
	: ';'
	; // 260

numberType
	: NUMBER
	; // 261

numericExpression
	: simpleExpression
	; // 262

oneOf
	: ONEOF '(' supertypeExpression (',' supertypeExpression)* ')'
	; // 263

parameter
	: expression
	; // 264

parameterId
	: SimpleId
	; // 265

parameterType
	: generalizedTypes
	| namedTypes
	| simpleTypes
	; // 266

population
	: entityRef
	; // 267

precisionSpec
	: numericExpression
	; // 268

primary
	: literal
	| qualifiableFactor qualifier*
	; // 269

procedureCallStmt
	: (builtInProcedure | procedureRef) actualParameterList? ';'
	; // 270

procedureDecl
	: procedureHead algorithmHead stmt* END_PROCEDURE ';'
	; // 271

procedureHead
	: PROCEDURE procedureId ('(' procedureHeadParameter (';' procedureHeadParameter)* ')')? ';'
	; // 272

procedureHeadParameter
	: VAR? formalParameter
	; // custom

procedureId
	: SimpleId
	; // 273

qualifiableFactor
	: attributeRef
	| constantFactor
	| functionCall
	| generalRef
	| population
	; // 274

qualifiedAttribute
	: SELF groupQualifier attributeQualifier
	; // 275

qualifier
	: attributeQualifier
	| groupQualifier
	| indexQualifier
	; // 276

queryExpression
	: QUERY '(' variableId '<*' aggregateSource '|' logicalExpression ')'
	; // 277

realType
	: REAL ('(' precisionSpec ')')?
	; // 278

redeclaredAttribute
	: qualifiedAttribute (RENAMED attributeId)?
	; // 279

referencedAttribute
	: attributeRef
	| qualifiedAttribute
	; // 280

referenceClause
	: REFERENCE FROM schemaRef ('(' resourceOrRename (',' resourceOrRename)* ')')? ';'
	; // 281

relOp
	: '<' | '>' | '<=' | '>=' | '<>' | '=' | ':<>:' | ':=:'
	; // 282

relOpExtended
	: relOp | IN | LIKE
	; // 283

renameId
	: constantId
	| entityId
	| functionId
	| procedureId
	| typeId
	; // 284

repeatControl
	: incrementControl? whileControl? untilControl?
	; // 285

repeatStmt
	: REPEAT repeatControl ';' stmt stmt* END_REPEAT ';'
	; // 286

repetition
	: numericExpression
	; // 287

resourceOrRename
	: resourceRef (AS renameId)?
	; // 288

resourceRef
	: constantRef
	| entityRef
	| functionRef
	| procedureRef
	| typeRef
	; // 289

returnStmt
	: RETURN ('(' expression ')')? ';'
	; // 290

ruleDecl
	: ruleHead algorithmHead stmt* whereClause END_RULE ';'
	; // 291

ruleHead
	: RULE ruleId FOR '(' entityRef (',' entityRef)* ')' ';'
	; // 292

ruleId
	: SimpleId
	; // 293

ruleLabelId
	: SimpleId
	; // 294

schemaBody
	: interfaceSpecification* constantDecl? schemaBodyDeclaration*
	; // 295

schemaBodyDeclaration
  : declaration | ruleDecl
	; // custom

schemaDecl
	: SCHEMA schemaId schemaVersionId? ';' schemaBody END_SCHEMA ';'
	; // 296

schemaId
	: SimpleId
	; // 297

schemaVersionId
	: stringLiteral
	; // 298

selector
	: expression
	; // 299

selectExtension
	: BASED_ON typeRef (WITH selectList)?
	; // 300

selectList
	:  '(' namedTypes (',' namedTypes)* ')'
	; // 301

selectType
	: (EXTENSIBLE GENERIC_ENTITY?)? SELECT (selectList | selectExtension)?
	; // 302

setType
	: SET boundSpec? OF instantiableType
	; // 303

simpleExpression
	: term (addLikeOp term)*
	; // 305

simpleFactor
	: aggregateInitializer
	| entityConstructor
	| enumerationReference
	| interval
	| queryExpression
	| (unaryOp? ('(' expression ')' | primary))
	; // 306

simpleTypes
	: binaryType
	| booleanType
	| integerType
	| logicalType
	| numberType
	| realType
	| stringType
	; // 307

skipStmt
	: SKIP_ ';'
	; // 308

stmt
	: aliasStmt
	| assignmentStmt
	| caseStmt
	| compoundStmt
	| escapeStmt
	| ifStmt
	| nullStmt
	| procedureCallStmt
	| repeatStmt
	| returnStmt
	| skipStmt
	; // 309

stringLiteral
	: SimpleStringLiteral
	| EncodedStringLiteral
	; // 310

stringType
	: STRING widthSpec?
	; // 311

subsuper
	: supertypeConstraint? subtypeDeclaration?
	; // 312

subtypeConstraint
	: OF '(' supertypeExpression ')'
	; // 313

subtypeConstraintBody
	: abstractSupertype? totalOver? (supertypeExpression ';')?
	; // 314

subtypeConstraintDecl
	: subtypeConstraintHead subtypeConstraintBody END_SUBTYPE_CONSTRAINT ';'
	; // 315

subtypeConstraintHead
	: SUBTYPE_CONSTRAINT subtypeConstraintId FOR entityRef ';'
	; // 316

subtypeConstraintId
	: SimpleId
	; // 317

subtypeDeclaration
	: SUBTYPE OF '(' entityRef (',' entityRef)* ')'
	; // 318

supertypeConstraint
	: abstractEntityDeclaration
	| abstractSupertypeDeclaration
	| supertypeRule
	; // 319

supertypeExpression
	: supertypeFactor (ANDOR supertypeFactor)*
	; // 320

supertypeFactor
	: supertypeTerm (AND supertypeTerm)*
	; // 321

supertypeRule
	: SUPERTYPE subtypeConstraint
	; // 322

supertypeTerm
	: entityRef
	| oneOf
	| '(' supertypeExpression ')'
	; // 323

syntax
	: schemaDecl+ EOF
	; // 324

term
	: factor (multiplicationLikeOp factor)*
	; // 325

totalOver
	: TOTAL_OVER '(' entityRef (',' entityRef)* ')' ';'
	; // 326

typeDecl
	: TYPE typeId '=' underlyingType ';' whereClause? END_TYPE ';'
	; // 327

typeId
	: SimpleId
	; // 328

typeLabel
	: typeLabelId
	| typeLabelRef
	; // 329

typeLabelId
	: SimpleId
	; // 330

unaryOp
	: '+'
	| '-'
	| NOT
	; // 331

underlyingType
	: concreteTypes
	| constructedTypes
	; // 332

uniqueClause
	: UNIQUE uniqueRule ';' (uniqueRule ';')*
	; // 333

uniqueRule
	: (ruleLabelId ':')? referencedAttribute (',' referencedAttribute)*
	; // 334

untilControl
	: UNTIL logicalExpression
	; // 335

useClause
	: USE FROM schemaRef ('(' namedTypeOrRename (',' namedTypeOrRename)* ')')? ';'
	; // 336

variableId
	: SimpleId
	; // 337

whereClause
	: WHERE domainRule ';' (domainRule ';')*
	; // 338

whileControl
	: WHILE logicalExpression
	; // 339

width
	: numericExpression
	; // 340

widthSpec
	: '(' width ')' FIXED?
	; // 341

// Lexer

// A.1.1 Keywords

fragment A : [Aa] ;
fragment B : [Bb] ;
fragment C : [Cc] ;
fragment D : [Dd] ;
fragment E : [Ee] ;
fragment F : [Ff] ;
fragment G : [Gg] ;
fragment H : [Hh] ;
fragment I : [Ii] ;
fragment J : [Jj] ;
fragment K : [Kk] ;
fragment L : [Ll] ;
fragment M : [Mm] ;
fragment N : [Nn] ;
fragment O : [Oo] ;
fragment P : [Pp] ;
fragment Q : [Qq] ;
fragment R : [Rr] ;
fragment S : [Ss] ;
fragment T : [Tt] ;
fragment U : [Uu] ;
fragment V : [Vv] ;
fragment W : [Ww] ;
fragment X : [Xx] ;
fragment Y : [Yy] ;
fragment Z : [Zz] ;

ABS : A B S ;
ABSTRACT : A B S T R A C T ;
ACOS : A C O S ;
AGGREGATE : A G G R E G A T E ;
ALIAS : A L I A S ;
AND : A N D ;
ANDOR : A N D O R ;
ARRAY : A R R A Y ;
AS : A S ;
ASIN : A S I N ;
ATAN : A T A N ;
BAG : B A G ;
BASED_ON : B A S E D '_' O N ;
BEGIN_ : B E G I N ;
BINARY : B I N A R Y ;
BLENGTH : B L E N G T H ;
BOOLEAN : B O O L E A N ;
BY : B Y ;
CASE : C A S E ;
CONSTANT : C O N S T A N T ;
CONST_E : C O N S T '_' E ;
COS : C O S ;
DERIVE : D E R I V E ;
DIV : D I V ;
ELSE : E L S E ;
END_ : E N D ;
END_ALIAS : E N D '_' A L I A S ;
END_CASE : E N D '_' C A S E ;
END_CONSTANT : E N D '_' C O N S T A N T ;
END_ENTITY : E N D '_' E N T I T Y ;
END_FUNCTION : E N D '_' F U N C T I O N ;
END_IF : E N D '_' I F ;
END_LOCAL : E N D '_' L O C A L ;
END_PROCEDURE : E N D '_' P R O C E D U R E ;
END_REPEAT : E N D '_' R E P E A T ;
END_RULE : E N D '_' R U L E ;
END_SCHEMA : E N D '_' S C H E M A ;
END_SUBTYPE_CONSTRAINT : E N D '_' S U B T Y P E '_' C O N S T R A I N T ;
END_TYPE : E N D '_' T Y P E ;
ENTITY : E N T I T Y ;
ENUMERATION : E N U M E R A T I O N ;
ESCAPE : E S C A P E ;
EXISTS : E X I S T S ;
EXP : E X P ;
EXTENSIBLE : E X T E N S I B L E ;
FALSE : F A L S E ;
FIXED : F I X E D ;
FOR : F O R ;
FORMAT : F O R M A T ;
FROM : F R O M ;
FUNCTION : F U N C T I O N ;
GENERIC : G E N E R I C ;
GENERIC_ENTITY : G E N E R I C '_' E N T I T Y ;
HIBOUND : H I B O U N D ;
HIINDEX : H I I N D E X ;
IF : I F ;
IN : I N ;
INSERT : I N S E R T ;
INTEGER : I N T E G E R ;
INVERSE : I N V E R S E ;
LENGTH : L E N G T H ;
LIKE : L I K E ;
LIST : L I S T ;
LOBOUND : L O B O U N D ;
LOCAL : L O C A L ;
LOG : L O G ;
LOG10 : L O G '10' ;
LOG2 : L O G '2' ;
LOGICAL : L O G I C A L ;
LOINDEX : L O I N D E X ;
MOD : M O D ;
NOT : N O T ;
NUMBER : N U M B E R ;
NVL : N V L ;
ODD : O D D ;
OF : O F ;
ONEOF : O N E O F ;
OPTIONAL : O P T I O N A L ;
OR : O R ;
OTHERWISE : O T H E R W I S E ;
PI : P I ;
PROCEDURE : P R O C E D U R E ;
QUERY : Q U E R Y ;
REAL : R E A L ;
REFERENCE : R E F E R E N C E ;
REMOVE : R E M O V E ;
RENAMED : R E N A M E D ;
REPEAT : R E P E A T ;
RETURN : R E T U R N ;
ROLESOF : R O L E S O F ;
RULE : R U L E ;
SCHEMA : S C H E M A ;
SELECT : S E L E C T ;
SELF : S E L F ;
SET : S E T ;
SIN : S I N ;
SIZEOF : S I Z E O F ;
SKIP_ : S K I P ;
SQRT : S Q R T ;
STRING : S T R I N G ;
SUBTYPE : S U B T Y P E ;
SUBTYPE_CONSTRAINT : S U B T Y P E '_' C O N S T R A I N T ;
SUPERTYPE : S U P E R T Y P E ;
TAN : T A N ;
THEN : T H E N ;
TO : T O ;
TRUE : T R U E ;
TYPE : T Y P E ;
TYPEOF : T Y P E O F ;
TOTAL_OVER : T O T A L '_' O V E R ;
UNIQUE : U N I Q U E ;
UNKNOWN : U N K N O W N ;
UNTIL : U N T I L ;
USE : U S E ;
USEDIN : U S E D I N ;
VALUE_ : V A L U E ;
VALUE_IN : V A L U E '_' I N ;
VALUE_UNIQUE : V A L U E '_' U N I Q U E ;
VAR : V A R ;
WITH : W I T H ;
WHERE : W H E R E ;
WHILE : W H I L E ;
XOR : X O R ;

// A.1.2 Character classes

fragment
Bit
	: [0-1]
	; // 123

fragment
Digit
	: [0-9]
	; // 124

fragment
Digits
	: Digit Digit*
	; // 125

fragment
EncodedCharacter
	: Octet Octet Octet Octet
	; // 126

fragment
HexDigit
	: Digit | [a-fA-F]
	; // 127

fragment
Letter
	: [a-zA-Z]
	; // 128

fragment
Octet
	: HexDigit HexDigit
	; // 136

fragment
Sign
	: '+' | '-'
	; // 304

// A.1.3 Lexical elements

BinaryLiteral
	: '%' Bit Bit*
	; // 139

EncodedStringLiteral
	: '"' EncodedCharacter EncodedCharacter* '"'
	; // 140

IntegerLiteral
	: Digits
	; // 141

RealLiteral
	: Digits '.' Digits? (E Sign? Digits)?
	; // 142

SimpleId
	: Letter (Letter | Digit | '_')*
	; // 143

SimpleStringLiteral
	: '\'' .*? '\''
	; // 144

// A.1.4 Remarks

EmbeddedRemark
	: '(*' (EmbeddedRemark | .)*? '*)'
	-> channel(2)
	; // 145

TailRemark
	: '--' ~[\n]*
	-> channel(2)
	; // 149

// Whitespace

Whitespace
	: [ \t\r\n\u000c]+
	-> channel(1)
	;
