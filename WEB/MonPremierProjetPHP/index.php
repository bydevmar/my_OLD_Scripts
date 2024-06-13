
<?php
	class personne
	{
		public $nom;
		public $prenom;
		public $age;
		public $telephones;

		public function getNom()
		{
			return $nom;
		}
		public function setNom($nom)
		{
			$this->nom = $nom;
		}

		public function getPrenom()
		{
			return $prenom;
		}
		public function setPrenom($prenom)
		{
			$this->prenom = $prenom;
		}

		public function getAge()
		{
			return $age;
		}
		public function setAge($age)
		{
			$this->age = $age;
		}

		public function getPhones()
		{
			return $telephones;
		}
		public function setPhones($telephones)
		{
			$this->telephones = $telephones;
		}

		public function __construct($nom, $prenom, $age, $telephones)
		{
			$this->nom = $nom;
			$this->prenom = $prenom;
			$this->age = $age;
			$this->telephones = $telephones;
		}

	}

	class MyObject
	{
		public $pers;
		public $arr;
	}

	$pers = new personne("Khalid", "Youssef", 23, ["0102030405", "0908070506"]);

	$arr = ["key1" => "value1", "key2" => "value2", "key3" => "value3"];

	$obj = new MyObject();
	$obj->pers = $pers;
	$obj->arr = $arr;

	echo json_encode($obj);
?>
