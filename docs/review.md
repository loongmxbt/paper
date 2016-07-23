评阅
review 由 professor 创建

一条review由一个paper，一个prof，一个status，一个content
review
has_one paper
has_one professor

paper_id belongs_to paper
user_id (role = prefessor)
status
content

mix phoenix.gen.model Review reviews status_id:references:statuses paper_id:references:papers user_id:references:users content:text

mix phoenix.gen.model Status statuses name:string

paper has_many reviews
