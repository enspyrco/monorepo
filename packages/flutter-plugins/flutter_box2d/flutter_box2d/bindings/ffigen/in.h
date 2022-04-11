// This is the minimal part of the C++ glue from emscripten that was creating errors

typedef unsigned long           uintptr_t;

struct b2BodyUserData
{
	b2BodyUserData()
	{
		pointer = 0;
	}

	/// For legacy compatibility
	uintptr_t pointer;
};
