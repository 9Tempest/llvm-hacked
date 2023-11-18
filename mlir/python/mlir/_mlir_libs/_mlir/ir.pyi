# Originally imported via:
#   stubgen {...} -m mlir._mlir_libs._mlir.ir
# Local modifications:
#   * Rewrite references to 'mlir.ir.' to local types
#   * Add __all__ with the following incantation:
#       egrep '^class ' ir.pyi | awk -F ' |:|\\(' '{print "    \"" $2 "\","}'
#   * Local edits to signatures and types that MyPy did not auto detect (or
#     detected incorrectly).

from typing import (
    Any, Callable, ClassVar, Dict, List, Optional, Sequence, Tuple,
    Type as _Type, TypeVar
)

from typing import overload

__all__ = [
    "AffineAddExpr",
    "AffineBinaryExpr",
    "AffineCeilDivExpr",
    "AffineConstantExpr",
    "AffineDimExpr",
    "AffineExpr",
    "AffineExprList",
    "AffineFloorDivExpr",
    "AffineMap",
    "AffineMapAttr",
    "AffineModExpr",
    "AffineMulExpr",
    "AffineSymbolExpr",
    "ArrayAttr",
    "ArrayAttributeIterator",
    "Attribute",
    "BF16Type",
    "Block",
    "BlockArgument",
    "BlockArgumentList",
    "BlockIterator",
    "BlockList",
    "BoolAttr",
    "ComplexType",
    "Context",
    "DenseElementsAttr",
    "DenseFPElementsAttr",
    "DenseIntElementsAttr",
    "DenseResourceElementsAttr",
    "Dialect",
    "DialectDescriptor",
    "Dialects",
    "Diagnostic",
    "DiagnosticHandler",
    "DiagnosticInfo",
    "DiagnosticSeverity",
    "DictAttr",
    "Float8E4M3FNType",
    "Float8E5M2Type",
    "Float8E4M3FNUZType",
    "Float8E4M3B11FNUZType",
    "Float8E5M2FNUZType",
    "F16Type",
    "FloatTF32Type",
    "F32Type",
    "F64Type",
    "FlatSymbolRefAttr",
    "FloatAttr",
    "FunctionType",
    "IndexType",
    "InferShapedTypeOpInterface",
    "InferTypeOpInterface",
    "InsertionPoint",
    "IntegerAttr",
    "IntegerSet",
    "IntegerSetConstraint",
    "IntegerSetConstraintList",
    "IntegerType",
    "Location",
    "MemRefType",
    "Module",
    "MLIRError",
    "NamedAttribute",
    "NoneType",
    "OpaqueType",
    "OpAttributeMap",
    "OpOperandList",
    "OpResult",
    "OpResultList",
    "OpView",
    "Operation",
    "OperationIterator",
    "OperationList",
    "RankedTensorType",
    "Region",
    "RegionIterator",
    "RegionSequence",
    "ShapedType",
    "ShapedTypeComponents",
    "StringAttr",
    "SymbolTable",
    "TupleType",
    "Type",
    "TypeAttr",
    "UnitAttr",
    "UnrankedMemRefType",
    "UnrankedTensorType",
    "Value",
    "VectorType",
    "_GlobalDebug",
    "_OperationBase",
]

# Base classes: declared first to simplify declarations below.
class _OperationBase:
    def detach_from_parent(self) -> OpView: ...
    def get_asm(self, binary: bool = False, large_elements_limit: Optional[int] = None, enable_debug_info: bool = False, pretty_debug_info: bool = False, print_generic_op_form: bool = False, use_local_scope: bool = False, assume_verified: bool = False) -> object: ...
    def move_after(self, other: _OperationBase) -> None: ...
    def move_before(self, other: _OperationBase) -> None: ...
    def print(self, file: Optional[Any] = None, binary: bool = False, large_elements_limit: Optional[int] = None, enable_debug_info: bool = False, pretty_debug_info: bool = False, print_generic_op_form: bool = False, use_local_scope: bool = False, assume_verified: bool = False) -> None: ...
    def verify(self) -> bool: ...
    @overload
    def __eq__(self, arg0: _OperationBase) -> bool: ...
    @overload
    def __eq__(self, arg0: object) -> bool: ...
    def __hash__(self) -> int: ...
    @property
    def _CAPIPtr(self) -> object: ...
    @property
    def attributes(self) -> OpAttributeMap: ...
    @property
    def context(self) -> Context: ...
    @property
    def location(self) -> Location: ...
    @property
    def name(self) -> str: ...
    @property
    def operands(self) -> OpOperandList: ...
    @property
    @property
    def parent(self) -> Optional[_OperationBase]: ...
    def regions(self) -> RegionSequence: ...
    @property
    def result(self) -> OpResult: ...
    @property
    def results(self) -> OpResultList: ...

_TOperation = TypeVar("_TOperation", bound=_OperationBase)

# TODO: Auto-generated. Audit and fix.
class AffineExpr:
    def __init__(self, *args, **kwargs) -> None: ...
    def _CAPICreate(self) -> AffineExpr: ...
    def compose(self, arg0) -> AffineExpr: ...
    def dump(self) -> None: ...
    def get_add(self, *args, **kwargs) -> Any: ...
    def get_ceil_div(self, *args, **kwargs) -> Any: ...
    def get_constant(self, *args, **kwargs) -> Any: ...
    def get_dim(self, *args, **kwargs) -> Any: ...
    def get_floor_div(self, *args, **kwargs) -> Any: ...
    def get_mod(self, *args, **kwargs) -> Any: ...
    def get_mul(self, *args, **kwargs) -> Any: ...
    def get_symbol(self, *args, **kwargs) -> Any: ...
    def __add__(self, other) -> Any: ...
    @overload
    def __eq__(self, arg0: AffineExpr) -> bool: ...
    @overload
    def __eq__(self, arg0: object) -> bool: ...
    def __hash__(self) -> int: ...
    def __mod__(self, other) -> Any: ...
    def __mul__(self, other) -> Any: ...
    def __radd__(self, other) -> Any: ...
    def __rmod__(self, other) -> Any: ...
    def __rmul__(self, other) -> Any: ...
    def __rsub__(self, other) -> Any: ...
    def __sub__(self, other) -> Any: ...
    @property
    def _CAPIPtr(self) -> object: ...
    @property
    def context(self) -> Context: ...

class Attribute:
    def __init__(self, cast_from_type: Attribute) -> None: ...
    def _CAPICreate(self) -> Attribute: ...
    def dump(self) -> None: ...
    def get_named(self, *args, **kwargs) -> Any: ...
    @staticmethod
    def parse(asm: str, context: Optional[Context] = None) -> Any: ...
    @overload
    def __eq__(self, arg0: Attribute) -> bool: ...
    @overload
    def __eq__(self, arg0: object) -> bool: ...
    def __hash__(self) -> int: ...
    @property
    def _CAPIPtr(self) -> object: ...
    @property
    def context(self) -> Context: ...
    @property
    def type(self) -> Type: ...

class Type:
    def __init__(self, cast_from_type: Type) -> None: ...
    def _CAPICreate(self) -> Type: ...
    def dump(self) -> None: ...
    @staticmethod
    def parse(asm: str, context: Optional[Context] = None) -> Type: ...
    @overload
    def __eq__(self, arg0: Type) -> bool: ...
    @overload
    def __eq__(self, arg0: object) -> bool: ...
    def __hash__(self) -> int: ...
    @property
    def _CAPIPtr(self) -> object: ...
    @property
    def context(self) -> Context: ...

class Value:
    def _CAPICreate(self) -> Value: ...
    def dump(self) -> None: ...
    @overload
    def __eq__(self, arg0: Value) -> bool: ...
    @overload
    def __eq__(self, arg0: object) -> bool: ...
    def __hash__(self) -> int: ...
    @property
    def _CAPIPtr(self) -> object: ...
    @property
    def context(self) -> Context: ...
    @property
    def owner(self) -> _OperationBase: ...
    @property
    def type(self) -> Type: ...


# Classes with no particular order sensitivity in alpha order.
# TODO: Auto-generated. Audit and fix.
class AffineAddExpr(AffineBinaryExpr):
    def __init__(self, expr: AffineExpr) -> None: ...
    @staticmethod
    def get(*args, **kwargs) -> AffineAddExpr: ...
    @staticmethod
    def isinstance(arg: Any) -> bool: ...

# TODO: Auto-generated. Audit and fix.
class AffineBinaryExpr(AffineExpr):
    def __init__(self, expr: AffineExpr) -> None: ...
    @staticmethod
    def isinstance(arg: Any) -> bool: ...
    @property
    def lhs(self) -> AffineExpr: ...
    @property
    def rhs(self) -> AffineExpr: ...

# TODO: Auto-generated. Audit and fix.
class AffineCeilDivExpr(AffineBinaryExpr):
    def __init__(self, expr: AffineExpr) -> None: ...
    @staticmethod
    def get(*args, **kwargs) -> AffineCeilDivExpr: ...
    @staticmethod
    def isinstance(arg: Any) -> bool: ...

# TODO: Auto-generated. Audit and fix.
class AffineConstantExpr(AffineExpr):
    def __init__(self, expr: AffineExpr) -> None: ...
    @staticmethod
    def get(*args, **kwargs) -> AffineConstantExpr: ...
    @staticmethod
    def isinstance(arg: Any) -> bool: ...
    @property
    def value(self) -> int: ...

# TODO: Auto-generated. Audit and fix.
class AffineDimExpr(AffineExpr):
    def __init__(self, expr: AffineExpr) -> None: ...
    @staticmethod
    def get(*args, **kwargs) -> AffineDimExpr: ...
    @staticmethod
    def isinstance(arg: Any) -> bool: ...
    @property
    def position(self) -> int: ...

# TODO: Auto-generated. Audit and fix.
class AffineExprList:
    def __init__(self, *args, **kwargs) -> None: ...
    def __add__(self, arg0: AffineExprList) -> List[AffineExpr]: ...
    @overload
    def __getitem__(self, arg0: int) -> AffineExpr: ...
    @overload
    def __getitem__(self, arg0: slice) -> AffineExprList: ...
    def __len__(self) -> int: ...

# TODO: Auto-generated. Audit and fix.
class AffineFloorDivExpr(AffineBinaryExpr):
    def __init__(self, expr: AffineExpr) -> None: ...
    def get(*args, **kwargs) -> AffineFloorDivExpr: ...
    @staticmethod
    def isinstance(arg: Any) -> bool: ...

# TODO: Auto-generated. Audit and fix.
class AffineMap:
    def __init__(self, *args, **kwargs) -> None: ...
    def _CAPICreate(self) -> AffineMap: ...
    @staticmethod
    def compress_unused_symbols(*args, **kwargs) -> Any: ...
    def dump(self) -> None: ...
    @staticmethod
    def get(*args, **kwargs) -> AffineMap: ...
    @staticmethod
    def get_constant(*args, **kwargs) -> AffineMap: ...
    @staticmethod
    def get_empty(*args, **kwargs) -> AffineMap: ...
    @staticmethod
    def get_identity(*args, **kwargs) -> AffineMap: ...
    @staticmethod
    def get_minor_identity(*args, **kwargs) -> AffineMap: ...
    def get_minor_submap(self, n_results: int) -> AffineMap: ...
    def get_major_submap(self, n_results: int) -> AffineMap: ...
    def get_permutation(self, *args, **kwargs) -> Any: ...
    def get_submap(self, result_positions: List[int]) -> AffineMap: ...
    def replace(self, expr: AffineExpr, replacement: AffineExpr, n_result_dims: int, n_result_syms: int) -> AffineMap: ...
    @overload
    def __eq__(self, arg0: AffineMap) -> bool: ...
    @overload
    def __eq__(self, arg0: object) -> bool: ...
    def __hash__(self) -> int: ...
    @property
    def _CAPIPtr(self) -> object: ...
    @property
    def context(self) -> Context: ...
    @property
    def is_permutation(self) -> bool: ...
    @property
    def is_projected_permutation(self) -> bool: ...
    @property
    def n_dims(self) -> int: ...
    @property
    def n_inputs(self) -> int: ...
    @property
    def n_symbols(self) -> int: ...
    @property
    def results(self) -> Any: ...

# TODO: Auto-generated. Audit and fix.
class AffineMapAttr(Attribute):
    def __init__(self, cast_from_attr: Attribute) -> None: ...
    @staticmethod
    def get(*args, **kwargs) -> AffineMapAttr: ...
    @staticmethod
    def isinstance(arg: Any) -> bool: ...
    @property
    def type(self) -> Type: ...

# TODO: Auto-generated. Audit and fix.
class AffineModExpr(AffineBinaryExpr):
    def __init__(self, expr: AffineExpr) -> None: ...
    @staticmethod
    def get(*args, **kwargs) -> AffineModExpr: ...
    @staticmethod
    def isinstance(arg: Any) -> bool: ...

# TODO: Auto-generated. Audit and fix.
class AffineMulExpr(AffineBinaryExpr):
    def __init__(self, expr: AffineExpr) -> None: ...
    @staticmethod
    def get(*args, **kwargs) -> AffineMulExpr: ...
    @staticmethod
    def isinstance(arg: Any) -> bool: ...

# TODO: Auto-generated. Audit and fix.
class AffineSymbolExpr(AffineExpr):
    def __init__(self, expr: AffineExpr) -> None: ...
    @staticmethod
    def get(*args, **kwargs) -> AffineSymbolExpr: ...
    @staticmethod
    def isinstance(arg: Any) -> bool: ...
    @property
    def position(self) -> int: ...

# TODO: Auto-generated. Audit and fix.
class ArrayAttr(Attribute):
    def __init__(self, cast_from_attr: Attribute) -> None: ...
    @staticmethod
    def get(*args, **kwargs) -> ArrayAttr: ...
    @staticmethod
    def isinstance(arg: Any) -> bool: ...
    def __add__(self, arg0: list) -> ArrayAttr: ...
    def __getitem__(self, arg0: int) -> Attribute: ...
    def __iter__(self) -> Any: ...
    def __len__(self) -> int: ...
    @property
    def type(self) -> Type: ...

# TODO: Auto-generated. Audit and fix.
class ArrayAttributeIterator:
    def __init__(self, *args, **kwargs) -> None: ...
    def __iter__(self) -> ArrayAttributeIterator: ...
    def __next__(self) -> Attribute: ...

# TODO: Auto-generated. Audit and fix.
class BF16Type(Type):
    def __init__(self, cast_from_type: Type) -> None: ...
    @staticmethod
    def get(*args, **kwargs) -> BF16Type: ...
    @staticmethod
    def isinstance(arg: Any) -> bool: ...

class Block:
    __hash__: ClassVar[None] = ...  # type: ignore
    def append(self, operation: _OperationBase) -> None: ...
    def create_after(self, *args: Type) -> Block: ...
    @staticmethod
    def create_at_start(parent: Region, arg_types: List[Type]) -> Block: ...
    def create_before(self, *args: Type) -> Block: ...
    @overload
    def __eq__(self, arg0: Block) -> bool: ...
    @overload
    def __eq__(self, arg0: object) -> bool: ...
    def __iter__(self) -> Any: ...
    @property
    def arguments(self) -> BlockArgumentList: ...
    @property
    def operations(self) -> OperationList: ...
    @property
    def owner(self) -> OpView: ...
    @property
    def region(self) -> Region: ...

class BlockArgument(Value):
    @staticmethod
    def isinstance(arg: Any) -> bool: ...
    def set_type(self, type: Type) -> None: ...
    @property
    def arg_number(self) -> int: ...
    @property
    def owner(self) -> Block: ...  # type: ignore[override]

class BlockArgumentList:
    def __add__(self, arg0: BlockArgumentList) -> List[BlockArgument]: ...
    @overload
    def __getitem__(self, arg0: int) -> BlockArgument: ...
    @overload
    def __getitem__(self, arg0: slice) -> BlockArgumentList: ...
    def __len__(self) -> int: ...
    @property
    def types(self) -> List[Type]: ...

class BlockIterator:
    def __init__(self, *args, **kwargs) -> None: ...
    def __iter__(self) -> BlockIterator: ...
    def __next__(self) -> Block: ...

class BlockList:
    def append(self, *args) -> Block: ...
    def __getitem__(self, arg0: int) -> Block: ...
    def __iter__(self) -> BlockIterator: ...
    def __len__(self) -> int: ...

# TODO: Auto-generated. Audit and fix.
class BoolAttr(Attribute):
    def __init__(self, cast_from_attr: Attribute) -> None: ...
    @staticmethod
    def get(*args, **kwargs) -> BoolAttr: ...
    @staticmethod
    def isinstance(arg: Any) -> bool: ...
    @property
    def type(self) -> Type: ...
    @property
    def value(self) -> bool: ...

# TODO: Auto-generated. Audit and fix.
class ComplexType(Type):
    def __init__(self, cast_from_type: Type) -> None: ...
    @staticmethod
    def get(*args, **kwargs) -> ComplexType: ...
    @staticmethod
    def isinstance(arg: Any) -> bool: ...
    @property
    def element_type(self) -> Type: ...

class Context:
    current: ClassVar[Context] = ...  # read-only
    allow_unregistered_dialects: bool
    def __init__(self) -> None: ...
    def _CAPICreate(self) -> object: ...
    def _get_context_again(self) -> Context: ...
    @staticmethod
    def _get_live_count() -> int: ...
    def _get_live_module_count(self) -> int: ...
    def _get_live_operation_count(self) -> int: ...
    def attach_diagnostic_handler(self, callback: Callable[[Diagnostic], bool]) -> DiagnosticHandler: ...
    def enable_multithreading(self, enable: bool) -> None: ...
    def get_dialect_descriptor(self, dialect_name: str) -> DialectDescriptor: ...
    def is_registered_operation(self, operation_name: str) -> bool: ...
    def __enter__(self) -> Context: ...
    def __exit__(self, arg0: object, arg1: object, arg2: object) -> None: ...
    @property
    def _CAPIPtr(self) -> object: ...
    @property
    def d(self) -> Dialects: ...
    @property
    def dialects(self) -> Dialects: ...
    def append_dialect_registry(self, registry: "DialectRegistry") -> None: ...
    def load_all_available_dialects(self) -> None: ...

class DialectRegistry:
    def __init__(self) -> None: ...

# TODO: Auto-generated. Audit and fix.
class DenseElementsAttr(Attribute):
    def __init__(self, cast_from_attr: Attribute) -> None: ...
    @staticmethod
    def get(*args, **kwargs) -> DenseElementsAttr: ...
    @staticmethod
    def get_splat(*args, **kwargs) -> Any: ...
    @staticmethod
    def isinstance(arg: Any) -> bool: ...
    def __len__(self) -> int: ...
    @property
    def is_splat(self) -> bool: ...
    @property
    def type(self) -> Type: ...

# TODO: Auto-generated. Audit and fix.
class DenseFPElementsAttr(DenseElementsAttr):
    def __init__(self, cast_from_attr: Attribute) -> None: ...
    @staticmethod
    def get(*args, **kwargs) -> DenseFPElementsAttr: ...
    @staticmethod
    def isinstance(arg: Any) -> bool: ...
    def __getitem__(self, arg0: int) -> float: ...
    @property
    def type(self) -> Type: ...

# TODO: Auto-generated. Audit and fix.
class DenseIntElementsAttr(DenseElementsAttr):
    def __init__(self, cast_from_attr: Attribute) -> None: ...
    @staticmethod
    def get(*args, **kwargs) -> DenseIntElementsAttr: ...
    @staticmethod
    def isinstance(arg: Any) -> bool: ...
    def __getitem__(self, arg0: int) -> int: ...
    @property
    def type(self) -> Type: ...

class DenseResourceElementsAttr(Attribute):
    @staticmethod
    def get_from_buffer(array: Any, name: str, type: Type, alignment: Optional[int] = None, is_mutable: bool = False, context: Optional[Context] = None) -> None: ...

class Dialect:
    def __init__(self, descriptor: DialectDescriptor) -> None: ...
    @property
    def descriptor(self) -> DialectDescriptor: ...

class DialectDescriptor:
    @property
    def namespace(self) -> str: ...

class Dialects:
    def __init__(self, *args, **kwargs) -> None: ...
    def __getattr__(self, arg0: str) -> Dialect: ...
    def __getitem__(self, arg0: str) -> Dialect: ...

class Diagnostic:
    @property
    def severity(self) -> DiagnosticSeverity: ...
    @property
    def location(self) -> Location: ...
    @property
    def message(self) -> str: ...
    @property
    def notes(self) -> Tuple[Diagnostic]: ...

class DiagnosticHandler:
    def detach(self) -> None: ...
    @property
    def attached(self) -> bool: ...
    @property
    def had_error(self) -> bool: ...
    def __enter__(self) -> DiagnosticHandler: ...
    def __exit__(self, arg0: object, arg1: object, arg2: object) -> None: ...

class DiagnosticInfo:
    def __init__(self, diag: Diagnostic) -> None: ...
    @property
    def severity(self) -> "DiagnosticSeverity": ...
    @property
    def location(self) -> "Location": ...
    @property
    def message(self) -> str: ...
    @property
    def notes(self) -> Sequence["DiagnosticInfo"]: ...

class DiagnosticSeverity:
    ERROR: DiagnosticSeverity
    WARNING: DiagnosticSeverity
    NOTE: DiagnosticSeverity
    REMARK: DiagnosticSeverity

# TODO: Auto-generated. Audit and fix.
class DictAttr(Attribute):
    def __init__(self, cast_from_attr: Attribute) -> None: ...
    @staticmethod
    def get(*args, **kwargs) -> DictAttr: ...
    @staticmethod
    def isinstance(arg: Any) -> bool: ...
    def __contains__(self, arg0: str) -> bool: ...
    @overload
    def __getitem__(self, arg0: str) -> Attribute: ...
    @overload
    def __getitem__(self, arg0: int) -> NamedAttribute: ...
    def __len__(self) -> int: ...
    @property
    def type(self) -> Type: ...

class Float8E4M3FNType(Type):
    def __init__(self, cast_from_type: Type) -> None: ...
    @staticmethod
    def get(*args, **kwargs) -> Float8E4M3FNType: ...
    @staticmethod
    def isinstance(arg: Any) -> bool: ...

class Float8E5M2Type(Type):
    def __init__(self, cast_from_type: Type) -> None: ...
    @staticmethod
    def get(*args, **kwargs) -> Float8E5M2Type: ...
    @staticmethod
    def isinstance(arg: Any) -> bool: ...

class Float8E4M3FNUZType(Type):
    def __init__(self, cast_from_type: Type) -> None: ...
    @staticmethod
    def get(*args, **kwargs) -> Float8E4M3FNUZType: ...
    @staticmethod
    def isinstance(arg: Any) -> bool: ...

class Float8E4M3B11FNUZType(Type):
    def __init__(self, cast_from_type: Type) -> None: ...
    @staticmethod
    def get(*args, **kwargs) -> Float8E4M3B11FNUZType: ...
    @staticmethod
    def isinstance(arg: Any) -> bool: ...

class Float8E5M2FNUZType(Type):
    def __init__(self, cast_from_type: Type) -> None: ...
    @staticmethod
    def get(*args, **kwargs) -> Float8E5M2FNUZType: ...
    @staticmethod
    def isinstance(arg: Any) -> bool: ...

# TODO: Auto-generated. Audit and fix.
class F16Type(Type):
    def __init__(self, cast_from_type: Type) -> None: ...
    @staticmethod
    def get(*args, **kwargs) -> F16Type: ...
    @staticmethod
    def isinstance(arg: Any) -> bool: ...

# TODO: Auto-generated. Audit and fix.
class FloatTF32Type(Type):
    def __init__(self, cast_from_type: Type) -> None: ...
    @staticmethod
    def get(*args, **kwargs) -> FloatTF32Type: ...
    @staticmethod
    def isinstance(arg: Any) -> bool: ...

# TODO: Auto-generated. Audit and fix.
class F32Type(Type):
    def __init__(self, cast_from_type: Type) -> None: ...
    @staticmethod
    def get(*args, **kwargs) -> F32Type: ...
    @staticmethod
    def isinstance(arg: Any) -> bool: ...

# TODO: Auto-generated. Audit and fix.
class F64Type(Type):
    def __init__(self, cast_from_type: Type) -> None: ...
    @staticmethod
    def get(*args, **kwargs) -> F64Type: ...
    @staticmethod
    def isinstance(arg: Any) -> bool: ...

# TODO: Auto-generated. Audit and fix.
class FlatSymbolRefAttr(Attribute):
    def __init__(self, cast_from_attr: Attribute) -> None: ...
    @staticmethod
    def get(*args, **kwargs) -> FlatSymbolRefAttr: ...
    @staticmethod
    def isinstance(arg: Any) -> bool: ...
    @property
    def type(self) -> Type: ...
    @property
    def value(self) -> str: ...

# TODO: Auto-generated. Audit and fix.
class FloatAttr(Attribute):
    def __init__(self, cast_from_attr: Attribute) -> None: ...
    @staticmethod
    def get(*args, **kwargs) -> FloatAttr: ...
    @staticmethod
    def get_f32(*args, **kwargs) -> FloatAttr: ...
    @staticmethod
    def get_f64(*args, **kwargs) -> FloatAttr: ...
    @staticmethod
    def isinstance(arg: Any) -> bool: ...
    @property
    def type(self) -> Type: ...
    @property
    def value(self) -> float: ...

# TODO: Auto-generated. Audit and fix.
class FunctionType(Type):
    def __init__(self, cast_from_type: Type) -> None: ...
    @staticmethod
    def get(*args, **kwargs) -> FunctionType: ...
    @staticmethod
    def isinstance(arg: Any) -> bool: ...
    @property
    def inputs(self) -> list: ...
    @property
    def results(self) -> list: ...

# TODO: Auto-generated. Audit and fix.
class IndexType(Type):
    def __init__(self, cast_from_type: Type) -> None: ...
    @staticmethod
    def get(*args, **kwargs) -> IndexType: ...
    @staticmethod
    def isinstance(arg: Any) -> bool: ...

class InferShapedTypeOpInterface:
    def __init__(self, object: object, context: Optional[Context] = None) -> None: ...
    def inferReturnTypeComponents(self, operands: Optional[List] = None, attributes: Optional[Attribute] = None, properties = None, regions: Optional[List[Region]] = None, context: Optional[Context] = None, loc: Optional[Location] = None) -> List[ShapedTypeComponents]: ...
    @property
    def operation(self) -> Operation: ...
    @property
    def opview(self) -> OpView: ...

class InferTypeOpInterface:
    def __init__(self, object: object, context: Optional[Context] = None) -> None: ...
    def inferReturnTypes(self, operands: Optional[List] = None, attributes: Optional[Attribute] = None, properties = None, regions: Optional[List[Region]] = None, context: Optional[Context] = None, loc: Optional[Location] = None) -> List[Type]: ...
    @property
    def operation(self) -> Operation: ...
    @property
    def opview(self) -> OpView: ...

class InsertionPoint:
    current: ClassVar[InsertionPoint] = ...  # read-only
    @overload
    def __init__(self, block: Block) -> None: ...
    @overload
    def __init__(self, beforeOperation: _OperationBase) -> None: ...
    @staticmethod
    def at_block_begin(block: Block) -> InsertionPoint: ...
    @staticmethod
    def at_block_terminator(block: Block) -> InsertionPoint: ...
    def insert(self, operation: _OperationBase) -> None: ...
    def __enter__(self) -> InsertionPoint: ...
    def __exit__(self, arg0: object, arg1: object, arg2: object) -> None: ...
    @property
    def block(self) -> Block: ...

# TODO: Auto-generated. Audit and fix.
class IntegerAttr(Attribute):
    def __init__(self, cast_from_attr: Attribute) -> None: ...
    @staticmethod
    def get(*args, **kwargs) -> IntegerAttr: ...
    @staticmethod
    def isinstance(arg: Any) -> bool: ...
    @property
    def type(self) -> Type: ...
    @property
    def value(self) -> int: ...

# TODO: Auto-generated. Audit and fix.
class IntegerSet:
    def __init__(self, *args, **kwargs) -> None: ...
    def _CAPICreate(self) -> IntegerSet: ...
    def dump(self) -> None: ...
    @staticmethod
    def get(*args, **kwargs) -> IntegerSet: ...
    @staticmethod
    def get_empty(*args, **kwargs) -> IntegerSet: ...
    def get_replaced(self, dim_exprs: list, symbol_exprs: list, num_result_dims: int, num_result_symbols: int) -> IntegerSet: ...
    @overload
    def __eq__(self, arg0: IntegerSet) -> bool: ...
    @overload
    def __eq__(self, arg0: object) -> bool: ...
    def __hash__(self) -> int: ...
    @property
    def _CAPIPtr(self) -> object: ...
    @property
    def constraints(self) -> Any: ...
    @property
    def context(self) -> Context: ...
    @property
    def is_canonical_empty(self) -> bool: ...
    @property
    def n_dims(self) -> int: ...
    @property
    def n_equalities(self) -> int: ...
    @property
    def n_inequalities(self) -> int: ...
    @property
    def n_inputs(self) -> int: ...
    @property
    def n_symbols(self) -> int: ...

# TODO: Auto-generated. Audit and fix.
class IntegerSetConstraint:
    def __init__(self, *args, **kwargs) -> None: ...
    @property
    def expr(self) -> AffineExpr: ...
    @property
    def is_eq(self) -> bool: ...

# TODO: Auto-generated. Audit and fix.
class IntegerSetConstraintList:
    def __init__(self, *args, **kwargs) -> None: ...
    def __add__(self, arg0: IntegerSetConstraintList) -> List[IntegerSetConstraint]: ...
    @overload
    def __getitem__(self, arg0: int) -> IntegerSetConstraint: ...
    @overload
    def __getitem__(self, arg0: slice) -> IntegerSetConstraintList: ...
    def __len__(self) -> int: ...

# TODO: Auto-generated. Audit and fix.
class IntegerType(Type):
    def __init__(self, cast_from_type: Type) -> None: ...
    @staticmethod
    def get_signed(*args, **kwargs) -> IntegerType: ...
    @staticmethod
    def get_signless(*args, **kwargs) -> IntegerType: ...
    @staticmethod
    def get_unsigned(*args, **kwargs) -> IntegerType: ...
    @staticmethod
    def isinstance(arg: Any) -> bool: ...
    @property
    def is_signed(self) -> bool: ...
    @property
    def is_signless(self) -> bool: ...
    @property
    def is_unsigned(self) -> bool: ...
    @property
    def width(self) -> int: ...

class Location:
    current: ClassVar[Location] = ...  # read-only
    __hash__: ClassVar[None] = ...  # type: ignore
    def _CAPICreate(self) -> Location: ...
    @staticmethod
    def callsite(callee: Location, frames: Sequence[Location], context: Optional[Context] = None) -> Location: ...
    @staticmethod
    def file(filename: str, line: int, col: int, context: Optional[Context] = None) -> Location: ...
    @staticmethod
    def fused(locations: Sequence[Location], metadata: Optional[Attribute] = None, context: Optional[Context] = None) -> Location: ...
    @staticmethod
    def name(name: str, childLoc: Optional[Location] = None, context: Optional[Context] = None) -> Location: ...
    @staticmethod
    def unknown(context: Optional[Context] = None) -> Any: ...
    def __enter__(self) -> Location: ...
    @overload
    def __eq__(self, arg0: Location) -> bool: ...
    @overload
    def __eq__(self, arg0: object) -> bool: ...
    def __exit__(self, arg0: object, arg1: object, arg2: object) -> None: ...
    @property
    def _CAPIPtr(self) -> object: ...
    @property
    def context(self) -> Context: ...

# TODO: Auto-generated. Audit and fix.
class MemRefType(ShapedType):
    def __init__(self, cast_from_type: Type) -> None: ...
    @staticmethod
    def get(*args, **kwargs) -> MemRefType: ...
    @staticmethod
    def isinstance(arg: Any) -> bool: ...
    @property
    def affine_map(self) -> AffineMap: ...
    @property
    def layout(self) -> Attribute: ...
    @property
    def memory_space(self) -> Attribute: ...

class Module:
    def _CAPICreate(self) -> object: ...
    @staticmethod
    def create(loc: Optional[Location] = None) -> Module: ...
    def dump(self) -> None: ...
    @staticmethod
    def parse(asm: str, context: Optional[Context] = None) -> Module: ...
    @property
    def _CAPIPtr(self) -> object: ...
    @property
    def body(self) -> Block: ...
    @property
    def context(self) -> Context: ...
    @property
    def operation(self) -> Operation: ...

class MLIRError(Exception):
    def __init__(self, message: str, error_diagnostics: List[DiagnosticInfo]) -> None: ...

class NamedAttribute:
    @property
    def attr(self) -> Attribute: ...
    @property
    def name(self) -> str: ...

# TODO: Auto-generated. Audit and fix.
class NoneType(Type):
    def __init__(self, cast_from_type: Type) -> None: ...
    @staticmethod
    def get(*args, **kwargs) -> NoneType: ...
    @staticmethod
    def isinstance(arg: Any) -> bool: ...

class OpaqueType(Type):
    def __init__(self, cast_from_type: Type) -> None: ...
    @staticmethod
    def get(*args, **kwargs) -> OpaqueType: ...
    @staticmethod
    def isinstance(arg: Any) -> bool: ...
    @property
    def dialect_namespace(self) -> str: ...
    @property
    def data(self) -> str: ...

class OpAttributeMap:
    def __contains__(self, arg0: str) -> bool: ...
    def __delitem__(self, arg0: str) -> None: ...
    @overload
    def __getitem__(self, arg0: str) -> Attribute: ...
    @overload
    def __getitem__(self, arg0: int) -> NamedAttribute: ...
    def __len__(self) -> int: ...
    def __setitem__(self, arg0: str, arg1: Attribute) -> None: ...

class OpOperandList:
    def __add__(self, arg0: OpOperandList) -> List[Value]: ...
    @overload
    def __getitem__(self, arg0: int) -> Value: ...
    @overload
    def __getitem__(self, arg0: slice) -> OpOperandList: ...
    def __len__(self) -> int: ...
    def __setitem__(self, arg0: int, arg1: Value) -> None: ...

class OpResult(Value):
    def __init__(self, value: Value) -> None: ...
    @staticmethod
    def isinstance(arg: Any) -> bool: ...
    @property
    def owner(self) -> _OperationBase: ...
    @property
    def result_number(self) -> int: ...

class OpResultList:
    def __add__(self, arg0: OpResultList) -> List[OpResult]: ...
    @overload
    def __getitem__(self, arg0: int) -> OpResult: ...
    @overload
    def __getitem__(self, arg0: slice) -> OpResultList: ...
    def __len__(self) -> int: ...
    @property
    def types(self) -> List[Type]: ...

class OpView(_OperationBase):
    _ODS_OPERAND_SEGMENTS: ClassVar[None] = ...
    _ODS_REGIONS: ClassVar[tuple] = ...
    _ODS_RESULT_SEGMENTS: ClassVar[None] = ...
    def __init__(self, operation: _OperationBase) -> None: ...
    @classmethod
    def build_generic(
        cls: _Type[_TOperation],
        results: Optional[Sequence[Type]] = None,
        operands: Optional[Sequence[Value]] = None,
        attributes: Optional[Dict[str, Attribute]] = None,
        successors: Optional[Sequence[Block]] = None,
        regions: Optional[int] = None,
        loc: Optional[Location] = None,
        ip: Optional[InsertionPoint] = None) -> _TOperation: ...
    @property
    def operation(self) -> Operation: ...
    @property
    def opview(self) -> "OpView": ...

class Operation(_OperationBase):
    def _CAPICreate(self) -> object: ...
    @staticmethod
    def create(name: str, results: Optional[Sequence[Type]] = None,
        operands: Optional[Sequence[Value]] = None,
        attributes: Optional[Dict[str, Attribute]] = None,
        successors: Optional[Sequence[Block]] = None,
        regions: int = 0,
        loc: Optional[Location] = None,
        ip: Optional[InsertionPoint] = None) -> _OperationBase: ...
    def erase(self) -> None: ...
    @property
    def _CAPIPtr(self) -> object: ...
    @property
    def operation(self) -> "Operation": ...
    @property
    def opview(self) -> OpView: ...

class OperationIterator:
    def __iter__(self) -> OperationIterator: ...
    def __next__(self) -> OpView: ...

class OperationList:
    def __getitem__(self, arg0: int) -> OpView: ...
    def __iter__(self) -> OperationIterator: ...
    def __len__(self) -> int: ...

# TODO: Auto-generated. Audit and fix.
class RankedTensorType(ShapedType):
    def __init__(self, cast_from_type: Type) -> None: ...
    @staticmethod
    def get(*args, **kwargs) -> RankedTensorType: ...
    @staticmethod
    def isinstance(arg: Any) -> bool: ...
    @property
    def encoding(self) -> Optional[Attribute]: ...

class Region:
    __hash__: ClassVar[None] = ...  # type: ignore
    @overload
    def __eq__(self, arg0: Region) -> bool: ...
    @overload
    def __eq__(self, arg0: object) -> bool: ...
    def __iter__(self) -> BlockIterator: ...
    @property
    def blocks(self) -> BlockList: ...
    @property
    def owner(self) -> OpView: ...

class RegionIterator:
    def __iter__(self) -> RegionIterator: ...
    def __next__(self) -> Region: ...

class RegionSequence:
    def __getitem__(self, arg0: int) -> Region: ...
    def __len__(self) -> int: ...

# TODO: Auto-generated. Audit and fix.
class ShapedType(Type):
    def __init__(self, cast_from_type: Type) -> None: ...
    def get_dim_size(self, dim: int) -> int: ...
    def is_dynamic_dim(self, dim: int) -> bool: ...
    def is_dynamic_size(self, *args, **kwargs) -> Any: ...
    def is_dynamic_stride_or_offset(self, dim_size: int) -> bool: ...
    @staticmethod
    def isinstance(arg: Any) -> bool: ...
    @property
    def element_type(self) -> Type: ...
    @property
    def has_rank(self) -> bool: ...
    @property
    def has_static_shape(self) -> bool: ...
    @property
    def rank(self) -> int: ...
    @property
    def shape(self) -> List[int]: ...

class ShapedTypeComponents:
    @property
    def element_type(self) -> Type: ...
    @staticmethod
    def get(*args, **kwargs) -> ShapedTypeComponents: ...
    @property
    def has_rank(self) -> bool: ...
    @property
    def rank(self) -> int: ...
    @property
    def shape(self) -> List[int]: ...

# TODO: Auto-generated. Audit and fix.
class StringAttr(Attribute):
    def __init__(self, cast_from_attr: Attribute) -> None: ...
    @staticmethod
    def get(*args, **kwargs) -> Any: ...
    @staticmethod
    def get_typed(*args, **kwargs) -> Any: ...
    @staticmethod
    def isinstance(arg: Any) -> bool: ...
    @property
    def type(self) -> Type: ...
    @property
    def value(self) -> str: ...

class SymbolTable:
    def __init__(self, arg0: _OperationBase) -> None: ...
    def erase(self, operation: _OperationBase) -> None: ...
    @staticmethod
    def get_symbol_name(symbol: _OperationBase) -> Attribute: ...
    @staticmethod
    def get_visibility(symbol: _OperationBase) -> Attribute: ...
    def insert(self, operation: _OperationBase) -> Attribute: ...
    @staticmethod
    def replace_all_symbol_uses(old_symbol: str, new_symbol: str, from_op: _OperationBase) -> None: ...
    @staticmethod
    def set_symbol_name(symbol: _OperationBase, name: str) -> None: ...
    @staticmethod
    def set_visibility(symbol: _OperationBase, visibility: str) -> None: ...
    @staticmethod
    def walk_symbol_tables(from_op: _OperationBase, all_sym_uses_visible: bool, callback: Callable[[_OperationBase, bool], None]) -> None: ...
    def __contains__(self, arg0: str) -> bool: ...
    def __delitem__(self, arg0: str) -> None: ...
    def __getitem__(self, arg0: str) -> OpView: ...

# TODO: Auto-generated. Audit and fix.
class TupleType(Type):
    def __init__(self, cast_from_type: Type) -> None: ...
    @staticmethod
    def get_tuple(*args, **kwargs) -> TupleType: ...
    def get_type(self, pos: int) -> Type: ...
    @staticmethod
    def isinstance(arg: Any) -> bool: ...
    @property
    def num_types(self) -> int: ...

# TODO: Auto-generated. Audit and fix.
class TypeAttr(Attribute):
    def __init__(self, cast_from_attr: Attribute) -> None: ...
    @staticmethod
    def get(*args, **kwargs) -> Any: ...
    @staticmethod
    def isinstance(arg: Any) -> bool: ...
    @property
    def type(self) -> Type: ...
    @property
    def value(self) -> Type: ...

# TODO: Auto-generated. Audit and fix.
class UnitAttr(Attribute):
    def __init__(self, cast_from_attr: Attribute) -> None: ...
    @staticmethod
    def get(*args, **kwargs) -> Any: ...
    @staticmethod
    def isinstance(arg: Any) -> bool: ...
    @property
    def type(self) -> Type: ...

# TODO: Auto-generated. Audit and fix.
class UnrankedMemRefType(ShapedType):
    def __init__(self, cast_from_type: Type) -> None: ...
    @staticmethod
    def get(*args, **kwargs) -> UnrankedMemRefType: ...
    @staticmethod
    def isinstance(arg: Any) -> bool: ...
    @property
    def memory_space(self) -> Attribute: ...

# TODO: Auto-generated. Audit and fix.
class UnrankedTensorType(ShapedType):
    def __init__(self, cast_from_type: Type) -> None: ...
    @staticmethod
    def get(*args, **kwargs) -> UnrankedTensorType: ...
    @staticmethod
    def isinstance(arg: Any) -> bool: ...

# TODO: Auto-generated. Audit and fix.
class VectorType(ShapedType):
    def __init__(self, cast_from_type: Type) -> None: ...
    @staticmethod
    def get(*args, **kwargs) -> VectorType: ...
    @staticmethod
    def isinstance(arg: Any) -> bool: ...

class _GlobalDebug:
    flag: ClassVar[bool] = ...