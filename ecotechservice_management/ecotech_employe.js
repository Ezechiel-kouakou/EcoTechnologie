 async function handleAuth(action) {
        const formData = new FormData(document.getElementById("authForm"));
        const res = await fetch(`employe.php?action=${action}`, {
          method: "POST",
          body: formData,
        });
        const data = await res.json();

        if (data.status === "success") {
          if (action === "login") window.location.href = "dashboard.html";
          else alert("Inscription réussie, vous pouvez vous connecter.");
        } else {
          alert(data.message);
        }
      }