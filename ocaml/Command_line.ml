type argument = With_arg | Without_arg | With_opt_arg 

let anon_args = ref []
and header_doc = ref ""
and footer_doc = ref ""
and specs = ref []

let set_header_doc s = header_doc := s
let set_footer_doc s = footer_doc := s

let dict = 
  let d = Hashtbl.create 67 in
  d

let get x = 
  try Some (Hashtbl.find dict x)
  with Not_found -> None

let get_bool x = 
  Hashtbl.mem dict x

let show_help () =
  get_bool "help"

let anonymous ?(optional=false) name doc =
  ( ' ', name, doc, 
    if optional then With_opt_arg else Without_arg
  )

let help () =

  Format.printf "@[%s@]@.@." !header_doc;
  let get_param_from_doc doc =
      match Str.split (Str.regexp "[ \n\r\x0c\t]+") doc with
      | param :: doc -> param, (String.concat " " doc)
      | _ -> failwith "Bad format for documentation"
  in

  let anon = 
    List.filter (fun (x,_,_,_) -> x = ' ') !specs
    |> List.map (fun x ->
      match x with 
      | (_,name,doc,Without_arg) -> (name,doc,false)
      | (_,name,doc,_)  -> (name,doc,true)
      )
  in

  let options = 
    List.filter (fun (x,_,_,_) -> x <> ' ') !specs
    |> List.sort (fun (x,_,_,_) (y,_,_,_) -> Char.compare x y)
    |> List.map (fun x ->
      match x with
      | (short,long,doc,With_arg) -> (* with arg *)
            let param, doc = get_param_from_doc doc in
            (Printf.sprintf "-%c %s" short param,
             Printf.sprintf "--%s=%s" long  param,
             doc) 
      | (short,long,doc,Without_arg) ->  (* without arg *)
            (Printf.sprintf "-%c" short,
             Printf.sprintf "--%s" long,
             doc) 
      | (short,long,doc,With_opt_arg) -> (* with or without arg *)
            let param, doc = get_param_from_doc doc in
            (Printf.sprintf "-%c [%s]" short param,
             Printf.sprintf "--%s[=%s]" long  param,
             doc) 
      ) 
  in
        
  let max_short =
    List.map (fun (x,_,_) -> String.length x) options
    |> List.fold_left max 0
  in

  let max_long  =
    List.map (fun (_,x,_) -> String.length x) options
    |> List.fold_left max 0
  in

  let fmt_opt max_w o = 
    let l = String.length o in
    o^(String.make (max_w-l) ' ')
  in


  let output_option ?(fixed_width=false) (short, long, doc) = 
      if fixed_width then
        Format.printf "@[%s  %s@]" 
          (fmt_opt max_short short) (fmt_opt max_long long)
      else
        Format.printf "@[%s|%s@]" short long
  in

  let output_anon ?(fixed_width=false) (name, doc, optional) = 
      if optional then
        Format.printf "@[[%s]@]" name
      else
        Format.printf "@[%s@]" name
  in

  Format.printf "@[<v>@[<v 2>Usage:@,@,@[<hov 4>@[%s@]" Sys.argv.(0);
  List.iter (fun x -> 
    Format.printf "@ @[[";
    output_option ~fixed_width:false x;
    Format.printf "]@]"
    ) options;
  Format.printf "@ @[[--]@]";
  List.iter (fun x -> 
    Format.printf "@ @[";
    output_anon ~fixed_width:false x;
    Format.printf "@]"
    ) anon;
  Format.printf "@]@]@,@,";
    
  Format.printf "@[<v>Arguments:@,";

  Format.printf "@[<v 2>@," ;
  List.iter (fun (name,doc,optional) ->
    Format.printf "@[<h>";
    output_anon ~fixed_width:true (name,doc,optional);
    Format.printf "@   @[<v 0>%s@]@]@," doc
    ) anon;
  Format.printf "@]@;";

  Format.printf "@[<v>Options:@,";

  Format.printf "@[<v 2>@," ;
  List.iter (fun (short,long,doc) ->
    Format.printf "@[<h>";
    output_option ~fixed_width:true (short,long,doc);
    Format.printf "@   @[<v 0>%s@]@]@," doc
    ) options;
  Format.printf "@]@;";

  Format.printf "@[%s@]@." !footer_doc

let set_specs specs_in =
  specs := ( 'h', "help", "Prints the help message", Without_arg) :: specs_in;

  let specs = 
    List.filter (fun (x,_,_,_) -> x != ' ') !specs
    |> List.map (fun x ->
     match x with
     | (short, long, doc, With_arg) ->
         (short, long, None, Some (fun x -> Hashtbl.replace dict long x) )
     | (short, long, doc, Without_arg) ->
         (short, long, Some (fun () -> Hashtbl.replace dict long ""), None)
     | (short, long, doc, With_opt_arg) ->
         (short, long, Some (fun () -> Hashtbl.replace dict long ""),
         Some (fun x -> Hashtbl.replace dict long x) )
    ) 
  in

  Getopt.parse_cmdline specs (fun x -> anon_args := !anon_args @ [x]);

  if show_help () then
      (help () ; exit 0)

let anon_args () = !anon_args


