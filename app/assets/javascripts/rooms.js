function validateRoom(){
  $("#new_room").validate({
    debug: true,
    rules: {
      "room[name]": { required: true },
      "room[email]": { required: true, email: true }
    }
  });
}
