

export function unNull(variable : unknown, message: string) : NonNullable<unknown> {
  if (variable === null || typeof variable === "undefined") {
    throw Error(message);
  }

  return variable;
}