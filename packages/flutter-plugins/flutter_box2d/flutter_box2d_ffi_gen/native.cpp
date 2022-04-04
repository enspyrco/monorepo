/// A shape is used for collision detection. You can create a shape however you like.
/// Shapes used for simulation in b2World are created automatically when a b2Fixture
/// is created. Shapes may encapsulate a one or more child shapes.
enum b2ShapeType
{
	e_circle = 0,
	e_edge = 1,
	e_polygon = 2,
	e_chain = 3,
	e_typeCount = 4
};
