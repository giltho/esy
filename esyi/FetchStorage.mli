(**
 * Package storage.
 *)

(** Distribution. *)
module Dist : sig
  type t
  val id : t -> Solution.Id.t
  val source : t -> Source.t
  val pp : Format.formatter -> t -> unit
end

val fetch :
  cfg : Config.t
  -> Solution.Record.t
  -> Dist.t RunAsync.t
(**
 * Make sure package specified by [name], [version] and [source] is in store and
 * return it.
 *)

val unpack :
  cfg : Config.t
  -> Dist.t
  -> Path.t RunAsync.t
(**
 * Unpack fetched dist from storage into source cache and return path.
 *)

val install :
  cfg : Config.t
  -> path : Path.t
  -> Dist.t
  -> unit RunAsync.t
(**
 * Install fetched dist from storage into destination.
 *)
