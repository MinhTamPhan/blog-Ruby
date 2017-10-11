$("#frmsignup").validate({
  rules: {
    'account[email]': {
      required: true,
      email: true
    },
    'account[fullname]':{
      required: true,
    },
    'account[password]': {
      required: true,
      minlength: 6,
    },
    'account[password_confirmation]': {
      equalTo: "#fpassword"
    }
  },
  messages: {
    'account[email]': {
      required: "We need your email address to contact you",
      email: "Your email address must be in the format of name@domain.com"
    },
    'account[fullname]':{
      required: "We need your name to contact you",
    },
    'account[password]': {
      minlength: 'minimum 6 character'
    },
    'account[password_confirmation]': {
      equalTo: 'Same value password'
    }
  }
});
